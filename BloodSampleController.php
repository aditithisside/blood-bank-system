<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\BloodSample;

class BloodSampleController extends Controller
{   public function create()

{
    if (Auth::user()->role !== 'hospital') {
            abort(403, 'Access denied');
}
return view('add-blood');
} 

   public function store(Request $request)
    {
        if (Auth::user()->role !== 'hospital') {
            abort(403, 'Only hospitals can add blood info');
        }



        $request->validate([
            'blood_type' => 'required|string',
            'quantity' => 'required|integer'
        ]);

        BloodSample::create([
            'user_id' => Auth::id(),
            'blood_type' => $request->blood_type,
            'quantity' => $request->quantity
        ]);

        return redirect('/dashboard')->with('success', 'Blood sample added!');

    }
    
        public function index()
{
    $samples = \App\Models\BloodSample::with('user')->get(); // all samples with hospital info
    return view('blood-list', compact('samples'));
}
}