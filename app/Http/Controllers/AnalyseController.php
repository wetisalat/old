<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;

use Exception;

use App\Models\User;

class AnalyseController extends Controller
{

  public function __construct()
  {
      $this->middleware('auth');
  }
  
   public function index()
   {
      $pageConfigs = ['layoutWidth' => 'full'];

      if (Auth::User()->role_id == 1){
        return view('/users/analyse/index', ['pageConfigs' => $pageConfigs]);
      }
      else{
        return view('/errors/404');
      }
   }

}
