<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Request extends Model
{
    use HasFactory;

    protected $fillable = ['receiver_id', 'blood_sample_id', 'status'];

    public function bloodSample()
    {
        return $this->belongsTo(\App\Models\BloodSample::class, 'blood_sample_id');
    }

    public function user()
    {
        return $this->belongsTo(\App\Models\User::class, 'receiver_id');
    }
}
