@extends('layouts.app')

@section('content')
    <div class="max-w-md mx-auto mt-10 p-6 bg-white rounded shadow">
        <h2 class="text-2xl font-bold mb-4">Add Blood Sample</h2>

        @if (session('success'))
            <div class="bg-green-100 text-green-800 p-2 rounded mb-4">
                {{ session('success') }}
            </div>
        @endif

        <form action="{{ route('blood.store') }}" method="POST" class="space-y-4">
            @csrf

            <div>
                <label for="blood_type" class="block font-medium">Blood Type</label>
                <input type="text" name="blood_type" id="blood_type" required
                    class="w-full border border-gray-300 rounded p-2">
            </div>

            <div>
                <label for="quantity" class="block font-medium">Quantity</label>
                <input type="number" name="quantity" id="quantity" required
                    class="w-full border border-gray-300 rounded p-2">
            </div>

            <button type="submit" class="bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700">
                Submit
            </button>
        </form>
    </div>
@endsection
