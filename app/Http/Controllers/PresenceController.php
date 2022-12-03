<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use Illuminate\Support\Facades\Auth;

class PresenceController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth');
    }
    
    // Presence
    public function presence()
    {
        $pageConfigs = ['layoutWidth' => 'full'];
        if (Auth::User()->role_id == 1){
            return view('users/presence/index', ['pageConfigs' => $pageConfigs]);
          }
          else{
            return view('/errors/404');
          }
    }


    public function presenceAjax()
    {

        $users = DB::table('attendance')
            ->leftjoin('users', 'attendance.user_id', '=', 'users.id')
            ->leftjoin('shift', 'users.shift_id', '=', 'shift.id')
            ->where('users.user_id' , '=', Auth::id())
            ->where('users.role_id' , '=', 2)
            ->select('attendance.*', 'users.firstname', 'users.lastname', 'users.profile_photo_path', 'users.email', 'shift.start_time', 'shift.end_time', 'shift.working_time')
            ->get()->toArray();

        return response()->json(['data' => $users]);
    }


}
