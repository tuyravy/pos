<?php

namespace App\stsk\Models;

use Illuminate\Database\Eloquent\Model;

class DynamicForm extends Model
{
    //
    protected $table = 'skp_fields_from';
    protected $fillable = [
        'code', 'label', 'name','type','placeholder','companycode'
    ];
}
