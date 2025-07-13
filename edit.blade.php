<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Edit Profile') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg p-6">
                @if (session('status') === 'profile-updated')
                    <div class="mb-4 font-medium text-sm text-green-600">
                        {{ __('Profile updated successfully.') }}
                    </div>
                @endif

                <form method="POST" action="{{ route('profile.update') }}">
                    @csrf
                    @method('PATCH')

                    <!-- Name -->
                    <div class="mb-4">
                        <label class="block text-gray-700">Name</label>
                        <input type="text" name="name" value="{{ old('name', $user->name) }}"
                               class="mt-1 block w-full border border-gray-300 rounded p-2">
                    </div>

                    <!-- Email -->
                    <div class="mb-4">
                        <label class="block text-gray-700">Email</label>
                        <input type="email" name="email" value="{{ old('email', $user->email) }}"
                               class="mt-1 block w-full border border-gray-300 rounded p-2">
                    </div>

                    <!-- State -->
                    <div class="mb-4">
                        <label class="block text-gray-700">State</label>
                        <input type="text" name="state" value="{{ old('state', $user->state) }}"
                               class="mt-1 block w-full border border-gray-300 rounded p-2">
                    </div>

                    <!-- Address -->
                    <div class="mb-4">
                        <label class="block text-gray-700">Address</label>
                        <input type="text" name="address" value="{{ old('address', $user->address) }}"
                               class="mt-1 block w-full border border-gray-300 rounded p-2">
                    </div>

                    <!-- Submit -->
                    <div>
                        <button type="submit"
                                class="px-4 py-2 bg-blue-600 text-white rounded hover:bg-blue-700">
                            Save
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</x-app-layout>
