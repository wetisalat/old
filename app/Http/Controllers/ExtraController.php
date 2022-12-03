<?php

namespace App\Http\Controllers;

use App\Models\Location;
use App\Models\Extra;
use App\Models\Staff;
use App\Models\User;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use DataTables;

class ExtraController extends Controller
{

  public function __construct()
  {
      $this->middleware('auth');
  }

  // Datatable Basic
  public function index()
  {
      $breadcrumbs = [['link' => "/", 'name' => "Home"], ['link' => "javascript:void(0)", 'name' => "Datatable"], ['name' => "Basic"]];

      $shiftList = [];
      $user = Auth::user();

      $lunch = DB::table('lunch')->where('paid', '=', '1')->get();

      $lunch_amount = DB::table('lunch_amount')->where('user_id', '=', $user->id)->get();
      $lunch_amount = $lunch_amount->map(function($item, $key) {
        $new_item = $item;
        $new_item->lunch = DB::table('lunch')->find($item->lunch_id);
        $new_item->type = 'lunch';
        return $new_item;
      });

      $night_amount = DB::table('night_amount')->where('user_id', '=', $user->id)->get();
      $night_amount = $night_amount->map(function($item, $key) {
        $new_item = $item;
        $new_item->type = 'night';
        return $new_item;
      });

      $transport_amount = DB::table('transport_amount')->where('user_id', '=', $user->id)->get();
      $transport_amount = $transport_amount->map(function($item, $key) {
        $new_item = $item;
        $new_item->type = 'transport';
        return $new_item;
      });

      if (Auth::User()->role_id == 1){
        return view('/users/settings/extra', [
          'breadcrumbs' => $breadcrumbs, 
          'attributes' => $shiftList, 
          'lunch' => $lunch,
          'lunch_amount' => $lunch_amount->toArray(),
          'night_amount' => $night_amount->toArray(),
          'transport_amount' => $transport_amount->toArray()
      ]);
      }
      else{
        return view('/errors/404');
      }

  }


  // Shift Add
    public function store(Request $request){

      $this->validate($request, [
        'type' => ['required'],
        'amount' => ['required'],
      ]);

      $type = $request->type;
      $user = Auth::user();

      switch ($type) {
        case 'lunch':
          DB::table("lunch_amount")->insert([
            'amount' => $request->amount,
            'user_id' => $user->id,
            'lunch_id' => $request->lunch_id,
            'created_at' => new \DateTime()
          ]);
          break;

        case 'night':
          DB::table("night_amount")->insert([
            'amount' => $request->amount,
            'user_id' => $user->id,
            'name' => $request->extra_name,
            'created_at' => new \DateTime()
          ]);
          break;
        
        case 'transport':
          DB::table("transport_amount")->insert([
            'amount' => $request->amount,
            'user_id' => $user->id,
            'name' => $request->extra_name,
            'created_at' => new \DateTime()
          ]);
          break;

        default:
          # code...
          break;
      }

      return response()->json([
         'success' => 'Extra add successfully!'
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



    // Edit Extra detials
    public function edit(Request $request, $id){
      $type = $request->type;
      $extra = [];

      $extra = DB::table($type.'_amount')->find($id);

      return response()->json([
         'extra' => $extra
      ]);
    }



    // Update Extra Details
    public function update(Request $request){

        $this->validate($request, [
            'amount' => ['required'],
        ]);

        $type = $request->type;
        $user = Auth::user();
        $id = $request->extraId;

        switch ($type) {
          case 'lunch':
            DB::table("lunch_amount")
              ->where([
                ['id', '=', $id],
                ['user_id', '=', $user->id]
              ])
              ->update([
                'amount' => $request->amount,
                'lunch_id' => $request->lunch_id,
                'updated_at' => new \DateTime()
              ]);
            break;

          case 'night':
            DB::table("night_amount")
              ->where([
                ['id', '=', $id],
                ['user_id', '=', $user->id]
              ])
              ->update([
                'amount' => $request->amount,
                'name' => $request->extra_name,
                'updated_at' => new \DateTime()
              ]);
            break;
          
          case 'transport':
            DB::table("transport_amount")
              ->where([
                ['id', '=', $id],
                ['user_id', '=', $user->id]
              ])
              ->update([
                'amount' => $request->amount,
                'name' => $request->extra_name,
                'updated_at' => new \DateTime()
              ]);
            break;

          default:
            # code...
            break;
        }

        return response()->json([
            'success' => 'Extra updated successfully!'
        ]);
    }



    // Extra Delete function
    public function destroy($id){

      DB::table(request()->type.'_amount')->delete($id);

        return response()->json([
            'success' => "Extra deleted successfully."
        ]);

    }

}
