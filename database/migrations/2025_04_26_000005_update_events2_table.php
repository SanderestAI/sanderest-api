<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class UpdateEvents2Table extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('events', function (Blueprint $table) {
            $table->dropColumn(['reservated_at']);
            $table->timestamp('start_at', 0)->nullable()->after('details');
            $table->timestamp('end_at', 0)->nullable()->after('start_at');
            $table->timestamp('read_at', 0)->nullable()->after('end_at');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('events', function (Blueprint $table) {
            $table->dropColumn(['start_at','end_at','read_at']);
            $table->timestamp('reservated_at', 0)->nullable()->after('details');
        });
    }
}
