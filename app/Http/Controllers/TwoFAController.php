<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Session;

class TwoFAController extends Controller
{

    /**
     * Write code on Method
     *
     * @return response()
     */
    public function index()
    {
        Session::forget('user_2fa');

        return view('auth.two-factor-challenge');
    }


    /**
     * Write code on Method
     *
     * @return response()
     */
    public function store(Request $request)
    {
        $request->validate([
            'code'=>'required',
        ]);

        $find = User::where('id', auth()->user()->id)
                ->where('two_factor_code', $request->code)
                ->where('updated_at', '>=', now()->subMinutes(2))
                ->first();

        if (!is_null($find)) {
            Session::put('user_2fa', auth()->user()->id);
            return redirect('/dashboard');;
        }

        return back()->with('error', 'You entered wrong code.');
    }

    /**
     * Write code on Method
     *
     * @return response()
     */
    public function resend()
    {
        auth()->user()->generateCode();

        return back()->with('success', 'We sent you code on your email.');
    }


}
