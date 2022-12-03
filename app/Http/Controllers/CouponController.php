<?php

namespace App\Http\Controllers;

use App\Models\Coupon;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Stripe;
use DB;
use Illuminate\Support\Facades\Auth;

class CouponController extends Controller
{
    public function __construct()
    {
        Stripe\Stripe::setApiKey(config('app.stripe_secret'));
        $this->middleware('auth');
    }

    /**
     * Display a listing of the resource.
     *
     * @param Request $request
     * @return \Illuminate\Http\Response
     * @throws \Illuminate\Auth\Access\AuthorizationException
     */
    public function index()
    {
        /**

         * @get('/admin/coupons')
         * @name('admin.coupons.index')
         * @middlewares(web, auth:sanctum, verified)
         */
        // $this->authorize('manage coupons', Coupon::class);

        //$coupons = Coupon::all();

        //return view('admin.coupons.index', compact('coupons'));
        $pageConfigs = ['pageHeader' => false];
        
        if (Auth::User()->role_id == 0){
            return view('/admin/coupons', ['pageConfigs' => $pageConfigs]);
          }
          else{
            return view('/errors/404');
          }
    }


    public function coupons_query()
    {
        $documents = DB::select("SELECT * FROM users WHERE role_id = 2");
        $documents = json_encode($documents);
        $documents =  '{ "data":'.$documents."}";
        return $documents;
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        /**

         * @get('/admin/coupons/create')
         * @name('admin.coupons.create')
         * @middlewares(web, auth:sanctum, verified)
         */
        // $this->authorize('create', Coupon::class);

        return view('admin.coupons.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        /**

         * @post('/admin/coupons')
         * @name('admin.coupons.store')
         * @middlewares(web, auth:sanctum, verified)
         */
        // $this->authorize('create', Coupon::class);

        $this->validate($request, [
            'name' => 'required',
            'percent_off' => 'required',
            'gateway_id' => 'required',
            'duration' => 'required',
        ]);

        // Test if duration_in_months is not empty
        $duration_in_months = ! empty($request->input('duration_in_months')) ? (int) $request->input('duration_in_months') : null;
        $percent_off = (float) $request->input('percent_off');
        // dd($percent_off);

        \Stripe\Coupon::create([
            'name' => $request->input('name'),
            'percent_off' => $percent_off,
            'duration' => $request->input('duration'),
            'duration_in_months' => $duration_in_months,
            'id' => $request->input('gateway_id'),
        ]);

        $coupon = new Coupon([
            'name' => $request->input('name'),
            'percent_off' => $percent_off,
            'duration' => $request->input('duration'),
            'duration_in_months' => $duration_in_months,
            'gateway_id' => $request->input('gateway_id'),
        ]);

        $coupon->save();
        return redirect('admin/coupons/');
        return redirect()->back()->with('status', 'Your Coupon has been created.');
    }

    /**
     * Display the specified resource.
     *
     * @param  App\Models\Coupon $coupon
     * @return \Illuminate\Http\Response
     */
    public function show(Coupon $plan)
    {
        /**

         * @get('/admin/coupons/{coupon}')
         * @name('admin.coupons.show')
         * @middlewares(web, auth:sanctum, verified)
         */
        $this->authorize('view', $plan);

        return view('admin.coupons.show');
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Coupon $coupon
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        /**

         * @get('/admin/coupons/{coupon}/edit')
         * @name('admin.coupons.edit')
         * @middlewares(web, auth:sanctum, verified)
         */
        // $this->authorize('update', Coupon::class);

        $coupon = Coupon::findOrFail($id);

        return view('admin.coupons-edit', compact('coupon', $coupon));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  \App\Models\Coupon $coupon
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        /**

         * @methods(PUT, PATCH)
         * @uri('/admin/coupons/{coupon}')
         * @name('admin.coupons.update')
         * @middlewares(web, auth:sanctum, verified)
         */
        // $this->authorize('update', Coupon::class);

        // Stripe\Stripe::setApiKey(env('STRIPE_SECRET'));
        $this->validate($request, [
            'name' => 'required',
            'percent_off' => 'required',
            'duration' => 'required',
            'duration_in_months' => 'required'
        ]);

        $coupon = Coupon::findOrFail($id);
        // Generate pla slug from plan name
        //$slug = str_replace(' ', '-', $request->input('name'));
        //$gateway_id = str_replace(' ', '_', $request->input('name'));
        //$team_enable = ! empty($request->input('teams_limit')) ? 1 : 0;
        //$teams_limit = ! empty($request->input('teams_limit')) ? $request->input('teams_limit') : null;
        //$price = (float) $request->input('price') * 100;
        // Delete the plan on stripe
        $duration_in_months = ! empty($request->input('duration_in_months')) ? (int) $request->input('duration_in_months') : null;
        $percent_off = (float) $request->input('percent_off');
        $stripe_plan = \Stripe\Coupon::retrieve($coupon->gateway_id);
        $stripe_plan->delete();
        // Recrete a new plan on stripe
        \Stripe\Coupon::create([
            'name' => $request->input('name'),
            'percent_off' => $percent_off,
            'duration' => $request->input('duration'),
            'duration_in_months' => $duration_in_months,
            'id' => $request->input('gateway_id'),
        ]);

        $coupon->name = $request->input('name');
        $coupon->percent_off = $percent_off;
        $coupon->duration = $request->input('duration');
        $coupon->duration_in_months = $duration_in_months;
        $coupon->gateway_id = $request->input('gateway_id');
        $coupon->save();

        return redirect('admin/coupons/');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Coupon $coupon
     * @return \Illuminate\Http\Response
     */
    public function delete_coupons($id)
    {
        /**

         * @delete('/admin/coupons/{coupon}')
         * @name('admin.coupons.destroy')
         * @middlewares(web, auth:sanctum, verified)
         */
       // $this->authorize('delete', Coupon::class);
        $coupon = Coupon::findOrFail($id);

        $stripe_plan = \Stripe\Coupon::retrieve($coupon->gateway_id);
        $stripe_plan->delete();

        // Delete the plan on the database
        $coupon->delete();
        return redirect('admin/coupons/');
        return redirect()->back()->with('status', 'Your plan has been deleted.');
    }
}
