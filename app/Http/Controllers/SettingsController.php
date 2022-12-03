<?php

namespace App\Http\Controllers;

use App\Models\Plan;
use App\Models\ThemeMode;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class SettingsController extends Controller
{
    public function __construct()
    {
        $this->middleware(['auth']);
    }

    // Account Settings account
    public function settings_account()
    {
        $breadcrumbs = [['link' => "/", 'name' => "Home"], ['link' => "javascript:void(0)", 'name' => "Account Settings"], ['name' => "Account"]];
        if (Auth::User()->role_id == 1){
            return view('/users/settings/account', ['breadcrumbs' => $breadcrumbs]);
          }
          else{
            return view('/errors/404');
          }
    }

    // Account Settings security
    public function settings_security()
    {
        $breadcrumbs = [['link' => "/", 'name' => "Home"], ['link' => "javascript:void(0)", 'name' => "Account Settings"], ['name' => "Security"]];
        if (Auth::User()->role_id == 1){
            return view('/users/settings/security', ['breadcrumbs' => $breadcrumbs]);
          }
          else{
            return view('/errors/404');
          }
    }

    // Account Settings billing
    public function settings_billing()
    {
        $subscription = currentTeam()->subscription('default');
        $plans = Plan::all();
        $payments = currentTeam()->paymentMethods();
        $breadcrumbs = [['link' => "/", 'name' => "Home"], ['link' => "javascript:void(0)", 'name' => "Account Settings"], ['name' => "Billing & Plans"]];
        if (Auth::User()->role_id == 1){
            return view('/users/settings/billing', compact('breadcrumbs', 'plans', 'payments', 'subscription'));
          }
          else{
            return view('/errors/404');
          }
    }

    // Account Settings allowance
    public function settings_allowance()
    {
        $breadcrumbs = [['link' => "/", 'name' => "Home"], ['link' => "javascript:void(0)", 'name' => "Account Settings"], ['name' => "Allowance"]];
        if (Auth::User()->role_id == 1){
            return view('/users/settings/allowance', ['breadcrumbs' => $breadcrumbs]);
          }
          else{
            return view('/errors/404');
          }
    }


    // Account Settings notifications
    public function settings_notifications()
    {
        $breadcrumbs = [['link' => "/", 'name' => "Home"], ['link' => "javascript:void(0)", 'name' => "Account Settings"], ['name' => "Notifications"]];
        if (Auth::User()->role_id == 1){
            return view('/users/settings/notifications', ['breadcrumbs' => $breadcrumbs]);
          }
          else{
            return view('/errors/404');
          }
    }

    // Account Settings shift
    public function settings_shift()
    {
        $breadcrumbs = [['link' => "/", 'name' => "Home"], ['link' => "javascript:void(0)", 'name' => "Account Settings"], ['name' => "Shift"]];
        if (Auth::User()->role_id == 1){
            return view('/users/settings/shift', ['breadcrumbs' => $breadcrumbs]);
          }
          else{
            return view('/errors/404');
          }
    }

    // Account Settings extra
    public function settings_extra()
    {
        $breadcrumbs = [['link' => "/", 'name' => "Home"], ['link' => "javascript:void(0)", 'name' => "Account Settings"], ['name' => "Extra"]];
        if (Auth::User()->role_id == 1){
            return view('/users/settings/extra', ['breadcrumbs' => $breadcrumbs]);
          }
          else{
            return view('/errors/404');
          }
    }

    // Account Settings locations
    public function settings_locations()
    {
        $breadcrumbs = [['link' => "/", 'name' => "Home"], ['link' => "javascript:void(0)", 'name' => "Account Settings"], ['name' => "Locations"]];
        if (Auth::User()->role_id == 1){
            return view('/users/settings/locations', ['breadcrumbs' => $breadcrumbs]);
          }
          else{
            return view('/errors/404');
          }
    }

    // Theme mode
    public function themeMode()
    {

        $user_id = Auth::id();
        $themeMode = ThemeMode::where('user_id', '=', $user_id)->first();
        if (isset($themeMode)) {
            if ($themeMode->status == 1) {
                $themeMode->status = 0;
                $themeMode->save();
            } else {
                $themeMode->status = 1;
                $themeMode->save();
            }
        } else {
            $attributes = new ThemeMode();
            $attributes->user_id = $user_id;
            $attributes->status = 1;
            $attributes->save();
        }
        return 'ok';
    }
}
