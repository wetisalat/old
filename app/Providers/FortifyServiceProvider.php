<?php

namespace App\Providers;

use App\Actions\Fortify\CreateNewUser;
use App\Actions\Fortify\ResetUserPassword;
use App\Actions\Fortify\UpdateUserPassword;
use App\Actions\Fortify\UpdateUserProfileInformation;
use App\Models\User;
use App\Notifications\TwoFactorCode;
use Illuminate\Cache\RateLimiting\Limit;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\RateLimiter;
use Illuminate\Support\ServiceProvider;
use Laravel\Fortify\Contracts\LogoutResponse;
use Laravel\Fortify\Fortify;
use Mail;
use App\Mail\SendCodeMail;

class FortifyServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        $this->app->instance(LogoutResponse::class, new class implements LogoutResponse {
            public function toResponse($request)
            {
                return redirect('/');
            }
        });
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        Fortify::createUsersUsing(CreateNewUser::class);
        Fortify::updateUserProfileInformationUsing(UpdateUserProfileInformation::class);
        Fortify::updateUserPasswordsUsing(UpdateUserPassword::class);
        Fortify::resetUserPasswordsUsing(ResetUserPassword::class);

        RateLimiter::for('login', function (Request $request) {
            return Limit::perMinute(5)->by($request->email.$request->ip());
        });

        RateLimiter::for('two-factor', function (Request $request) {
            return Limit::perMinute(5)->by($request->session()->get('login.id'));
        });


        Fortify::requestPasswordResetLinkView(function (){
            return view('auth.forgot-password');
        });

        Fortify::resetPasswordView(function ($request){
            return view('auth.reset-password', ['request' => $request]);
        });

        Fortify::verifyEmailView(function () {
            return view('auth.verify-email');
        });


        Fortify::confirmPasswordView(function (){
            return view('auth.password-confirm');
        });


        Fortify::authenticateUsing(function (Request $request) {
            $user = User::where('email', $request->email)->first();

            if ($user && Hash::check($request->password, $user->password)) {

                $this->custom_two_factor_auth($user);

                return $user;
            }
        });

    }


    protected function custom_two_factor_auth($user)
    {
        $code = rand(100000, 999999);

        $user = User::where('id', '=', $user->id)->first();

        $user->update(
            [ 'two_factor_code' => $code ],
            [ 'two_factor_expires_at' => now()->addMinutes(10) ],
            [ 'code' => $code ]
        );


        $details = [
            'title' => 'Your two factor authentication code is:',
            'code' => $code,
            'firstname' => $user->firstname,
            'lastname' => $user->lastname
        ];

        \Mail::to($user->email)->send(new SendCodeMail($details));

        return redirect()->route('2fa.index');

    }
}
