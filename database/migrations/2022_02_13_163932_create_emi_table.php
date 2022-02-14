<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateEmiTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('emi', function (Blueprint $table) {
            $table->id();
            $table->integer('loan_id')->index();
            $table->datetime('payment_date');
            $table->double('monthly_emi');
            $table->double('interest_paid');
            $table->double('principal_paid');
            $table->double('balance');
            $table->softDeletes();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('emi');
    }
}
