<?php

namespace App\Http\Controllers;

use App\Models\Location;
use App\Models\Shift;
use App\Models\Staff;
use App\Models\User;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use DataTables;

class ShiftController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth');
    }
    
  // Datatable Basic
  public function index()
  {
      $breadcrumbs = [['link' => "/", 'name' => "Home"], ['link' => "javascript:void(0)", 'name' => "Datatable"], ['name' => "Basic"]];


      $shifts = Shift::where('user_id', Auth::id())->get();


      $shiftList = [];

      foreach ($shifts as $value){

          $getShift = [];
          $getShift['id'] = $value->id;
          $getShift['name'] = $value->name;
          $getShift['start_time'] = $value->start_time;
          $getShift['end_time'] = $value->end_time;
          $getShift['working_time'] = $value->working_time;
          $getShift['break_time'] = $value->break_time;

          $getShift['users'] = User::where('shift_id', 'LIKE', "%$value->id%")->select('id', 'name')->get();

          $shiftList[] = $getShift;
      }

      if (Auth::User()->role_id == 1){
        return view('/users/settings/shift', ['breadcrumbs' => $breadcrumbs, 'attributes' => $shiftList]);
      }
      else{
        return view('/errors/404');
      }
  }


  // Shift Add
    public function store(Request $request){


      $this->validate($request, [
             'name' => ['required', 'unique:shift'],
             'start_time' => ['required'],
             'end_time' => ['required'],
      ]);

      $shift = new Shift();
      $shift->user_id = Auth::id();
      $shift->name = $request->name;
      $shift->start_time = $request->start_time;
      $shift->end_time = $request->end_time;
      $shift->break_time = $request->break_time;
      $shift->working_time = $request->working_time;
      $shift->save();

      return response()->json([
         'success' => 'Shift add successfully!'
      ]);

    }



    public function ajax_list(Request $request)
    {
        if ($request->ajax()) {

            $data = Shift::where('user_id', Auth::id())->get();

            $staffData = array();
            foreach ($data as $val){
                $staff = Staff::where('shift', $val->id)->get(['id', 'name', 'shift'])->toArray();

                if (!empty($staff)){
                    $staffData = $staff;
                }
            }

            $locationStaffArr = array();
            for ($g = 0; $g < count($staffData); $g++) {
                $id = explode(" ", $staffData[$g]['id']);

                $userAvatar = User::where('staff_id', '=', $id)->select('avatar')->get();

                $avatar = "";
                foreach ($userAvatar as $a){
                    $avatar .= $a['avatar'];
                }

                $staffData[$g]['avatar'] = $avatar;
                $locationStaffArr[$staffData[$g]['shift']][] = $staffData[$g];
            }

            //echo "<pre>";print_r($locationStaffArr);die;
            foreach ($data as $key => $value) {
                $staffArr = array();

                $moreStaff = 0;

                if (isset($locationStaffArr[$data[$key]['id']])) {
                    $totalStaff = count($locationStaffArr[$data[$key]['id']]);
                    if ($totalStaff > 3) {
                        $moreStaff = ($totalStaff - 3);
                    }
                    $staffArr = $locationStaffArr[$data[$key]['id']];
                }

                $data[$key]['staffArr'] = $staffArr;
                $data[$key]['moreStaff'] = $moreStaff;
                $value->responsive_id = null;
            }

            return Datatables::of($data)
                ->addIndexColumn()
                ->addColumn('action', function($row){
                    $btn = '<a href="javascript:void(0)" class="edit btn btn-primary btn-sm">View</a>';
                    return $btn;
                })
                ->rawColumns(['action'])
                ->make(true);

        }

        return view('company.shift');
    }



    // Edit Shift detials
    public function edit($id){
      $shift = Shift::find($id);
      return response()->json([
         'shift' => $shift
      ]);
    }



    // Update Shift Details
    public function update(Request $request){

        $this->validate($request, [
            'name' => ['required'],
            'start_time' => ['required'],
            'end_time' => ['required'],
        ]);

        $shift = Shift::find($request->id);
        $shift->user_id = Auth::id();
        $shift->name = $request->name;
        $shift->start_time = $request->start_time;
        $shift->end_time = $request->end_time;
        $shift->break_time = $request->break_time;
        $shift->working_time = $request->working_time;
        $shift->save();

        return response()->json([
            'success' => 'Shift update successfully!'
        ]);
    }



    // Shift Delete function

    public function destroy($id){

      $shift = Shift::find($id);
      $shift->delete();

        return response()->json([
            'success' => "Shift Delete Successfully."
        ]);

    }




}
