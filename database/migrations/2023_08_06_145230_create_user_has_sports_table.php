<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('bsc_user_has_sports', function (Blueprint $table) {
            $table->id('bsc_id');
            $table->integer('bsc_user_id')->nullable()->default(null);
            $table->integer('bsc_sport_id')->nullable()->default(null);
            $table->string('status')->nullable()->default(null);
            
            $table->double('bsc_amount')->nullable()->default(null);
            $table->double('bsc_after_concession_amount')->nullable()->default(null);
            $table->integer('bsc_number_of_signup')->nullable()->default(null);
            $table->string('bsc_recurring_fee_type')->nullable()->default(null);
            $table->double('bsc_recurring_fee')->nullable()->default(null);

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('user_has_sports');
    }
};
