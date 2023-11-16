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
        Schema::create('db_contact', function (Blueprint $table) {
            $table->id(); //id
            $table->unsignedInteger("user_id")->nullable();
            $table->string('name',100);
            $table->string('email',100);
            $table->string('phone',15);
            $table->string('title',1000);
            $table->mediumText('content');
            $table->unsignedInteger('replay_id')->nullable();
            $table->unsignedInteger('created_by')->default(1);
            $table->unsignedInteger('updated_by')->nullable();
            $table->unsignedTinyInteger('status')->default(2);
            $table->timestamps(); //created_at, updated_at
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('db_contact');
    }
};
