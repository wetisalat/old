<?php

namespace App\Stripe;

use Illuminate\Support\Collection;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;

class StripeCustomer extends Stripe
{

    /**
     * Create Payment Method
     */

    public function createPaymentMethod($number, $expireDate, $addCardCvv){

        $str_arr = explode("/", $expireDate);

        $paymentMethod = \Stripe\PaymentMethod::create([
            'type' => 'card',
            'card' => [
                'number' => $number,
                'exp_month' => $str_arr[0],
                'exp_year' => $str_arr[1],
                'cvc' => $addCardCvv,
            ],
        ]);

        return $paymentMethod;
    }

    /**
     * create stripe customers with payment method
     * @var string|null $email
     * @var string|null $payment_method
     */
    public function createSubscriptionCustomer($name,$email,$address,$payment_method)
    {

        $customer = \Stripe\Customer::create([
            'name' => $name,
            'address' => $address,
            'email' => $email,
            'payment_method' => $payment_method,
            'invoice_settings' => [
                'default_payment_method' => $payment_method,
            ],
        ]);

        // Update stripe customer id in users table
        $user = Auth::user();
        $user->stripe_id = $customer->id;
        $user->save();

        return $customer;
    }


    /**
     * create stripe customers with payment method
     * @var string|null $email
     * @var string|null $payment_method
     */
    public function createSubscription($plan=null,$customer=null,$trial_period=null)
    {
        $subscription = \Stripe\Subscription::create([
            'customer' => $customer,
            'items' => [
                [
                    'plan' => $plan,
                ],
            ],
            'expand' => ['latest_invoice.payment_intent'],
            'trial_end' => ($trial_period > 0)? Carbon::now()->addDays($trial_period)->timestamp:null,
        ]);


        // Update stripe customer id in users table
        $user = Auth::user();
        $user->stripe_subscriptionId = $subscription->id;
        $user->is_subscription = 1;
        $user->save();

        return $subscription;
    }


}
