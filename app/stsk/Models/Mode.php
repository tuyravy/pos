<?php

namespace App\stsk\Models;

use Illuminate\Database\Eloquent\Model;

class Mode extends Model
{
    protected $table = 'sys_lookup_code';
    protected $fillable = [
        'look_id','short_name'
    ];
}
