<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Coupon extends Model
{
    protected $fillable = [
        'name', 'gateway_id', 'percent_off', 'duration', 'duration_in_months', 'currency',
    ];
}
