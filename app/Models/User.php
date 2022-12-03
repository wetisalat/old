<?php

namespace App\Models;

use App\Mail\SendCodeMail;
use App\Notifications\ResetPasswordNotification;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Illuminate\Support\Facades\Auth;
use Laravel\Fortify\TwoFactorAuthenticatable;
use Laravel\Jetstream\HasProfilePhoto;
use Laravel\Jetstream\HasTeams;
use Laravel\Sanctum\HasApiTokens;
use Spatie\Permission\Traits\HasRoles;

class User extends Authenticatable implements MustVerifyEmail
{
    use HasApiTokens;
    use HasFactory;
    use HasProfilePhoto;
    use HasTeams;
    use Notifiable;
    //    use TwoFactorAuthenticatable;
    use HasRoles;

    /**
     * The attributes that are mass assignable.
     *
     * @var string[]
     */
    protected $fillable = [
        'name', 'fullname', 'firstname', 'lastname', 'email', 'password', 'username', 'phone', 'terms', 'birthday', 'address', 'country', 'provider', 'provider_id',
        'stripe_id', 'status', 'last_login_at', 'last_login_ip', 'user_id', 'role_id', 'staff_id', 'immatricule', 'postcode', 'city', 'note', 'website',
        'is_subscription', 'plan_id', 'two_factor_code', 'two_factor_expires_at', 'plan', 'plan_id', 'shift_id', 'created_at'

    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array
     */
    protected $hidden = [
        'password',
        'remember_token',
        'two_factor_recovery_codes',
        'two_factor_secret',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
        'last_login_at' => 'datetime',
    ];

    /**
     * The accessors to append to the model's array form.
     *
     * @var array
     */
    protected $appends = [
        'profile_photo_url',
    ];


    public function plans()
    {
        return $this->belongsTo(Plan::class, 'plan_id', 'id');
    }


    public function sendEmailVerificationNotification()
    {
        $this->notify(new \App\Notifications\UserVerifyNotification(Auth::user()));
    }


    public function sendPasswordResetNotification($token)
    {
        $this->notify(new \App\Notifications\ResetPasswordNotification($token));
    }


    public function generateCode()
    {
        $code = rand(100000, 999999);

        $user = User::where('id', '=', auth()->user()->id)->first();

        $user->update(
            ['two_factor_code' => $code],
            ['two_factor_expires_at' => now()->addMinutes(10)],
            ['code' => $code]
        );


        $details = [
            'title' => 'Your two factor authentication code is:',
            'code' => $code,
            'firstname' => $user->firstname,
            'lastname' => $user->lastname
        ];

        \Mail::to($user->email)->send(new SendCodeMail($details));


        return $user;
    }

    public function role() 
    {
        return $this->belongsTo(Role::class);
    }
}
