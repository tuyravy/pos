<?php

namespace App\stsk\Models;

use Illuminate\Database\Eloquent\Model;
use DB;
class Product extends Model
{
    protected $table="product";
    protected $fillable = [
        'product_id', 'category_id','product_code','product_name_eng','product_name_kh'
    ];

    // public function sale()
    // {
    //   return $this->belongsTo(Sales::class);
    // }
    public function AddProduct($subcategory_id,$product_code,$product_name_eng,$product_name_kh,$product_details,$warehouse_id,$company_id,$brcode,$created_by,$created_date){

        $AddProduct =DB::select("call sys_product('".$subcategory_id."','".$product_code."','".$product_name_eng."','".$product_name_kh."','".$product_details."','".$warehouse_id."','".$company_id."','".$brcode."','".$created_by."','".$created_date."')");
        
    }
}
