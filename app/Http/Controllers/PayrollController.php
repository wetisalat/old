<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use DB;
use Carbon\Carbon;

use Exception;

use App\Models\User;

class PayrollController extends Controller
{

  public function __construct()
  {
      $this->middleware('auth');
  }
  
   // Users payroll
   public function index()
   {
   		if(request()->ajax()) {
        $start = request()->start;
        $end = request()->end;

        $users = DB::table('users')->select('users.name', 'shift.working_time as scheduled_time', 'staff.bonus_id as bonus', 'users.id', 'night_amount.amount as night_amount', 'transport_amount.amount as transport_amount')
          ->leftJoin('shift', 'users.shift_id', '=', 'shift.id')
          ->leftJoin('staff', 'users.id', '=', 'staff.user_id')
          ->leftJoin('night_amount', 'staff.night_amount_id', '=', 'night_amount.id')
          ->leftJoin('transport_amount', 'staff.transport_amount_id', '=', 'transport_amount.id')
          ->where('users.user_id', '=', auth()->user()->id)
          ->get()
          ;

        $users = $users->map( function($user, $key) use ($start, $end) {
          $user->responsive_id = 0;

          $user->over_time = gmdate('H:i:s', DB::table('attendance')
            ->where('user_id', '=', $user->id)
            ->whereBetween('arrival_date', [$start, $end])
            ->whereBetween('departure_date', [$start, $end])
            ->sum(DB::raw("TIME_TO_SEC(over_time)")));

          $user->worked_time = gmdate('H:i:s', DB::table('attendance')
            ->where('user_id', '=', $user->id)
            ->whereBetween('arrival_date', [$start, $end])
            ->whereBetween('departure_date', [$start, $end])
            ->sum(DB::raw("TIME_TO_SEC(hours_worked)")));

          $user->late_time = gmdate('H:i:s', DB::table('attendance')
            ->where('user_id', '=', $user->id)
            ->whereBetween('arrival_date', [$start, $end])
            ->whereBetween('departure_date', [$start, $end])
            ->sum(DB::raw("TIME_TO_SEC(late_time)")));

          $user->paid_leave = DB::table('vacation')
            ->leftJoin('leave_reasons as lr', 'vacation.reason', '=', 'lr.id')
            ->where(
              [
                ['lr.paid', '=', 1],
                ['vacation.user_id', '=', $user->id]
              ]
            )
            ->whereBetween(DB::raw("(DATE_FORMAT(start,'%Y-%m-%d'))"), [$start, $end])
            ->whereBetween(DB::raw("(DATE_FORMAT(end,'%Y-%m-%d'))"), [$start, $end])
            ->count();

          $user->paid_lunch = DB::table('schedule')
            ->leftJoin('lunch_amount', 'schedule.lunch', '=', 'lunch_amount.id')
            ->where('schedule.user_id', '=', $user->id)
            ->whereBetween(DB::raw("(DATE_FORMAT(start,'%Y-%m-%d'))"), [$start, $end])
            ->whereBetween(DB::raw("(DATE_FORMAT(end,'%Y-%m-%d'))"), [$start, $end])
            ->sum('lunch_amount.amount');

          // $user->night = DB::table('attendance')
          //   ->leftJoin('night_amount', 'attendance.night_amount', '=', 'lunch_amount.id')
          //   ->where('attendance.user_id', '=', $user->id)
          //   ->whereBetween(DB::raw("(DATE_FORMAT(start,'%Y-%m-%d'))"), [$start, $end])
          //   ->whereBetween(DB::raw("(DATE_FORMAT(end,'%Y-%m-%d'))"), [$start, $end])
          //   ->sum('lunch_amount.amount');

          // $user->paid_lunch = DB::table('schedule')
          //   ->leftJoin('lunch_amount', 'schedule.lunch', '=', 'lunch_amount.id')
          //   ->where('schedule.user_id', '=', $user->id)
          //   ->whereBetween(DB::raw("(DATE_FORMAT(start,'%Y-%m-%d'))"), [$start, $end])
          //   ->whereBetween(DB::raw("(DATE_FORMAT(end,'%Y-%m-%d'))"), [$start, $end])
          //   ->sum('lunch_amount.amount');

          return $user;

        });

   			return response()->json(['data' => $users]);
   		}

      $pageConfigs = ['layoutWidth' => 'full'];

      if (Auth::User()->role_id == 1){
        return view('/users/payroll/index', ['pageConfigs' => $pageConfigs]);
      }
      else{
        return view('/errors/404');
      }
   }

}
