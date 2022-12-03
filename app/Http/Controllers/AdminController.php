<?php

namespace App\Http\Controllers;

use DB;
use Session;
use App\Models\Plan;
use App\Models\Team;
use App\Models\User;
use Illuminate\Http\Request;
use App\Models\Subscriptions;
use App\Stripe\StripeCustomer;
use Laravel\Jetstream\Jetstream;
use Laravel\Fortify\Rules\Password;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use App\Actions\Fortify\CreateNewUser;
use App\Models\SubscriptionCancelation;
use Doctrine\Inflector\Rules\Substitution;
use Illuminate\Support\Facades\Validator;
use Illuminate\Contracts\Auth\StatefulGuard;
use Laravel\Cashier\Subscription;

use Carbon\Carbon;

class AdminController extends Controller
{
    
    /**
     * The guard implementation.
     *
     * @var \Illuminate\Contracts\Auth\StatefulGuard
     */
    protected $guard;
    protected $stripeCustomer;

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

    // Dashboard
    public function index()
    {
        $pageConfigs = ['pageHeader' => false];

        return view('/admin/dashboard', ['pageConfigs' => $pageConfigs]);
    }

    // Customers List Page
    public function customers()
    {
        $pageConfigs = ['pageHeader' => false];
        if (Auth::User()->role_id == 0){
            return view('/admin/customers/index', ['pageConfigs' => $pageConfigs]);
          }
          else{
            return view('/errors/404');
          }
    }

    // All customer list
    public function customerslist()
    {
        $documents = User::where('role_id', '=', 1)->get()->map(function ($user) {
            return [
                'id' => $user->id,
                'firstname' => $user->firstname,
                'lastname' => $user->lastname,
                'email' => $user->email,
                'profile_photo_path' => $user->profile_photo_path,
                'is_verified' => $user->email_verified_at != null ? 'verified' : 'unverified',
                'plans' => $user->plan,
                'status' => $user->status,
                'created_at' => $user->created_at,
            ];
        });
        return response()->json(['data' => $documents]);
    }

    public function planName($planId)
    {
        $plans = Plan::where('id', '=', $planId)->select('title')->first();

        if (isset($plans)) {
            return $plans->title;
        } else {
            return null;
        }
    }


    // Customers Settings account
    public function customers_account($id)
    {
        $breadcrumbs = [['link' => "/", 'name' => "Home"], ['link' => "javascript:void(0)", 'name' => "Account Settings"], ['name' => "Account"]];

        $user = User::where('id', '=', $id)->with('plans')->first();
        $plans = Plan::get()->toArray();

        if (Auth::User()->role_id == 0){
            return view('/admin/customers/account', ['breadcrumbs' => $breadcrumbs, 'user' => $user, 'plans' => $plans]);
          }
          else{
            return view('/errors/404');
          }
    }

    // Account Settings security
    public function customers_security($id)
    {
        $breadcrumbs = [['link' => "/", 'name' => "Home"], ['link' => "javascript:void(0)", 'name' => "Account Settings"], ['name' => "Security"]];

        $user = User::where('id', '=', $id)->with('plans')->first();
        $plans = Plan::get()->toArray();

        if (Auth::User()->role_id == 0){
            return view('/admin/customers/security', ['breadcrumbs' => $breadcrumbs, 'user' => $user, 'plans' => $plans]);
          }
          else{
            return view('/errors/404');
          }
    }

    public function customers_query()
    {
        $documents = DB::select("SELECT users.*, sub.name as subs  FROM users
        LEFT JOIN subscriptions sub on is_subscription = sub.id
        WHERE role_id = 2");
        $documents = json_encode($documents);
        $documents =  '{ "data":' . $documents . "}";
        return $documents;
    }

    // Account Settings billing
    public function customers_billing($id)
    {
        $breadcrumbs = [['link' => "/", 'name' => "Home"], ['link' => "javascript:void(0)", 'name' => "Account Settings"], ['name' => "Billing & Plans"]];
        $user = User::where('id', '=', $id)->with('plans')->first();
        $plans = Plan::get()->toArray();
        if (Auth::User()->role_id == 0){
            return view('/admin/customers/billing', ['breadcrumbs' => $breadcrumbs, 'user' => $user, 'plans' => $plans]);
          }
          else{
            return view('/errors/404');
          }
    }


    // Plans Page
    public function plans()
    {
        $pageConfigs = ['pageHeader' => false];
        if (Auth::User()->role_id == 0){
            return view('/admin/plans', ['pageConfigs' => $pageConfigs]);
          }
          else{
            return view('/errors/404');
          }
    }

    // Coupons Page
    public function coupon_query()
    {
        $documents = DB::select("SELECT * FROM coupons");
        $documents = json_encode($documents);
        $documents =  '{ "data":' . $documents . "}";
        return $documents;
    }

    // Subscriptions Page
    public function subscriptions()
    {
        $pageConfigs = ['pageHeader' => false];
        if (Auth::User()->role_id == 0){
            return view('/admin/subscriptions', [
                'pageConfigs' => $pageConfigs, 'subscription' => currentTeam()->presentSubscription(),
                'invoice' => currentTeam()->presentUpcomingInvoice(),
                'customer' => currentTeam()->presentCustomer()
            ]);
          }
          else{
            return view('/errors/404');
          }
    }

    // Subscriptions Query Page
    public function query_subscriptions()
    {
        $subscriptions = DB::select("SELECT su.*, te.name as team FROM subscriptions su INNER JOIN teams te on su.team_id = te.id WHERE stripe_status = 'active'");
        $subscriptions = json_encode($subscriptions);
        $subscriptions =  '{ "data":' . $subscriptions . "}";
        return $subscriptions;
    }

    // subscriptions-cancel Page
    public function subscriptions_cancel()
    {
        $subscriptions = SubscriptionCancelation::all();
        $pageConfigs = ['pageHeader' => false];
        if (Auth::User()->role_id == 0){
            return view('/admin/subscriptions-cancel', ['pageConfigs' => $pageConfigs, 'subscribtions' => $subscriptions]);
          }
          else{
            return view('/errors/404');
          }
    }

    // Cancel Subscriptions Query Page
    public function query_cancel_subscriptions()
    {
        $subscriptions = DB::select("SELECT su.*, te.name as team FROM subscriptions su INNER JOIN teams te on su.team_id = te.id WHERE stripe_status = 'cancel'");
        $subscriptions = json_encode($subscriptions);
        $subscriptions =  '{ "data":' . $subscriptions . "}";
        return $subscriptions;
    }

    // Account Settings account
    public function settings_account()
    {
        $breadcrumbs = [['link' => "/", 'name' => "Home"], ['link' => "javascript:void(0)", 'name' => "Account Settings"], ['name' => "Account"]];
        if (Auth::User()->role_id == 0){
            return view('/admin/settings/account', ['breadcrumbs' => $breadcrumbs]);
          }
          else{
            return view('/errors/404');
          }
    }

    // Account Settings security
    public function settings_security()
    {
        $breadcrumbs = [['link' => "/", 'name' => "Home"], ['link' => "javascript:void(0)", 'name' => "Account Settings"], ['name' => "Security"]];
        if (Auth::User()->role_id == 0){
            return view('/admin/settings/security', ['breadcrumbs' => $breadcrumbs]);
          }
          else{
            return view('/errors/404');
          }
    }

    public function register_user(Request $request)
    {
        //dd($request->all());
        $requestData = $request->all()['inputs'];
        //return $requestData;
        $validator = Validator::make($request->all()['inputs'], [
            'name' => 'required',
            'email' => 'required|email|unique:users',
            'password' => 'required|confirmed|min:8',
            'plan_id' => 'required',
        ]);

        if ($validator->passes()) {
            if (isset($requestData['plan_id'])) {
                $is_subscription = 1;
                $plan_id = $requestData['plan_id'];
            } else {
                $is_subscription = 0;
                $plan_id = null;
            }


            $newUser = new CreateNewUser();
            $user = $newUser->create([
                'name' => $requestData['name'],
                'email' => $requestData['email'],
                'firstname' => $requestData['firstname'],
                'lastname' => $requestData['lastname'],
                'address' => $requestData['address'],
                'phone' => $requestData['phone'],
                'postcode' => $requestData['postcode'],
                'city' => $requestData['city'],
                'country' => $requestData['country'],
                'password' => $requestData['password'],
                'password_confirmation' => $requestData['password_confirmation'],
                'is_subscription' => $is_subscription,
                'plan_id' => $plan_id,
                'role_id' => 1,
                'status' => 'active'
            ]);

            $this->guard->login($user);

            // GetPlan
            $plans = Plan::where('id', '=', $requestData['plan_id'])->first();

            $users = DB::getPdo()->lastInsertId();

            $getPlan = Plan::where('id', '=', $plan_id)->select('free_billing')->first();

            if (isset($getPlan->free_billing) == null) {

                // create PaymentMethod
                $paymentMethod = $this->stripeCustomer->createPaymentMethod($requestData['addCardNumber'], $requestData['addCardExpiryDate'], $requestData['addCardCvv']);

                //   Create New Stripe customer
                if (is_null(auth()->user()->stripe_id) || empty(auth()->user()->stripe_id)) {
                    $fullname = auth()->user()->firstname . ' ' . auth()->user()->lastname;
                    $name = $fullname;
                    $address = [
                        "line1" => auth()->user()->address,
                        "line2" => "",
                        "city" => auth()->user()->city,
                        "state" => "",
                        "postal_code" => auth()->user()->postcode,
                        "country" => auth()->user()->country
                    ];
                    $email = (auth()->user()->email) ? auth()->user()->email : null;
                    $customer = $this->stripeCustomer->createSubscriptionCustomer($name, $email, $address, $paymentMethod->id);
                }

                //stripe customer id
                $customer_id = auth()->user()->stripe_id;

                // Subscribe customer to a plan
                $subscription = $this->stripeCustomer->createSubscription($plans->stripe_id, $customer_id, $plans->trial_period_days);

                // Team id
                $temas = Team::where('user_id', '=', Auth::id())->first();

                $sub = Subscriptions::create([
                    'team_id' => $temas->id,
                    'name' => $plans->title,
                    'stripe_id' => auth()->user()->stripe_subscriptionId,
                    'stripe_status' => $subscription->status,
                    'stripe_plan' => $plans->stripe_id,
                    'quantity' => 1,
                    'ends_at' => date('Y-m-d h:i:s', $subscription->current_period_end),
                    'trial_ends_at' => date('Y-m-d h:i:s', $subscription->trial_end),
                ]);


                DB::table('card')->insert([
                    'card_user_id' => $users, 'card_CardNumber' => $requestData['addCardNumber'], 'card_CardName' => $requestData['addCardName'],
                    'card_CardExpiryDate' => $requestData['addCardExpiryDate'], 'card_CardCvv' => $requestData['addCardCvv']
                ]);
            }


            DB::table('teams')->insert(['user_id' => $users, 'name' => $requestData['firstname'] . ' Teams', 'personal_team' => 1]);

            $team = DB::getPdo()->lastInsertId();

            DB::table('team_invitations')->insert(['team_id' => $team, 'email' => $requestData['email'], 'role' => 'admin']);


            Session::put('user_2fa', auth()->user()->id);

            $user->sendEmailVerificationNotification();

            return response()->json(['message' => 'success']);
        }

        return response()->json(['error' => $validator->getMessageBag()->toArray()]);
    }


    /*
     * Update user information
     */

    public function user_update(Request $request, $id)
    {
        if (isset($request->address_form) == 'address_form') {
            $attribute = $this->updateUserAddress($request, $id);
            return response()->json([
                'message' => 'success'
            ]);
        }

        if (isset($request->change_password) == 'change_password') {
            $attribute = $this->chnagePassword($request, $id);
            return response()->json([
                'message' => 'success'
            ]);
        }

        if (isset($request->update_plan) == 'update_plan') {
            $attribute = $this->updatePlan($request, $id);
            return response()->json([
                'message' => 'success'
            ]);
        }

        if (isset($request->plan_cancel) == 'plan_cancel') {

            $attribute = $this->plan_cancel($request, $id);

            return response()->json([
                'message' => 'success'
            ]);
        }
    }

    /*
     * Update User address function
     */

    public function updateUserAddress($request, $id)
    {

        $this->validate($request, [
            'email' => 'required|email',
            'firstname' => 'required',
            'lastname' => 'required',
        ]);

        $user = User::findOrFail($id);

        $user->firstname = $request->firstname;
        $user->lastname = $request->lastname;
        $user->email = $request->email;
        $user->phone = $request->phone;
        $user->n_company = $request->n_company;
        $user->vat_number = $request->vat_number;
        $user->address = $request->address;
        $user->city = $request->city;
        $user->postcode = $request->postcode;
        $user->country = $request->country;
        $user->save();
        return $user;
    }

    /*
     * Change user password
     */

    public function chnagePassword($request, $id)
    {

        $this->validate($request, [
            'password' => ['required', 'string', 'min:8', 'confirmed'],
            'password_confirmation' => ['required', 'string', 'min:8']
        ]);

        $user = User::findOrFail($id);
        $user->password = Hash::make($request->password);
        $user->save();

        return $user;
    }

    /*
     * Update user plan
     */

    public function updatePlan($request, $id)
    {

        $this->validate($request, [
            'plan_id' => ['required']
        ]);

        $user = User::findOrFail($id);
        $user->plan_id = $request->plan_id;
        $user->save();

        return $user;
    }


    /*
     * User plan cancle
     */

    public function plan_cancel($request, $id)
    {

        $user = User::findOrFail($id);
        $user->plan_id = null;
        $user->save();
        return $user;
    }


    /*
     * Delete Customer
     */

    public function customers_delete(Request $request)
    {
        $postData = $request->all();
        $userId = $postData['userId'];
        User::where('id', $userId)->delete();
    }

    // Leave
    public function admin_leave()
    {
        if(request()->ajax()) {
            $reasons = DB::table('leave_reasons')->get();

            $reasons = $reasons->map(function($v, $i) {
                $item = $v;
                $item->responsive_id = 0;
                // $item->paid = $item->paid === 1 ? 'yes' : 'no';

                $item->created_at = Carbon::parse($item->created_at)->format('d-m-Y');
                $item->updated_at = Carbon::parse($item->updated_at)->format('d-m-Y');

                return $item;
            });

            return response()->json(['data' => $reasons]);
        }

        if (Auth::User()->role_id == 0){
            return view('/admin/leave_table');
          }
          else{
            return view('/errors/404');
          }
    }

    public function admin_leave_single($id)
    {
        return response()->json([
            'data' => DB::table('leave_reasons')->find($id)
        ]);
    }

    // Save leave
    public function admin_leave_save(Request $request)
    {
        try {
            if($request->filled('reason_id')) {
                DB::table('leave_reasons')
                    ->where('id', $request->reason_id)
                    ->update([
                        'name' => $request->name,
                        'paid' => $request->paid,
                        'time_limit' => $request->limit,
                        'updated_at' => new \DateTime() 
                    ]);

            } else {
                DB::table('leave_reasons')->insert([
                    'name' => $request->name,
                    'paid' => $request->paid,
                    'time_limit' => $request->limit,
                    'created_at' => new \DateTime() 
                ]);
            }

            return response()->json(['success' => 1]);
        } catch(\Exception $e) {
            return response()->json(['success' => 0, 'message' => $e->getMessage()]);
        }
    }

    // Delete leave
    public function admin_leave_delete($id)
    {
        DB::table('leave_reasons')->where('id', $id)->delete();

        return response()->json(['success' => 1]);
    }

    // Lunch
    public function admin_lunch()
    {
        if(request()->ajax()) {
            $lunch = DB::table('lunch')->get();

            $lunch = $lunch->map(function($v, $i) {
                $item = $v;
                $item->responsive_id = 0;
                // $item->paid = $item->paid === 1 ? 'yes' : 'no';

                $item->created_at = Carbon::parse($item->created_at)->format('d-m-Y');
                $item->updated_at = Carbon::parse($item->updated_at)->format('d-m-Y');

                return $item;
            });

            return response()->json(['data' => $lunch]);
        }

        if (Auth::User()->role_id == 0){
            return view('/admin/lunch_table');
          }
          else{
            return view('/errors/404');
          }
    }

    public function admin_lunch_single($id)
    {
        return response()->json([
            'data' => DB::table('lunch')->find($id)
        ]);
    }

    // Save lunch
    public function admin_lunch_save(Request $request)
    {
        try {
            if($request->filled('lunch_id')) {
                DB::table('lunch')
                    ->where('id', $request->lunch_id)
                    ->update([
                        'name' => $request->name,
                        'paid' => $request->paid,
                        'updated_at' => new \DateTime() 
                    ]);

                    return 1;

            } else {
                DB::table('lunch')->insert([
                    'name' => $request->name,
                    'paid' => $request->paid,
                    'created_at' => new \DateTime() 
                ]);
            }

            return response()->json(['success' => 1]);
        } catch(\Exception $e) {
            return response()->json(['success' => 0, 'message' => $e->getMessage()]);
        }
    }

    // Delete leave
    public function admin_lunch_delete($id)
    {
        DB::table('lunch')->where('id', $id)->delete();

        return response()->json(['success' => 1]);
    }
}
