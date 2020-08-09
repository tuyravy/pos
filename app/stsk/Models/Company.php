<?php

namespace App\stsk\Models;

use Illuminate\Database\Eloquent\Model;

class Company extends Model
{
    //
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $table = 'company';
    protected $fillable = [
        'Company_id', 'company_name_en', 'CompanyCode'
    ];

}
