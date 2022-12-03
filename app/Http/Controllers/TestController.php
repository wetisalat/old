<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Auth;

class TestController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth');
    }

    
    // test
    public function test()
    {
        if (Auth::User()->role_id == 0){
            return view('/test/test');
          }
          else{
            return view('/errors/404');
          }
    }

    // test2
    public function test2()
    {
        return view('/test/test2');
    }

    // table1
   public function table1()
   {
       $pageConfigs = ['layoutWidth' => 'full'];
       return view('test/admin', ['pageConfigs' => $pageConfigs]);
   }

    // table2
    public function table2()
    {
        $pageConfigs = ['layoutWidth' => 'full'];
        return view('test/user', ['pageConfigs' => $pageConfigs]);
    }

    // table3
   public function table3()
   {
       $pageConfigs = ['layoutWidth' => 'full'];
       return view('test/staff', ['pageConfigs' => $pageConfigs]);
   }

    // Google Maps
    public function map()
    {
        $pageConfigs = ['layoutWidth' => 'full'];
        return view('test/map', ['pageConfigs' => $pageConfigs]);
    }


    // Dashboard Admin
    public function dashboard1()
    {
        $pageConfigs = ['layoutWidth' => 'full'];
        return view('test/admin', ['pageConfigs' => $pageConfigs]);
    }

    // Dashboard User
    public function dashboard2()
    {
        $pageConfigs = ['layoutWidth' => 'full'];
        return view('test/user', ['pageConfigs' => $pageConfigs]);
    }

    // Dashboard Staff
    public function dashboard3()
    {
        $pageConfigs = ['layoutWidth' => 'full'];
        return view('test/staff', ['pageConfigs' => $pageConfigs]);
    }
}
