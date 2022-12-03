<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Pagination\Paginator;
use Illuminate\Support\Facades\Auth;

class InvoiceController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth');
    }
    
    // invoice list App
    public function index(Request $request)
    {
        $array = currentTeam()->invoices()->toArray();
        $total = count($array);
        $per_page = 10;
        $current_page = $request->input("page") ?? 1;
        $starting_point = ($current_page * $per_page) - $per_page;
        $array = array_slice($array, $starting_point, $per_page, true);

        $invoices = new Paginator($array,  $per_page, $current_page, [
            'path' => $request->url(),
            'query' => $request->query(),
        ]);
        // dd($invoices->first());
        $pageConfigs = ['pageHeader' => true];

        if (Auth::User()->role_id == 1){
            return view('/users/invoice/index', ['pageConfigs' => $pageConfigs, 'invoices' => $invoices]);
          }
          else{
            return view('/errors/404');
          }
    }

    // invoice preview App
    public function invoice_preview()
    {
        $pageConfigs = ['pageHeader' => false];

        if (Auth::User()->role_id == 1){
            return view('/users/invoice/preview', ['pageConfigs' => $pageConfigs]);
          }
          else{
            return view('/errors/404');
          }
    }

    // invoice print App
    public function invoice_print()
    {
        $pageConfigs = ['pageHeader' => false];

        
        if (Auth::User()->role_id == 1){
            return view('/users/invoice/print', ['pageConfigs' => $pageConfigs]);
          }
          else{
            return view('/errors/404');
          }
    }
}
