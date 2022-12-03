<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use DB;
use Carbon\Carbon;
use App\Imports\AttendanceImport;
use Maatwebsite\Excel\Facades\Excel;

use Exception;

class AttendanceController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth');
    }

   // Users attendance
   public function users_side()
   {
       $pageConfigs = ['layoutWidth' => 'full'];

       $staffCount = DB::table('attendance')
                    ->leftjoin('users', 'attendance.user_id', '=', 'users.id')
                    ->where('users.user_id' , '=', Auth::id())->get()->count();

       if (Auth::User()->role_id == 1){
        return view('/users/attendance/index', ['pageConfigs' => $pageConfigs, 'staffCount' => $staffCount]);
      }
      else{
        return view('/errors/404');
      }
   }

   public function attendanceAjax()
    {

        $users = DB::table('attendance')
            ->leftjoin('users', 'attendance.user_id', '=', 'users.id')
            ->leftjoin('shift', 'users.shift_id', '=', 'shift.id')
            ->leftJoin('staff', 'attendance.user_id', '=', 'staff.user_id')
            ->leftJoin('contract_type', 'staff.contract_type', '=', 'contract_type.id')
            ->leftJoin('status', 'attendance.staff_status', '=', 'status.id')
            ->where('users.user_id' , '=', Auth::id())
            ->where('users.role_id' , '=', 2)
            ->select('attendance.*', 'users.firstname', 'users.lastname', 'users.profile_photo_path', 'users.email',
                'shift.start_time', 'shift.end_time', 'shift.break_time', 'shift.working_time', "status.name as status_name", "contract_type.name as contract_type_name")
            ->orderBy('id', 'desc')->get()->toArray();

        return response()->json(['data' => $users]);
    }


    public function attendanceStatus(Request $request, $id)
    {
        $statusName = $request->status;

        if($statusName === 'delete'){
            $this->destroy($id);
            return response()->json(['message' => 'Attendance deleted']);
        }else{
            $query = DB::table('status')->where('name', $statusName);
            $status = $query->first();
            if ($query->exists()) {
                $leave = DB::table('attendance')->where('id', $id)->update(['staff_status' => $status->id]);
                return response()->json(['message' => 'Attendance updated']);
            }
            return response()->json(['message' => 'Attendance status update failed']);
        }


    }

    // Get leave statistics
    public function attendanceStatistics()
    {
        $user = auth()->user();

        $stats = DB::table('attendance')
            ->leftJoin('status', 'attendance.staff_status', '=', 'status.id')
            ->leftjoin('users', 'attendance.user_id', '=', 'users.id')
            ->groupBy('status.name')
            ->select('status.name as status', DB::raw('count(*) as total'))
            ->where('users.user_id' , '=', $user->id)
            ->get();

        return response()->json(['data' => $stats]);
    }

    /**
     * Staff attendance
     * 
     * @param  Request $request [description]
     * @param  [string]  $id      The staff user id if the user is logged in null otherwise
     * @return            
     */
    public function staff_side(Request $request, $id = null)
    {
        if($request->ajax()) {
            $attendanceQuery = DB::table('attendance')
                ->leftJoin('status', 'attendance.staff_status', '=', 'status.id')
                // ->leftJoin('extra', 'attendance.extra', '=', 'extra.id')
                ->select(DB::raw("CONCAT(attendance.arrival_date, ' ', attendance.arrival_hour) as start"), DB::raw("CONCAT(attendance.departure_date, ' ', attendance.departure_hour) as end"), 'comment', 'extra', 'transport', 'break_duration as pause', 'week_number', 'status.name as status', 'status.color', 'location', 'gps_in');
            
            $user = auth()->user();

            // If there is a staff user id on the parameter or logged in user is staff, filter by user id
            if(!is_null($id) || $user->role->name === 'staff') {
                $attendanceQuery->where('user_id', $id ? $id : $user->id);
            } else { // Filter by user's staffs
                $staff_users_id = DB::table('users')->where('user_id', '=', $user->id)->pluck('id')->toArray();

                 $attendanceQuery->whereIn('user_id', $staff_users_id);
            }

            if($request->has('status')) {
                $attendanceQuery->whereIn('status.id', $request->status);
            } else {
                $attendanceQuery->whereIn('status.id', []);
            }

            $attendance = $attendanceQuery->get()->map(function($row) {
                $data = $row;
                $extraIds = explode(',', $row->extra);
                $extraNames = [];
                foreach ($extraIds as $extraId) {
                    $extraItem = DB::table('extra')->where('id', $extraId)->first();

                    if(!is_null($extraItem)) {
                        array_push($extraNames, $extraItem->name);
                    }
                }
                $data->extraLabel = implode(',', $extraNames);

                if($row->status === 'pending') {
                    $data->color = 'rgb(255, 159, 67)';
                } else if($row->status === 'refuse') {
                    $data->color = 'rgb(234, 84, 85)';
                } else {
                    $data->color = 'rgb(40, 199, 111)';
                }

                return $data;
            });

            return response()->json(compact('attendance'));
        }

        $extra = DB::table('extra')->get();
        $pageConfigs = ['layoutWidth' => 'full'];

        if (Auth::User()->role_id == 2){
            return view('/staff/attendance', ['extras' => $extra, 'pageConfigs' => $pageConfigs]);
          }
          else{
            return view('/errors/404');
          }
    }

    // Save staff attendance
    public function staff_side_save(Request $request)
    {   
        try {
            $start = Carbon::parse($request->start);
            $end = Carbon::parse($request->end);

            $status = DB::table('status')->where('name', '=', 'pending')->first();
            $user =  auth()->user();

            // Calculate hours_worked, late_time and over_time
            $late_time = 0;
            $over_time = 0;

            // Break duration in minutes
            $break_duration = $request->has('pause') ? (int) $request->pause : 0;

            // minutes_worked
            $minutes_worked = $end->diffInMinutes($start) - $break_duration; // convert break_duration into hours

            if(!is_null($user->shift_id)) {
                $shift = DB::table('shift')->find($user->shift_id); 

                $shiftStart = Carbon::parse($start->format('Y-m-d').' '.$shift->start_time);
                $shiftEnd = Carbon::parse($end->format('Y-m-d').' '.$shift->end_time);

                // Shift break in minutes
                $shiftBreak = (int) str_replace('min', '', $shift->break_time);

                // minutes_worked = shift difference - shift break - overtime break
                $minutes_worked = $shiftEnd->diffInMinutes($shiftStart) - $shiftBreak;

                $extra_break = $break_duration > $shiftBreak ? ($break_duration - $shiftBreak) : 0;

                // late_time
                if($start->gt($shiftStart)) {
                    $late_time = $start->diffInMinutes($shiftStart);
                }

                // over_time morning
                if($shiftStart->gt($start)) {
                    $over_time += $shiftStart->diffInMinutes($start);
                }

                // over_time evening
                if($end->gt($shiftEnd)) {
                    $over_time += $end->diffInMinutes($shiftEnd);
                }

                // deduct late_time from over_time
                if ($late_time > 0) {
                    if($over_time < $late_time) {
                        $over_time = 0;
                    } else {
                        $over_time = $over_time - $late_time;
                    }
                }

                // deduct extra break time
                if($extra_break > 0) {
                    if($over_time > 0) {
                        $over_time -= $extra_break;
                    } else {
                        $minutes_worked -= $extra_break;
                    }
                }
            }

            $attendanceData = [
                'user_id' => $user->id,
                'arrival_date' => $start->format('Y-m-d'),
                'arrival_hour' => $start->format('H:i:s'),
                'departure_date' => $end->format('Y-m-d'),
                'departure_hour' => $end->format('H:i:s'),
                'comment' => $request->comment,
                'extra' => implode(',', $request->extra),
                'transport' => Carbon::now()->startOfDay()->addMinutes($request->transport)->format('H:i:s'),
                'is_end' => 1,
                'week_number' => $start->weekOfYear,
                'hours_worked' => Carbon::now()->startOfDay()->addMinutes($minutes_worked)->format('H:i:s'),
                'staff_status' => $status->id,
                'break_duration' => Carbon::now()->startOfDay()->addMinutes($break_duration)->format('H:i:s'),
                'late_time' => Carbon::now()->startOfDay()->addMinutes($late_time)->format('H:i:s'),
                'over_time' => Carbon::now()->startOfDay()->addMinutes($over_time)->format('H:i:s')
            ];

            $location = $request->location;

            $attendanceData['gps_in'] = $location;
            $attendanceData['gps_out'] = $location;

            DB::table('attendance')->insert($attendanceData);

            return response()->json(array('success' => 1, $break_duration));
        } catch(Exception $e) {
            return response()->json(array('success' => 0, 'error' => $e->getMessage()));
        }
    } 

    public function staff_side_attendance_summary(Request $request) 
    {
        return response()->json(['data' => $this->get_dates_of_month_weeks($request->date)]);
    }

    private function get_dates_of_month_weeks($dateStr)
    {
        $year = Carbon::parse($dateStr)->year;
        $month = Carbon::parse($dateStr)->month;
        $date = Carbon::createFromDate($year, $month);

        $weeks = [];
        $total = [];

        $workedTotal = 0;
        $overtimeTotal = 0;
        $lateTotal = 0;

        $i=1;
        $j=1;

        while ($i <= $date->daysInMonth) {
            $weekDate = Carbon::createFromDate($year,$month,$i); 
            $start = Carbon::createFromDate($year,$month,$i)->startOfWeek(Carbon::SUNDAY);
            $end = Carbon::createFromDate($year,$month,$i)->endOfweek(Carbon::SATURDAY);

            if($end->month > $month) {
                $end = $weekDate->lastOfMonth();
            }

            $records = DB::table('attendance')->whereBetween('arrival_date', [$start->format('Y-m-d'), $end->format('Y-m-d')])->get();

            $worked = 0;
            $overtime = 0;
            $late = 0;

            foreach($records as $record) {
                $worked += Carbon::createFromTimeString($record->hours_worked)->timestamp; 
                $overtime += Carbon::createFromTimeString($record->over_time)->timestamp; 
                $late += Carbon::createFromTimeString($record->late_time)->timestamp; 
            };

            $workedTotal += $worked;
            $overtimeTotal += $overtime;
            $lateTotal += $late;

            $weeks[$end->weekOfYear] = [
                'worked' => Carbon::parse($worked)->format('H\hi'),
                'overtime' => Carbon::parse($overtime)->format('H\hi'),
                'late' => Carbon::parse($late)->format('H\hi')
            ];

            $i+=7;
            $j++; 
        }

        $total =  [
            'worked' => Carbon::parse($workedTotal)->format('H\hi'),
            'overtime' => Carbon::parse($overtimeTotal)->format('H\hi'),
            'late' => Carbon::parse($lateTotal)->format('H\hi')
        ];

        return [
            'weeks' => $weeks,
            'total' => $total
        ];
    }

    // Upload CSV File
    //CsvImportRequest
    public function csvFileUpload(Request $request){
        if ($request->hasFile('csv_file')) {
            $data = Excel::toArray(new AttendanceImport, $request->file('csv_file'))[0];
        }else{
            $data = array_map('str_getcsv', file($request->file('csv_file')->getRealPath()));
        }

        if (count($data) > 0) {
            $csv_data = array_slice($data, 0, 2);
            $csvUploadData = $data;

            foreach ($csvUploadData as $value){

                $workTime = $this->workedHours($value);
                $lateTime = $this->lateTime($value);
                $getOverTime = $this->overTime($value);

                $attendanceData = [
                    'user_id' => $value['user_id'],
                    'arrival_date' => Carbon::parse($value['arrival_date'])->format('Y-m-d'),
                    'arrival_hour' => $value['arrival_hour'],
                    'departure_date' => Carbon::parse($value['departure_date'])->format('Y-m-d'),
                    'departure_hour' => $value['departure_hour'],

                    'comment' => isset($value['comment']) ? $value['comment'] : '',
                    'extra' => isset($value['extra']) ? $value['extra'] : '',
                    'transport' => isset($value['transport']) ? $value['transport'] : '',
                    'is_end' => 1, // Default 1
                    'staff_status' => 1, // Status Default 1
                    'week_number' => isset($value['week_number']) ? $value['week_number'] : null,
                    'break_duration' => $value['break_duration'],

                    'is_csv' => 1,
                    'hours_worked' => $workTime,
                    'late_time' => $lateTime,
                    'over_time' => $getOverTime
                ];

                $attendanceData['gps_in'] = $value['gps_in'];
                $attendanceData['gps_out'] = $value['gps_out'];

                DB::table('attendance')->insert($attendanceData);
            }

        } else {
            return redirect()->back();
        }

        return response()->json(['success' => 'Success']);

    }


    // Worked Hours calculation
    protected function workedHours($value){
        $getTimeCal = $this->calculateTime($value);
        //Over time
        $totalHours = 0;
        if(strtotime($getTimeCal['workedHours']) > strtotime($getTimeCal['workingTime'])){
            $totalHours = $getTimeCal['workingTime'];
        }else {
            $totalHours = $getTimeCal['workedHours'];
        }

        return $totalHours;
    }

    // Late Time Calculation
    protected function lateTime($value){
        // Shift break
        $shiftBreak = $value['break_time'];
        $breakDuration = $value['break_duration'];

        $getArrivalDate = $value['arrival_date'];
        $getArrivalHour = $value['arrival_hour'];

        $getStartTime = $value['start_time'];

        // Date Formate
        $arrivalDate = Carbon::createFromFormat('d-m-Y H:i:s',  $getArrivalDate .''. $getArrivalHour);
        $startDate = Carbon::createFromFormat('d-m-Y H:i',  $getArrivalDate .''. $getStartTime);
        $staffLate = $arrivalDate->diff($startDate)->format('%H:%I:%S');

        $workTime = null;
        if (strtotime($breakDuration) > strtotime($shiftBreak)){
            $overBreak = strtotime($breakDuration) - strtotime($shiftBreak);
            $getWorkingTime = strtotime($staffLate) + $overBreak;
            $workTime = date("H:i:s", $getWorkingTime);
        }else {
            $workTime = $staffLate;
        }

        return $workTime;
    }


    // Late Time Calculation
    protected function overTime($value){
        $getTimeCal = $this->calculateTime($value);

        $totalHours = strtotime($getTimeCal['workedHours']); //02:01:00
        $totalWorkingTime = strtotime($getTimeCal['workingTime']); //02:01:00

        //Over time
        $overTime = 0;
        if($totalHours > $totalWorkingTime){
            $getOverTime = $totalHours - $totalWorkingTime;
            $overTime = date('H:i:s', $getOverTime);
        }else{
            $overTime = '00:00:00';
        }

        return $overTime;
    }


    protected function calculateTime($value){
        $getArrivalDate = $value['arrival_date'];
        $getArrivalHour = $value['arrival_hour'];

        $getDepartureDate = $value['departure_date'];
        $getDepartureHour = $value['departure_hour'];

        $getStartTime = $value['start_time'];
        $endTime = $value['end_time'];

        // Date Formate
        $arrivalDate = Carbon::createFromFormat('d-m-Y H:i:s',  $getArrivalDate .''. $getArrivalHour);
        $departureDate = Carbon::createFromFormat('d-m-Y H:i:s',  $getDepartureDate .''. $getDepartureHour);

        $startDate = Carbon::createFromFormat('d-m-Y H:i',  $getArrivalDate .''. $getStartTime);
        $endDate = Carbon::createFromFormat('d-m-Y H:i',  $getArrivalDate .''. $endTime);


        $workedHours = $departureDate->diff($arrivalDate)->format('%H:%I:%S');
        $workingTime = $endDate->diff($startDate)->format('%H:%I:%S');

        return [
          'workedHours' => $workedHours,
          'workingTime' => $workingTime,
        ];
    }



    public function destroy($id){
        $attendance = DB::table('attendance')->where('id', $id)->delete();
        return $attendance;
    }
}
