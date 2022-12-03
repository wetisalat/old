<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Subscriptions extends Model
{
    protected $fillable = ['team_id','name','stripe_id','stripe_status',
    'stripe_plan', 'quantity' ,'ends_at','trial_ends_at','created_at', 'updated_at'];
}
