<?php

namespace App\stsk\Models;

use Illuminate\Database\Eloquent\Model;
use DB;
class Category extends Model
{
    //
    //
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $table = 'sys_category';
    protected $fillable = [
        'CategoryId', 'CategoryName', 'Note','BrCode','Company_id','Active'
    ];
    public function syscategory($CategoryId,$SubCategory,$Note,$BrCode,$Company_id){
        $Category =DB::select("call sys_category('2','".$CategoryId."','".$SubCategory."','".$Note."','".$BrCode."','".$Company_id."')");
    }
}
