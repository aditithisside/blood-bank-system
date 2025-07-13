<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('requests', function (Blueprint $table) {
            $table->id();
             $table->unsignedBigInteger('receiver_id');
        $table->unsignedBigInteger('blood_sample_id');
        $table->string('status')->default('pending');
            $table->timestamps();

              $table->foreign('receiver_id')->references('id')->on('users')->onDelete('cascade');
        $table->foreign('blood_sample_id')->references('id')->on('blood_samples')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('requests');
    }
};
