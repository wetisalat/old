<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Plan extends Model
{
    protected $table = 'plans';

    protected $fillable = [
        'title',
        'slug',
        'stripe_id',
        'price',
        'active',
        'teams_limit',
        'trial_period_days',
        'interval',
        'description',
        'free_billing',
    ];

    public function plans(){
        return $this->hasMany(User::class, 'id', 'plan_id');
    }


}
