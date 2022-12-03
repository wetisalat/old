<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use DB;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;

class SubscriptionsController extends Controller
{

      // Subscriptions Page index
    public function index()
    {
        $pageConfigs = ['pageHeader' => false];
        if (Auth::User()->role_id == 0){
            return view('/admin/subscriptions', ['pageConfigs' => $pageConfigs, 'subscription' => currentTeam()->presentSubscription(),
            'invoice' => currentTeam()->presentUpcomingInvoice(),
            'customer' => currentTeam()->presentCustomer()]);
          }
          else{
            return view('/errors/404');
          }
    }

    public function edit($id)
    {
        $subscriptions = Subscriptions::findOrFail($id);
        $pageConfigs = ['pageHeader' => false];
        if (Auth::User()->role_id == 0){
            return view('/admin/subscriptions-edit', ['pageConfigs' => $pageConfigs, 'plan' => $subscriptions]);
          }
          else{
            return view('/errors/404');
          }
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'token' => 'required',
            'coupon' => [
                'nullable',
                new ValidCoupon(),
            ],
            'plan' => 'required|exists:plans,slug',
        ]);

        $plan = Plan::where('slug', $request->get('plan', 'monthly'))
                ->first();

        try {
            currentTeam()->newSubscription('default', $plan->stripe_id)
                ->withCoupon($request->coupon)
                ->create($request->token);
        } catch (PaymentActionRequired $e) {
            return redirect()->route(
                'cashier.payment',
                [
                    $e->payment->id,
                    'redirect' => route('account.subscriptions'),
                ]
            );
        }

        return back();
    }

    public function delete_subscriptions($id)
    {  
        $this->demoMode();
        $plan = Subscriptions::findOrFail($id);

        $stripe_plan = \Stripe\Plan::retrieve($plan->stripe_id);
        $stripe_plan->delete();

        // Delete the plan on the database
        Subscriptions::where('id', $id)
            ->update([
                'stripe_status' => 'cancel'
            ]);

        return redirect('admin/plans/');
        return redirect()->back()->with('status', 'Your plan has been deleted.');    
    }

}
