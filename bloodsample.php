<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\User;

class BloodSample extends Model
{
    use HasFactory;
 protected $table = 'blood_samples'; 

 protected $fillable = [
    'user_id',
    'blood_type',
    'quantity',
];  

public function user()
{
    return $this->belongsTo(\App\Models\User::class);
}
}