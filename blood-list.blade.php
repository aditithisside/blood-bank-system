@extends('layouts.app')

@section('content')
    <div class="max-w-4xl mx-auto mt-10">
        <h2 class="text-2xl font-bold mb-4">Available Blood Samples</h2>

        @if(session('success'))
            <div class="bg-green-100 text-green-800 p-2 rounded mb-4">
                {{ session('success') }}
            </div>
        @endif

        <ul class="space-y-4">
            @foreach($samples as $sample)
                <li class="p-4 bg-white rounded shadow">
                    <p><strong>Type:</strong> {{ $sample->blood_type }}</p>
                    <p><strong>Quantity:</strong> {{ $sample->quantity }}</p>
                    <p><strong>Hospital:</strong> {{ $sample->user->name }}</p>

                    @if(Auth::user()->role === 'receiver')
                        <form action="{{ route('request.blood') }}" method="POST" class="mt-2">
                            @csrf
                            <input type="hidden" name="blood_sample_id" value="{{ $sample->id }}">
                            <button type="submit"
                                class="bg-red-600 text-white px-4 py-2 rounded hover:bg-red-700">
                                Request
                            </button>
                        </form>
                    @endif
                </li>
            @endforeach
        </ul>
    </div>
@endsection

