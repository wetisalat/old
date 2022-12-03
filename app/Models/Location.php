<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;

class Location extends Model
{
    use HasFactory;
    use Notifiable;

    protected $table = 'location';
    protected $fillable = [
        'id','user_id', 'name', 'immatriculation', 'medicine','medicine_id', 'address', 'postcode', 'city', 'country', 'productivity', 'conventioncollective_id', 'code_ape_id','shift_id', 'created_at', 'updated_at',
        'bonus', 'rules'

    ];
}
