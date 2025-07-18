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
        Schema::create('blood_samples', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('user_id'); // hospital id
        $table->string('blood_type');
        $table->integer('quantity');
            $table->timestamps();
             $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
  
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('blood_samples');
    }
};
