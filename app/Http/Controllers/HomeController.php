<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use DB;
use Carbon\Carbon;
use Carbon\CarbonPeriod;

use App\Models\User;

use DivisionByZeroError ;
use Log;

class HomeController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        $role = strtolower( Auth::user()->role->name );

        switch ($role) {
            case 'admin':

                // Plan price total
                $plan_price = User::leftJoin('plans', 'users.plan', '=', 'plans.title')->sum('plans.price');

                // Price difference for current and prev month 
                $now = Carbon::now();
                $start_of_curr_month = $now->startOfMonth()->format('Y-m-d');
                $end_of_curr_month = $now->endOfMonth()->format('Y-m-d');

                $start_of_prev_month = $now->subMonth()->startOfMonth()->format('Y-m-d');
                $end_of_prev_month = $now->subMonth()->endOfMonth()->format('Y-m-d');
                
                $plan_price_prev_month = (double) User::leftJoin('plans', 'users.plan', '=', 'plans.title')->whereBetween('users.created_at', [$start_of_prev_month, $end_of_prev_month])->sum('plans.price');
                $plan_price_curr_month = (double) User::leftJoin('plans', 'users.plan', '=', 'plans.title')->whereBetween('users.created_at', [$start_of_curr_month, $end_of_curr_month])->sum('plans.price');
                
                try {
                    $plan_price_diff_perc = (($plan_price_prev_month - $plan_price_curr_month) / (($plan_price_prev_month + $plan_price_curr_month) / 2)) * 100;
                } catch(DivisionByZeroError $e) {
                    $plan_price_diff_perc = 0;
                }

                // User count, active, inactive, total
                $inactive_users_count = User::where('role_id', '=', 1)->whereNull('email_verified_at')->count();
                $active_users_count = User::where('role_id', '=', 1)->whereNotNull('email_verified_at')->count();
                $total_users_count = User::where('role_id', '=', 1)->count();

                $active_perc = number_format( ($active_users_count / $total_users_count) * 100 );
                $inactive_perc = number_format( ($inactive_users_count / $total_users_count) * 100 ); 

                // Staff
                $total_staff_count = User::where('role_id', '=', 2)->count();

                // Subscriptions 
                $total_subscriptions = DB::table('subscriptions')->where('stripe_status', '=', 'active')->count();
                $total_subscriptions_amount = DB::table('subscriptions')->where('stripe_status', '=', 'active')
                    ->leftJoin('plans', 'subscriptions.stripe_plan', '=', 'plans.stripe_id')
                    ->sum('plans.price');
                $total_subscriptions_cancelled = DB::table('subscriptions')->where('stripe_status', '=', 'cancel')->count(); 
                $cancelled_subscriptions_amount = DB::table('subscriptions')->where('stripe_status', '=', 'cancel')
                    ->leftJoin('plans', 'subscriptions.stripe_plan', '=', 'plans.stripe_id')
                    ->sum('plans.price');
                $subcriptions_perc = ($total_subscriptions / $total_users_count) * 100;              
                $subscriptions_cancelled_perc = ( $total_subscriptions_cancelled / $total_users_count  ) * 100;
                $subscriptions_list = [];
                $cancelled_subscriptions_list = []; 

                for ($m=1; $m<=12; $m++) {
                    $month_timestamp = mktime(0,0,0, $m, 1, date('Y'));

                    $month_start = Carbon::parse($month_timestamp)->startOfMonth()->format('Y-m-d');
                    $month_end = Carbon::parse($month_timestamp)->endOfMonth()->format('Y-m-d');

                    // Month subscriptions price
                    $month_total = DB::table('subscriptions')
                        ->leftJoin('plans', 'subscriptions.stripe_plan', '=', 'plans.stripe_id')
                        ->whereBetween('subscriptions.created_at', [$month_start, $month_end])
                        ->where('subscriptions.stripe_status', '=', 'active')
                        ->sum('plans.price');

                    array_push($subscriptions_list, $month_total);

                    // Month Cancelled subscriptions price
                    $cancelled_month_total = DB::table('subscriptions')
                        ->leftJoin('plans', 'subscriptions.stripe_plan', '=', 'plans.stripe_id')
                        ->whereBetween('subscriptions.created_at', [$month_start, $month_end])
                        ->where('subscriptions.stripe_status', '=', 'cancel')
                        ->sum('plans.price');

                    array_push($cancelled_subscriptions_list, $cancelled_month_total);
                }

                $recent_years = array(
                    date('Y'),
                    date('Y') - 1,
                    date('Y') - 2,
                );

                $data = compact(
                    'plan_price', 
                    'plan_price_diff_perc', 
                    'active_perc', 
                    'inactive_perc', 
                    'total_users_count', 
                    'total_staff_count', 
                    'total_subscriptions', 
                    'total_subscriptions_amount',
                    'total_subscriptions_cancelled', 
                    'subcriptions_perc', 
                    'subscriptions_cancelled_perc',
                    'subscriptions_list',
                    'cancelled_subscriptions_list',
                    'cancelled_subscriptions_amount',
                    'recent_years'
                );

                return view('dashboard.admin', ['data' => $data]);
                break;
        
            case 'staff':
                $user = Auth::user();
                $now = Carbon::now();
                $startOfMonth = $now->startOfMonth()->format('Y-m-d');
                $endOfMonth = $now->endOfMonth()->format('Y-m-d');

                $total_secs_worked = DB::table('attendance')
                    ->where('user_id', Auth::user()->id)
                    ->sum( DB::raw( 'TIME_TO_SEC( `hours_worked` )' ) );

                $total_secs_current_month = DB::table('attendance')
                    ->where('user_id', Auth::user()->id)
                    ->whereBetween('arrival_date', [$startOfMonth, $endOfMonth])
                    ->sum( DB::raw( 'TIME_TO_SEC( `hours_worked` )' ) );

                $total_leave_current_month = DB::table('vacation')
                    ->where('user_id', Auth::user()->id)
                    ->whereBetween('start', [$startOfMonth, $endOfMonth])
                    ->count();

                $shift = DB::table('shift')->select('name', 'start_time', 'end_time')->where('id', $user->shift_id)->first();
                $schedule = DB::table('schedule')
                    ->select('location.name as location_name', 'todo.title as todo_title')
                    ->leftJoin('location', 'schedule.location_id', '=', 'location.id')
                    ->leftJoin('todo', 'schedule.todo_id', '=', 'todo.id')
                    ->whereDate('start', '<=', date('Y-m-d\TH:i'))
                    ->whereDate('end', '>=', date('Y-m-d'))
                    // ->whereRaw("DATE(REPLACE(`end`, 'T', ' ')) >= " . date('Y-m-d'))
                    ->first();
            
                $data = array(
                    'total_hours_worked' => gmdate('H\hi\m\i\n', $total_secs_worked),
                    'total_hours_current_month' => gmdate('H\hi\m\i\n', $total_secs_current_month),
                    'total_leave_current_month' => $total_leave_current_month,
                    'shift' => $shift,
                    'schedule' => $schedule
                );

                return view('dashboard.staff', $data);
                break;

            default:
                $user = Auth::user();
                $user_fullname = $user->firstname . ' '. $user->lastname;
                $staff_user_ids = DB::table('users')->where('user_id', '=', $user->id)->pluck('id')->toArray();

                $total_staff = count($staff_user_ids);

                $pending_leaves = DB::table('vacation')
                    ->leftJoin('status', 'vacation.status', '=', 'status.id')
                    ->where('status.name', '=', 'pending')
                    ->whereIn('user_id', $staff_user_ids)
                    ->count();
                
                $total_leaves = count(DB::table('vacation')
                    ->whereIn('user_id', $staff_user_ids)
                    ->groupBy('user_id')
                    ->select('user_id')
                    ->get()
                    ->toArray());

                $total_leaves_perc = ($total_leaves / $total_staff);

                $total_worked = count(DB::table('attendance')
                    ->whereIn('user_id', $staff_user_ids)
                    ->whereNotNull('hours_worked')
                    ->groupBy('user_id')
                    ->select('user_id')
                    ->get()
                    ->toArray());

                $total_secs_worked = DB::table('attendance')
                    ->whereIn('user_id', $staff_user_ids)
                    ->sum( DB::raw( 'TIME_TO_SEC( `hours_worked` )' ) );
                
                $total_secs_latetime = DB::table('attendance')
                    ->whereIn('user_id', $staff_user_ids)
                    ->sum( DB::raw( 'TIME_TO_SEC( `late_time` )' ) );
                $total_latetime = count(DB::table('attendance')
                    ->whereIn('user_id', $staff_user_ids)
                    ->whereNotNull('late_time')
                    ->groupBy('user_id')
                    ->select('user_id')
                    ->get()
                    ->toArray());
                
                $total_secs_overtime = DB::table('attendance')
                    ->whereIn('user_id', $staff_user_ids)
                    ->sum( DB::raw( 'TIME_TO_SEC( `over_time` )' ) );
                $total_overtime = count(DB::table('attendance')
                    ->whereIn('user_id', $staff_user_ids)
                    ->whereNotNull('over_time')
                    ->groupBy('user_id')
                    ->select('user_id')
                    ->get()
                    ->toArray());  

                $total_worked_perc = ($total_worked / $total_staff) ;
                $total_latetime_perc = ($total_latetime / $total_staff) ;
                $total_overtime_perc = ($total_overtime / $total_staff) ;
                
                $daily_leave_data = DB::table('vacation') 
                    ->select(
                        DB::raw("concat(users.firstname, ' ', users.lastname) as staff_name"), 'contract_type.name as contract_type_name',
                        'users.phone', 'shift.name as shift_name', 'shift.start_time', 'shift.end_time', 'leave_reasons.name as leave_reason'
                    )
                    ->leftJoin('users', 'vacation.user_id', '=', 'users.id')
                    ->leftJoin('shift', 'users.shift_id', '=', 'shift.id') 
                    ->leftJoin('leave_reasons', 'vacation.reason', '=', 'leave_reasons.id')  
                    ->leftjoin('staff', 'users.id', '=', 'staff.user_id')             
                    ->leftjoin('contract_type', 'staff.contract_type', '=', 'contract_type.id')   
                    ->whereIn('vacation.user_id', $staff_user_ids)
                    ->get();

                    $data = array(
                    'pending_leaves' => $pending_leaves,
                    'total_leaves' => $total_leaves,
                    'total_hours_worked' => gmdate('H\hi\m\i\n', $total_secs_worked),
                    'total_latetime' => gmdate('H\hi\m\i\n', $total_secs_latetime),
                    'total_overtime' => gmdate('H\hi\m\i\n', $total_secs_overtime),
                    'user_fullname' => $user_fullname,
                    'total_staff_worked' => $total_worked,
                    'total_staff_late' => $total_latetime,
                    'total_staff_overtime' => $total_overtime,
                    'total_worked_perc' => number_format($total_worked_perc, 2),
                    'total_leaves_perc' => number_format($total_leaves_perc, 2),
                    'total_latetime_perc' => number_format($total_latetime_perc, 2),
                    'total_overtime_perc' => number_format($total_overtime_perc, 2),    
                    'daily_staff_data' => $this->getStaffDailyData()                
                );

                return view('dashboard.user', ['data' => $data]);
                break;
        }
    }

    public function getStaffTotalHours(Request $request) {
        $start = Carbon::parse($request->start)->format('Y-m-d');
        $end =  Carbon::parse($request->end)->format('Y-m-d');

        $range = CarbonPeriod::create($start, $end);

        $data = [
            'dates' => [],
            'hours_worked' => [],
            'over_time' => []
        ];

        foreach ($range as $key => $date) {
            array_push($data['dates'], $date->format('D, d'));

            $attendance = DB::table('attendance')
                ->select('hours_worked', 'over_time')
                ->whereDate('arrival_date', $date->format('Y-m-d'))
                ->where('user_id', Auth::user()->id)
                ->first();

            if(!is_null($attendance)) {
                if(!is_null($attendance->hours_worked)) {
                    $hours_worked = number_format($this->convertTimeToSecond($attendance->hours_worked) / 3600, 2);
                    array_push($data['hours_worked'], $hours_worked );
                } else {
                    array_push($data['hours_worked'], 0 );
                }

                if(!is_null($attendance->over_time)) {
                    $over_time = number_format($this->convertTimeToSecond($attendance->over_time) / 3600, 2);
                    array_push($data['over_time'], $over_time );
                } else {
                    array_push($data['over_time'], 0 );
                }
            } else {
                array_push($data['hours_worked'], 0);
                array_push($data['over_time'], 0);
            }
        }

        return response()->json(array('data' => $data));
    }

    public function getStaffOverview(Request $request) {
        $staff_user_ids = DB::table('users')->where('user_id', '=', Auth::user()->id)->pluck('id')->toArray();

        $start = Carbon::parse($request->start)->format('Y-m-d');
        $end =  Carbon::parse($request->end)->format('Y-m-d');

        $total_staff_worked = count(DB::table('attendance')
            ->whereIn('user_id', $staff_user_ids)
            ->whereNotNull('hours_worked')
            ->whereBetween('arrival_date', [$start, $end])
            ->groupBy('user_id')
            ->select('user_id')
            ->get()
            ->toArray());

        $total_leaves = count(DB::table('vacation')
            ->whereIn('user_id', $staff_user_ids)
            ->whereBetween('start', [$start, $end])
            ->groupBy('user_id')
            ->select('user_id')
            ->get()
            ->toArray());

        $total_staff_late = count(DB::table('attendance')
            ->whereIn('user_id', $staff_user_ids)
            ->whereBetween('arrival_date', [$start, $end])
            ->whereNotNull('late_time')
            ->groupBy('user_id')
            ->select('user_id')
            ->get()
            ->toArray());

        $total_staff_overtime = count(DB::table('attendance')
            ->whereIn('user_id', $staff_user_ids)
            ->whereBetween('arrival_date', [$start, $end])
            ->whereNotNull('over_time')
            ->groupBy('user_id')
            ->select('user_id')
            ->get()
            ->toArray());  

        return response()->json(array(
            $total_staff_worked, 
            $total_leaves, 
            $total_staff_late,
            $total_staff_overtime
        ));
    }

    public function getStaffDailyData() {
        try {

            $daily_staff_data = $this->getStaffData();
            $unclocked_out_users = $this->getUnclockedOutUsers();

            // Merge daily data and unclocked out users
            $staff_data = array_merge($daily_staff_data, $unclocked_out_users);

        } catch(\Exception $e) {
            Log::error($e->getMessage());
            Log::error($e->getTrace());

            $staff_data = [];
        }

        return collect($staff_data);
    }

    private function getStaffData() {
        $staff_user_ids = DB::table('users')->where('user_id', '=', Auth::user()->id)->pluck('id')->toArray();

        $now_time = date('Y-m-d\TH:i'); 
        $now = date('Y-m-d'); 

        $yesterday = date("Y-m-d", strtotime( '-1 days' ) );

        // Get daily data
        $daily_staff_data = DB::table('users') 
            ->select(
                'users.id', 'users.firstname', 'users.lastname', DB::raw("concat(users.firstname, ' ', users.lastname) as staff_name"), 'contract_type.name as contract_type_name',
                'users.phone', 'shift.name as shift_name', 'shift.start_time', 'shift.end_time', 'shift.working_time', 'shift.break_time as shift_break_duration'   
            )
            ->leftJoin('shift', 'users.shift_id', '=', 'shift.id') 
            ->leftJoin('staff', 'users.id', '=', 'staff.user_id')             
            ->leftjoin('contract_type', 'staff.contract_type', '=', 'contract_type.id')
            ->whereIn('users.id', $staff_user_ids)                         
            ->whereExists(function ($query) use($now, $now_time) {
                $query->select(DB::raw(1))
                    ->from('schedule')
                    ->whereRaw("start <= STR_TO_DATE(?, '%Y-%m-%dT%H:%i')", $now_time)
                    ->whereDate('end', '>=', $now)
                    // ->whereRaw("DATE(REPLACE(`end`, 'T', ' ')) >= {$now}")
                    ->whereRaw('schedule.staff_id=users.id');
            }) 
            ->orWhereExists(function ($query) use($now, $now_time)  {
                $query->select(DB::raw(1))
                    ->from('vacation')
                    // ->whereRaw("DATE(start) <= IF(allDay = 1, '$now', '$now_time') AND DATE(end) >= IF(allDay = 1, '$now', '$now_time') AND vacation.staff_id=users.id")
                    ->whereRaw("DATE(start) <= '$now' AND DATE(end) >= '$now' AND vacation.staff_id=users.id")
                    // ->whereDate('start', '<=', $now)
                    // ->whereDate('end', '>=', $now)
                    // ->whereRaw('vacation.staff_id=users.id')
                    ;
            })
            ->get();

        return $this->formatStaffData($daily_staff_data, $now, $now_time);
    }

    private function getUnclockedOutUsers() {
        $staff_user_ids = DB::table('users')->where('user_id', '=', Auth::user()->id)->pluck('id')->toArray();

        $now_time = date('Y-m-d\TH:i'); 
        $now = date('Y-m-d'); 

        $yesterday = date("Y-m-d", strtotime( '-1 days' ) );

        // Get daily data
        $unclocked_out_users = DB::table('users') 
            ->select(
                'users.id', 'users.firstname', 'users.lastname', DB::raw("concat(users.firstname, ' ', users.lastname) as staff_name"), 'contract_type.name as contract_type_name',
                'users.phone', 'shift.name as shift_name', 'shift.start_time', 'shift.end_time', 'shift.working_time', 'shift.break_time as shift_break_duration',
                'attendance.arrival_date', 'attendance.arrival_hour', 'attendance.is_end', 'attendance.hours_worked', 'attendance.break_duration', 'attendance.break_hour'   
            )
            ->leftJoin('shift', 'users.shift_id', '=', 'shift.id') 
            ->leftjoin('staff', 'users.id', '=', 'staff.user_id')             
            ->leftjoin('contract_type', 'staff.contract_type', '=', 'contract_type.id')
            ->leftjoin('attendance', 'attendance.user_id', '=', 'users.id')
            ->whereIn('users.id', $staff_user_ids)   
            ->whereDate('attendance.arrival_date', '<', $now)
            ->where('is_end', '=', '0')
            ->get();

        return $this->formatStaffData($unclocked_out_users, $now, $now_time);
    }

    private function formatStaffData($data, $now, $now_time) {
        $return = [];

        foreach($data as $row) {

            $schedule = DB::table('schedule')
                ->select('shift.name as shift_name', 'shift.start_time', 'shift.end_time', 'shift.working_time', 'shift.break_time as shift_break_duration')
                ->leftJoin('shift', 'schedule.shift_id', '=', 'shift.id') 
                ->whereRaw("start <= STR_TO_DATE(?, '%Y-%m-%dT%H:%i')", $now_time)
                ->whereDate('end', '>=', $now)
                ->whereRaw('schedule.staff_id='.$row->id)
                ->first();

            
            $row->phone = !is_null($row->phone) ? $row->phone : 'N/A';

            $row->shift_name = !is_null($row->shift_name) ? $row->shift_name : '';
            $row->start_time = !is_null($row->start_time) ? $row->start_time : '';
            $row->end_time = !is_null($row->end_time) ? $row->end_time : '';

            if(!is_null($schedule) && !is_null($schedule->shift_name)) {
                $row->shift_name = $schedule->shift_name;
                $row->start_time = $schedule->start_time;
                $row->end_time = $schedule->end_time;
                $row->working_time = $schedule->working_time;
                $row->shift_break_duration = $schedule->shift_break_duration;
            }

            $start = Carbon::now()->format('Y-m-d');
            $end =  Carbon::now()->format('Y-m-d');
            $didnt_clock_out = false;

            if(isset($row->arrival_date) && !is_null($row->arrival_date)) {

                $didnt_clock_out  = true;
                $attendance = $row;
            } else {
                
                $attendance = DB::table('attendance')
                    ->where('arrival_date', '=', $now)
                    ->where('user_id', '=', $row->id)
                    //->where('departure_date', '>=', $now)
                    ->first();
            }            
            
            $status = 'Working';

            if(!is_null($attendance)) {
                // if($didnt_clock_out) {
                //     // Change arrival date to today to enable correct computations
                //     $attendance_arrival_date = Carbon::now()->format('Y-m-d');
                // } else {
                //     $attendance_arrival_date = $attendance->arrival_date;
                // }
                $attendance_arrival_date = $attendance->arrival_date;

                $row->arrival_date = Carbon::parse($attendance->arrival_date)->format('d-m-Y');
                
                if($attendance->is_end === 1) {
                    $status = 'Finish';
                } else {              
                    $shift_start_time = Carbon::createFromFormat('H:i', $row->start_time)->diffInSeconds();
                    $shift_working_seconds = $this->convertTimeToSecond($row->working_time);
                    $shift_break_duration = Carbon::createFromFormat('H:i', $row->shift_break_duration)->diffInSeconds();

                    // Staff hours worked relative to current time
                    // $hours_worked = !is_null($attendance->hours_worked) ? Carbon::createFromFormat('H:i:s', $attendance->hours_worked)->diffInSeconds() : 0;
                    $arrival_datetime = Carbon::parse($attendance_arrival_date. ' '. $attendance->arrival_hour);
                    $now_date_time = Carbon::now();
                    $seconds_worked = $arrival_datetime->diffInSeconds($now_date_time);

                    // Staff from break
                    $break_duration = !is_null($attendance->break_duration) ? 
                        $this->convertTimeToSecond($attendance->break_duration) : 0;

                    $worked_seconds = $seconds_worked - $break_duration;  

                    // dump($shift_working_seconds, $seconds_worked, $break_duration, $worked_seconds);
                    // Check if user checked in late
                    $arrival_time = Carbon::createFromFormat('H:i:s', $attendance->arrival_hour)->diffInSeconds();

                    if($arrival_time > $shift_start_time) { // Late arrival
                        $status = 'Late';
                    } 
                    
                    if(!is_null($attendance->break_hour)) { // On break
                    
                        $break_time = Carbon::createFromFormat('Y-m-d H:i:s', $attendance_arrival_date. ' '. $attendance->break_hour);
                        $current_time = Carbon::now();

                        $on_break_duration = $break_time->diffInSeconds($current_time);

                        // Check if he is late on break
                        if($on_break_duration > $shift_break_duration) {
                            $status = 'Late';
                        } else {
                            $status = 'Break';
                        }

                    } else if($worked_seconds > $shift_working_seconds) {
                        $status = 'Overtime';
                    } else {
                        // $status = 'Working';
                    }
                    
                }
            } else {
                $status = 'Late';

                $row->arrival_date = 'N/A';
            }      
            
            $vacation = DB::table('vacation')
                ->select('leave_reasons.name as leave_reason')
                ->leftJoin('leave_reasons', 'vacation.reason', '=', 'leave_reasons.id')
                ->whereRaw("DATE(start) <= IF(allDay = 1, '$now', '$now_time') AND DATE(end) >= IF(allDay = 1, '$now', '$now_time') AND vacation.staff_id={$row->id}")
                ->first();

            // If arrival date is set, it means the user did not clock out. So skip this part
            if(!is_null($vacation)) {
                $status = 'Leave';

                $row->leave_reason = $vacation->leave_reason;
            } else {
                $row->leave_reason = 'N/A';
            }

            $row->status = $status;
            // dump($row->shift_name !== '' || !is_null($vacation));
            if($row->shift_name !== '' || !is_null($vacation)) {
                array_push($return, $row);
            }
        };

        return $return;
    }

    private function convertTimeToSecond($time)
    {
        $d = explode(':', $time);
        return ($d[0] * 3600) + ($d[1] * 60) + (count($d) > 2 ? $d[2] : 0);
    }
}
