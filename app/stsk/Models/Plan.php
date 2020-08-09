<?php

namespace App\stsk\Models;

use Illuminate\Database\Eloquent\Model;

class Plan extends Model
{
    //
    public $timestamps = true ;
    protected $table = "stsk_plan"; 
    protected $fillable = [
        'PlanName','PlanDate','PlanCode', 'PlanTitle','Values','FieldType',
        'created_by','ccy','CompanyName','CompanyId','PlanMode','servicepackage',
        'BrCode',
        'BrName',
        'flag'
    ];
}
