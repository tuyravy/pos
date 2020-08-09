<?php

namespace App\stsk\Models;

use Illuminate\Database\Eloquent\Model;

class Warehouse extends Model
{
    public $timestamps = true ;
    protected $table = "warehouse";

    protected $fillable = [  
         'warehouse_id',      
         'warehouse_code',
         'warehouse_name',
         'warehouse_note',
         'brcode',
         'company_name',
         'company_id',
         'created_by',
         'created_date',
         'authorized_by',
         'created_at',
         'authorized_date',
         'status',
         'flag'
    ];
}
