<?php

namespace App\Http\Controllers;

use App\Models\Plan;
use Illuminate\Http\Request;
use App\Models\SubscriptionCancelation;
use Illuminate\Support\Facades\Auth;

class SubscriptionController extends Controller
{
    public function __construct()
    {
        $this->middleware(['auth']);
    }

    public function swapPlan()
    {
        // notify()->success('Welcome to Laravel Notify ⚡️');
        if (!request()->has('plan')) {
            toastr()->error('Please select a plan !');
            return redirect()->back();
        }
        $plan = Plan::find(request()->plan);
        // test if user chose the current plan
        //dd(gettype(request()->plan));
        if (subscribed_plan()->id == request()->plan) {
            toastr()->error('You already subscribed to this plan !');
            return redirect()->back();
        }

        currentTeam()->subscription('default')
            ->swap($plan->stripe_id);
        $user = auth()->user();
        $user->plan = $plan->title;
        $user->plan_id = $plan->id;
        $user->save();

        toastr()->success(__('Subscription has been updated !'));
    }

    public function cancel(Request $request)
    {
        /**

         * @post('/cancel')
         * @name('')
         * @middlewares(web, auth, subscribed)
         */
        $subscription = currentTeam()->subscription('default');
        // dd($subscription);
        $subscription->cancel();

        SubscriptionCancelation::create([
            'team_id' => currentTeam()->id,
            'reason'  => $request->reason,
        ]);

        toastr()->success(__('Subscription has been canceled !'));
        return redirect()->back();
    }

    public function delete(Request $request)
    {
        $paymentMethod = currentTeam()->findPaymentMethod($request->id);
        $paymentMethod->delete();

        toastr()->success(__('Payment method has been deleted !'));
        return redirect()->back();
    }

    public function makeDefault($paymentID)
    {
        currentTeam()->updateDefaultPaymentMethod($paymentID);

        // $beautymail = app()->make(Beautymail::class);
        // $beautymail->send('emails.subscription.card', ['user' => currentTeam()->owner], function ($message) {
        //     $message
        //         ->from(config('mail.from.address'))
        //         ->to(currentTeam()->owner->email)
        //         ->subject(__('Default payment method changed'));
        // });

        toastr()->success(__('Payment method has been updated !'));
        return redirect()->back();
    }

    public function store(Request $request)
    {
        /**

         * @post('/account/subscriptions/card')
         * @name('')
         * @middlewares(web, verified, auth)
         */
        $this->validate($request, [
            'name' => 'required',
            'token' => 'required',
        ]);

        currentTeam()->updateDefaultPaymentMethod($request->token);

        return redirect()->route('account.subscriptions');
    }

    public function newPaymentMethod(Request $request)
    {
        /**

         * @post('/newcard')
         * @name('newcard')
         * @middlewares(web, verified, auth)
         */
        $this->validate($request, [
            'name' => 'required',
            'token' => 'required',
        ]);
        currentTeam()->addPaymentMethod($request->token);

        toastr()->success(__('Payment method has been added'));

        return redirect()->back();
    }

    public function resume()
    {
        /**

         * @post('/resume')
         * @name('')
         * @middlewares(web, verified, auth, subscribed)
         */
        // $this->authorize('resume', $subscription = currentTeam()->subscription('default'));
        $subscription = currentTeam()->subscription('default');
        $subscription->resume();

        toastr()->success(__('Subscription has been resumed !'));

        return redirect()->back();
    }
}
