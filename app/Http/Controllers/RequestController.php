<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use DB;

class RequestController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth');
    }
    
    // Request List Page
    public function index(Request $request)
    {        
        $user = auth()->user();

        if($request->ajax()) {
            $staff_user_ids = DB::table('users')
                ->where('users.role_id', 2)
                ->where('users.user_id', $user->id)
                ->pluck('id')->toArray();

            $leave = DB::table('vacation')
                ->leftJoin('users', 'users.id', 'vacation.staff_id')
                ->leftJoin('leave_reasons', 'leave_reasons.id', 'vacation.reason')
                ->leftJoin('status', 'vacation.status', '=', 'status.id')
                ->leftJoin('staff', 'vacation.staff_id', '=', 'staff.user_id')
                ->leftJoin('contract_type', 'staff.contract_type', '=', 'contract_type.id')
                ->select("vacation.id", "users.firstname", "users.lastname", "users.email", "leave_reasons.name as reason", "description", "allDay", "vacation.start", "vacation.end", "status.name as status_name", "vacation.created_at", "vacation.user_id", "contract_type.name as contract_type_name")
                ->whereIn('vacation.staff_id', $staff_user_ids)
                ->get();

            $leave = $leave->map(function($row) {
                $user = DB::table("users")->find($row->user_id);
                $row->approved_by = $user->firstname . ' ' . $user->lastname;
                $row->responsive_id = "";

                return $row;
            });

            return response()->json([
                'data' => $leave
            ]);
        }

        $staffCount = DB::table('users')->where('user_id', '=', $user->id)->count();

        $pageConfigs = ['pageHeader' => false];
        if (Auth::User()->role_id == 1){
            return view('/users/request/index', ['pageConfigs' => $pageConfigs, 'staffCount' => $staffCount]);
          }
          else{
            return view('/errors/404');
          }
    }

    // Get leave statistics
    public function getStatistics()
    {
        $user = auth()->user();
        
        $stats = DB::table('vacation')
            ->leftJoin('status', 'vacation.status', '=', 'status.id')
            ->groupBy('status.name')
            ->select('status.name as status', DB::raw('count(*) as total'))
            ->where('vacation.user_id', '=', $user->id)
            ->get();

        return response()->json(['data' => $stats]);
    }
}
