<?php

namespace App\stsk\Models;

use Illuminate\Database\Eloquent\Model;
use DB;
class Supplier extends Model
{
    //
    public $timestamps = true ;
    protected $table = "rsk_supplier"; 
    protected $fillable = [
        'company_id','supplier_name','supplier_address', 'supplier_phone','supplier_email','contact_person',
        'booking_date','supplier_vat','created_by','created_date','updated_by','updated_at',
        'BrCode',
        'BrName',
        'flag'
    ];
    public static function GetListSupplier(){

         $db=DB::select("call sp_get_supplier(1)");
         return $db;
    }
}
