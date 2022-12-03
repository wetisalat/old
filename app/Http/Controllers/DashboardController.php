<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Auth;

class DashboardController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth');
    }

    // // Dashboard Admin
   public function base1()
   {
       $pageConfigs = ['layoutWidth' => 'full'];
       return view('test/admin', ['pageConfigs' => $pageConfigs]);
   }

    // // Dashboard User
    public function base2()
    {
        $pageConfigs = ['layoutWidth' => 'full'];
        return view('test/user', ['pageConfigs' => $pageConfigs]);
    }

    // // Dashboard Staff
   public function base3()
   {
       $pageConfigs = ['layoutWidth' => 'full'];
       return view('test/staff', ['pageConfigs' => $pageConfigs]);
   }

}
