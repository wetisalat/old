<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class TimesheetController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    // table2
    public function timesheet()
    {
        $pageConfigs = ['layoutWidth' => 'full'];
        if (Auth::User()->role_id == 1){
            return view('users/timesheet', ['pageConfigs' => $pageConfigs]);
          }
          else{
            return view('/errors/404');
          }
    }
}
