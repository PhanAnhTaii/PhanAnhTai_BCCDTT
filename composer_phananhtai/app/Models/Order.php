<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SortDeletes;

class Order extends Model
{   
    use HasFactory;
    protected $table='db_order';

}
