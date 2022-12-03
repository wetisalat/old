<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use DB;

class AllowanceController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth');
    }

    // Account Settings allowance
    public function settings_allowance()
    {
        $breadcrumbs = [['link' => "/", 'name' => "Home"], ['link' => "javascript:void(0)", 'name' => "Account Settings"], ['name' => "Allowance"]];

        $lunch = DB::table('lunch')->get();
        $extra = DB::table('extra')->get();
        $vacation = DB::table('vacation_type')->get();

        $allowances = DB::table('allowances')->where('user_id', '=', Auth::id())->where('status', '=', 1)->get();
        $vacationsList = DB::table('allowances')->where('user_id', '=', Auth::id())->where('status', '=', 0)->get();

        if (Auth::User()->role_id == 1){
            return view('/users/settings/allowance', ['breadcrumbs' => $breadcrumbs, 'lunches' => $lunch,
            'extras' => $extra, 'vacations' => $vacation, 'allowances' => $allowances, 'vacationsList' => $vacationsList]);
          }
          else{
            return view('/errors/404');
          }
        
        
    }

    public function storeAllowance(Request $request){

        $userId = Auth::id();
        $error = [];

        $requestAllowances = $request->all()['data'];

        foreach ($requestAllowances as $allowance){

            if ($allowance['amount'] == null){
                $error[] = 'Cost and Quantity field is required';
            }else {

                $lunch_id = [];
                $vacation_id = [];
                $extra_id = [];

                $selectType =  $allowance['select_type'];

                foreach ($selectType as $type){
                    $getType = substr($type, 0, 4);

                    if ($getType == 'lun_'){
                        $getLuch = substr($type, -1);
                        $lunch_id[] = $getLuch;
                    }elseif($getType == 'vac_'){
                        $getVac = substr($type, -1);
                        $vacation_id[] = $getVac;
                    }else{
                        $getExt = substr($type, -1);
                        $extra_id[] = $getExt;
                    }
                }

                $lunch = null;
                if (count($lunch_id) > 0){
                    $lunch = implode(",", $lunch_id);
                }

                $vacaton = null;
                if (count($vacation_id) > 0){
                    $vacaton = implode(",", $vacation_id);
                }


                $extra = null;
                if (count($extra_id) > 0){
                    $extra = implode(",", $extra_id);
                }

                if (isset($allowance['id'])){
                    DB::table('allowances')->where('id', '=', $allowance['id'])->update([
                        'user_id' => $userId,
                        'amount' => $allowance['amount'],
                        'cost' => $allowance['cost'],
                        'quantity' => $allowance['quantity'],
                        'status' => $allowance['status'],
                        'lunch_id' => $lunch,
                        'vacation_id' => $vacaton,
                        'extra_id' => $extra,
                    ]);
                }else{

                    DB::table('allowances')->insert([
                        'user_id' => $userId,
                        'amount' => $allowance['amount'],
                        'cost' => $allowance['cost'],
                        'quantity' => $allowance['quantity'],
                        'status' => $allowance['status'],
                        'lunch_id' => $lunch,
                        'vacation_id' => $vacaton,
                        'extra_id' => $extra,
                    ]);
                }
            }
        }

        return response()->json([
           'error' => $error,
           'success' => 'Allowance Save Successfully.'
        ]);
    }



    public function storeVacation(Request $request){

        $userId = Auth::id();

        $error = [];

        $requestVacation = $request->all()['data'];

        foreach ($requestVacation as $vacation){

            if (count($vacation['vacation_id']) < 0 ){
                $error[] = 'Type field is required';
            }else {


                $vac = null;
                if (count($vacation['vacation_id']) > 0){
                    $vac = implode(",", $vacation['vacation_id']);
                }


                $paid = 0;
                if ($vacation['paid'] == 'true'){
                    $paid = 1;
                }

                if (isset($vacation['id'])){
                    DB::table('allowances')->where('id', '=', $vacation['id'])->update([
                        'user_id' => $userId,
                        'vacation_id' => $vac,
                        'status' => $vacation['status'],
                        'paid' => $paid
                    ]);

                }else{

                    DB::table('allowances')->insert([
                        'user_id' => $userId,
                        'vacation_id' => $vac,
                        'status' => $vacation['status'],
                        'paid' => $paid
                    ]);
                }

            }

        }


        return response()->json([
           'error' => $error,
           'success' => 'Vacation Save Successfully.'
        ]);
    }


    public function deleteAllowance(Request $request){

        $allowanceId = $request->all()['data'];

        DB::table('allowances')->where('id', '=', $allowanceId)->delete();

        return response()->json([
            'success' => 'Delete Successfully.'
        ]);


    }




}
