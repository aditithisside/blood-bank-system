<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request as HttpRequest;
use Illuminate\Support\Facades\Auth;
use App\Models\Request as BloodRequest;

class RequestController extends Controller
{
    /**
     * Receiver requests blood from a blood sample.
     */
    public function store(HttpRequest $request)
    {
        BloodRequest::create([
            'receiver_id' => Auth::id(),
            'blood_sample_id' => $request->blood_sample_id,
            'status' => 'pending'
        ]);

        return back()->with('success', 'Request sent successfully!');
    }

    /**
     * Hospital views blood requests for their posted samples.
     */
    public function hospitalRequests()
    {
        if (Auth::user()->role !== 'hospital') {
            abort(403);
        }

        $requests = BloodRequest::with('bloodSample', 'user')
            ->whereHas('bloodSample', function ($query) {
                $query->where('user_id', Auth::id());
            })->get();

        return view('hospital.requests', compact('requests'));
    }
}
