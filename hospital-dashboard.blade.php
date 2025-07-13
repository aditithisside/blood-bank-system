
@extends('layouts.app')

@section('content')
<div class="max-w-7xl mx-auto p-4">
    <h1 class="text-2xl font-bold mb-4">Hospital Dashboard</h1>

    <a href="{{ route('blood.create') }}" class="bg-green-600 text-white px-4 py-2 rounded hover:bg-green-700">
        ➕ Add Blood Sample
    </a>

    <a href="{{ route('hospital.requests') }}" class="ml-4 bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700">
        📄 View Blood Requests
    </a>
</div>
@endsection
