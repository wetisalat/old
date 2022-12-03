<?php

namespace App\Http\Controllers;

use App\Models\Expenses;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Auth;
use DB;
use Illuminate\Support\Facades\Hash;
use App\Models\User;
use Storage;
use File;
use Repsonse;

class ExpensesController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }
    
    // Staff expenses
    public function staff_expenses()
    {
        $pageConfigs = ['layoutWidth' => 'full'];
        return view('/staff/expenses', ['pageConfigs' => $pageConfigs]);
    }


    // User expenses
    public function expenses()
    {
        $pageConfigs = ['layoutWidth' => 'full'];

        $user = auth()->user();
        $staffCount = DB::table('attendance')
                    ->leftjoin('users', 'attendance.user_id', '=', 'users.id')
                    ->where('users.user_id' , '=', $user->id)->get()->count();
        return view('/users/expenses/index', ['pageConfigs' => $pageConfigs, 'staffCount' => $staffCount]);
    }

    // Add Expenses
    public function add_expenses(Request $request){


        $expenses = new Expenses();

        $this->validate($request, [
            'date' => ['required'],
            'type' => ['required'],
            'salary' => ['required'],
            'attachment' => ['required']
        ]);

        $oldId = $request->oldId;


        if ($oldId !== null){
            $expenses = Expenses::where('id', '=', $oldId)->first();

            $attachment = Expenses::fileUpdated($request, $expenses);
            $expenses->user_id = Auth::id();
            $expenses->date = $request->date;
            $expenses->type = $request->type;
            $expenses->salary = $request->salary;
            $expenses->attachment = $attachment;
            $expenses->comment = $request->comment;
            $expenses->update();

        }else{
            $attachment = Expenses::fileUpload($request);
            $expenses->user_id = Auth::id();
            $expenses->date = $request->date;
            $expenses->type = $request->type;
            $expenses->salary = $request->salary;
            $expenses->attachment = $attachment;
            $expenses->comment = $request->comment;
            $expenses->status = 2;

            $expenses->save();
        }


        return response()->json([
            'message' => 'Expenses save successfully!'
        ]);

    }


    public function query_expenses(){
        $user = DB::table('users')->where('id', '=', Auth::id())->first();
        $expenses = null;
        if($user->role_id == 1){
            $expenses = DB::table('expense')
                ->leftjoin('users', 'expense.user_id', '=', 'users.id')
                ->leftJoin('staff', 'expense.user_id', '=', 'staff.user_id')
                ->leftJoin('contract_type', 'staff.contract_type', '=', 'contract_type.id')
                ->leftJoin('status', 'expense.status', '=', 'status.id')
                ->where('users.user_id' , '=', Auth::id())
                ->select('expense.*', "status.name as status_name", 'users.firstname', 'users.lastname',
                    'users.profile_photo_path', 'users.email', "contract_type.name as contract_type_name")
                ->get()->toArray();
        }else{
            $expenses = DB::table('expense')
                ->leftJoin('status', 'expense.status', '=', 'status.id')
                ->where('expense.user_id' , '=', Auth::id())
                ->select('expense.*', "status.name as status_name")
                ->get()->toArray();
        }

        $expenses = json_encode($expenses);
        $expenses =  '{ "data":'.$expenses."}";
        return $expenses;
    }

    // Get leave statistics
    public function getStatistics()
    {
        $stats = DB::table('expense')
            ->leftJoin('status', 'expense.status', '=', 'status.id')
            ->leftjoin('users', 'expense.user_id', '=', 'users.id')
            ->groupBy('status.name')
            ->select('status.name as status', DB::raw('count(*) as total'))
            ->where('users.user_id' , '=', Auth::id())
            ->get();

        return response()->json(['data' => $stats]);
    }


    public function updateStaffStatus(Request $request, $id)
    {
        $statusName = $request->status;

        $query = DB::table('status')->where('name', $statusName);
        $status = $query->first();

        if($query->exists()) {
            $expense = DB::table('expense')->where('id', $id)->update(['status' => $status->id]);

            return response()->json(['message' => 'Expense updated']);
        }

        return response()->json(['message' => 'Expense status update failed']);
    }


    // Delete Expenses
    public function expenses_delete(Request $request){
        $expenses = Expenses::where('id', '=', $request->id)->first();
        $attachemt = $expenses->attachment;
        $folderPath = 'images/expenses/' . $attachemt;
        if (file_exists($folderPath)){
            @unlink($folderPath);
        }
        $expenses->delete();
        return $expenses;
    }

    // Edit Expenses
    public function expenses_edit($id){
        $expenses = DB::table('expense')->where('id', '=', $id)->first();
        return response()->json([
            'expenses' => $expenses,
        ]);
    }


    // Download File
    public function expenses_download($request){
        $folderPath = public_path('images/expenses/' . $request);
        return \Response::download($folderPath);
    }

}
