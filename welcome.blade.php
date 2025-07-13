<!DOCTYPE html>
<html>
<head>
    <title>Blood Bank App</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.7/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100 flex items-center justify-center h-screen">

    <div class="text-center">
        <h1 class="text-4xl font-bold mb-6">Welcome to Blood Bank</h1>

        @if (Route::has('login'))
            <div class="space-x-4">
                @auth
                    <a href="{{ url('/dashboard') }}" class="text-blue-600 underline">Dashboard</a>

                    <!-- ✅ Proper Logout Form -->
                    <form method="POST" action="{{ route('logout') }}" class="inline">
                        @csrf
                        <button type="submit" class="text-red-600 underline">Logout</button>
                    </form>
                @else
                    <a href="{{ route('login') }}" class="text-blue-600 underline">Login</a>
                    <a href="{{ route('register') }}" class="text-blue-600 underline">Register</a>
                @endauth
            </div>
        @endif
    </div>

</body>
</html>
