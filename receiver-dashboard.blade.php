@extends('layouts.app')

@section('content')
<div class="max-w-7xl mx-auto p-4">
    <h1 class="text-2xl font-bold mb-4">Receiver Dashboard</h1>

    <a href="{{ route('blood.list') }}" class="bg-red-600 text-white px-4 py-2 rounded hover:bg-red-700">
        🩸 View Available Blood Samples
    </a>
</div>
@endsection

