<?php

namespace App\Http\Controllers;

use App\Models\Plan;
use App\Models\Team;
use App\Models\User;
use Illuminate\Http\Request;
use App\Models\Subscriptions;
use App\Stripe\StripeCustomer;
use GuzzleHttp\Promise\Create;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Auth\Events\Registered;
use Illuminate\Support\Facades\Validator;
use Illuminate\Contracts\Auth\StatefulGuard;
use Laravel\Cashier\Exceptions\PaymentActionRequired;
use Session;

class RegisterController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @param  \Illuminate\Contracts\Auth\StatefulGuard  $guard
     * @return void
     */
    public function __construct(StatefulGuard $guard)
    {
        $this->guard = $guard;
        $this->stripeCustomer = new StripeCustomer;
    }

    public function register(Request $request)
    {
        $input = $request->all()['inputs'];
        Validator::make($input, [
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'password' => 'required|confirmed|min:8',
            'plan_id' => 'required',
            'firstname' => 'required',
            'lastname' => 'required',
            'address' => 'required',
            'phone' => 'required',
            'postcode' => 'required',
            'city' => 'required',
            'country' => 'required',
        ])->validate();

        if (isset($requestData['plan_id'])) {
            $is_subscription = 1;
            $plan_id = $input['plan_id'];
        } else {
            $is_subscription = 0;
            $plan_id = null;
        }

        $user = DB::transaction(function () use ($input, $is_subscription, $plan_id) {
            return tap(User::create([
                'name' => $input['name'],
                'email' => $input['email'],
                'firstname' => $input['firstname'],
                'lastname' => $input['lastname'],
                'address' => $input['address'],
                'phone' => $input['phone'],
                'postcode' => $input['postcode'],
                'city' => $input['city'],
                'country' => $input['country'],
                'password' => Hash::make($input['password']),
                'is_subscription' => $is_subscription,
                'plan_id' => $plan_id,
                'role_id' => 1,
                'status' => 'active'
            ]), function (User $user) {
                $this->createTeam($user);
            });
        });

        $this->guard->login($user);
        // GetPlan
        $plan = Plan::where('id', '=', $input['plan_id'])->first();

        if (empty($plan->free_billing)) {

            $expiration = explode('/', $input['addCardExpiryDate']);
            $address = [
                "line1" => $user->address,
                "line2" => "",
                "city" => $user->city,
                "state" => "",
                "postal_code" => $user->postcode,
                "country" => $user->country
            ];
            \Stripe\Stripe::setApiKey(config('cashier.secret'));

            $customer = currentTeam()->createOrGetStripeCustomer(
                [
                    'email' => $user->email,
                    'address' => $address,
                    'name'    => $user->firstname . ' ' . $user->lastname
                ]
            );

            $stripe = new \Stripe\StripeClient(
                config('cashier.secret')
            );
            $payment = $stripe->paymentMethods->create([
                'type' => 'card',
                'card' => [
                    'number' => $input['addCardNumber'],
                    "exp_month" => $expiration[0],
                    "exp_year"  => $expiration[1],
                    "cvc"       => $input['addCardCvv'],
                ],
                'billing_details' => [
                    'email' => $user->email,
                    'address' => $address,
                    'name'    => $user->firstname . ' ' . $user->lastname
                ]
            ]);
            $paymentMethod = $stripe->paymentMethods->attach(
                $payment->id,
                ['customer' => $customer->id]
            );

            currentTeam()->updateDefaultPaymentMethodFromStripe();

            $newsubscription = currentTeam()->newSubscription('default', $plan->stripe_id)
                ->withCoupon($input['coupon'])
                ->create($paymentMethod->id, [
                    'email' => $user->email,
                    'address' => $address,
                    'name'    => $user->firstname . ' ' . $user->lastname
                ]);
            $user->plan = $plan->title;
            $user->plan_id = $plan->id;
            $user->save();
            Session::put('user_2fa', auth()->user()->id);

            $user->sendEmailVerificationNotification();

            //return response()->json(['message' => 'successs', 'paymentmethod' => $paymentMethod, 'customer' => $customer, 'newSubsciption' => $newsubscription]);
            return response()->json(['message' => 'success']);
        } else {
            return response()->json(['message' => 'error']);
        }
    }

    /**
     * Create a personal team for the user.
     *
     * @param  \App\Models\User  $user
     * @return void
     */
    function createTeam(User $user)
    {
        $user->ownedTeams()->save(Team::forceCreate([
            'user_id' => $user->id,
            'name' => explode(' ', $user->name, 2)[0] . "'s Team",
            'personal_team' => true,
        ]));
    }
}
