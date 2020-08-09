<?php

namespace App\stsk\Models;

use Illuminate\Database\Eloquent\Model;

class Delivery extends Model
{
    //
    public $timestamps = true ;
    protected $table = "rsk_delivery";

    protected $fillable = [
         'sale_id',
         'wh_transfer_id',
         'refference_no',
         'driver_staff_id',
         'delivery_address',
         'GPS_address',
         'delivery_date',
         'delivery_cost',
         'delivery_status',
         'recieved_By',
         'recieved_date',
         'created_by',
         'created_Date',
         'authorized_by',
         'authorized_date',        
         'ccy',
         'status',
         'flag'
    ];
}
