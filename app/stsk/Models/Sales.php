<?php

namespace App\stsk\Models;

use Illuminate\Database\Eloquent\Model;
use App\stsk\Models\Product;
use App\stsk\Models\Mode;
use App\Http\Controllers\ModeController;
use DB;
class Sales extends Model
{
    public $timestamps = true ;
    protected $table = "rsk_sale";

    protected $fillable = [
         'sale_id',
         'invoice_no',
         'sale_date',
         'cus_id',
         'project_id',
         'saleman_id',
         'total_amount',
         'total_discount',
         'total_due_amount',
         'vat_amount',
         'sale_due_date',
         'total_paid_amount',
         'discount_rate',
         'warehouse_id',
         'delivery_id',
         'delivery_note',
         'delivery_reff_no',
         'delivery_address',
         'delivery_cost',
         'delivery_date',
         'company_id',
         'brcode',
         'sale_status',
         'payment_status',
         'repayment_status',
         'payment_terms',
         'sale_attach_1',
         'flag'
    ];
    public static function getSalelist($CompanyId,$userkey,$page,$limit,$brcode,$datestart,$dateend){
       $page=($page-1) * $limit;
       $result=DB::select("call get_rsk_salelist('".$userkey."','".$page."','".$limit."','1','".$brcode."','".$datestart."','".$dateend."')");
        $data=[];
        foreach($result as $row){
            $da=
            [
                "sale_id" => $row->sale_id,
                "SaleDate"=>date('Y-m-d',strtotime($row->sale_date)),
                "CompanyId"=>$row->CompanyId,
                "first_name_eng"=>$row->first_name_eng,
                "credit_limit"=>$row->credit_limit,
                "days_limit"=>$row->days_limit,
                "family_name_eng" =>$row->family_name_eng,
                "invoice_no"=>substr($row->invoice_no,4),
                "or_reff"=>$row->or_reff,
                "GrandTotal" =>$row->GrandTotal,
                "saleman"=>$row->saleman,
                "totalpaided"=>$row->totalpaided,
                "total_due_amount"=>$row->total_due_amount,               
                "salestatus"=>$row->salestatus,
                "balance_amount"=>$row->balance_amount,
                "Datedue"=>$row->Datedue,
                "Ccy"=>$row->Ccy,
                "created_by"=>$row->created_by,
                "BranchName"=>$row->BranchName,
                "PostedDate"=>$row->PostedDate,
                "PaymentStatus"=>ModeController::PaymentTerm($row->payment_terms),
                "authorized_by"=>$row->authorized_by,
                "authorized_date"=>$row->authorized_date,
                "updated_by"=>$row->updated_by,
                "status"=>$row->status,                
                "flag"=>$row->flag,
                "Ccy"=>$row->Ccy
            ];
            $data[]=$da;
        }
        return $data;
    }
    public static function TotalSaleList($CompanyId,$userkey,$page,$limit,$brcode,$datestart,$dateend){
       
        $result=DB::select("call get_rsk_salelist('".$userkey."','".$page."','".$limit."','2','".$brcode."','".$datestart."','".$dateend."')");
        foreach($result as $row){
            return $row->Total;
        }
        return 0;
    }
    public static function SearchSaleList($CompanyId,$userkey,$page,$limit,$brcode,$datestart,$dateend,$search){
        $page=($page-1) * $limit;
                $db="
                select 
                sale_date,
                s.sale_id,
                CONCAT(c.first_name_eng,c.family_name_eng) as customer,  
                c.first_name_eng as first_name_eng,      
                c.family_name_eng as family_name_eng,  
                case when s.payment_terms ='SRPM001' or s.payment_terms ='SRPM003' then 'Fully Paid'
                        else 'Due'
                end as salestatus,
                s.flag,
                s.or_reff,
                substr(s.invoice_no,3) as invoice_no,
                rs.StaffNameEng as saleman,
            `fn_return_SubTotal`('".$userkey."',s.sale_id)+`fn_return_TotalDiscount`('".$userkey."',s.sale_id)+`fn_return_TotalTaxAmount`('".$userkey."',s.sale_id) as GrandTotal,
                IFNULL(`fn_return_paidamount`(sale_id),0) as totalpaided,
                IFNULL(total_due_amount,0) as total_due_amount,
                IFNULL(`fn_return_EndingBalance`(s.sale_id),0) as balance_amount,
                '' as Datedue,
                '' as Ccy,
                '' as created_by,
                b.shortcode as BranchName,
                s.created_by as created_by,
                '' as PostedDate,
                '' as authorized_by ,
                '' as authorized_date,
                '' as updated_by,
                s.`status` as status,
                s.company_id as CompanyId,
            c.credit_limit,
            c.days_limit,
            s.payment_terms
        from rsk_sale s 
        inner join rsk_customer c on c.cus_id=s.cus_id
        left join rsk_staff rs on rs.System_Id = s.saleman_id
        left join branch b on b.brCode=s.brcode
        where s.flag in(1,2) and s.brcode='".$brcode."' and s.sale_date between DATE_FORMAT('".$datestart."','%Y%m%d') and DATE_FORMAT('".$dateend."','%Y%m%d') 
        and 
        s.sale_id like '%".$search."%'
        or CONCAT(c.first_name_eng,c.family_name_eng) like '%".$search."%'
        or s.sale_date like '%".date('Y-m-d',strtotime($search))."%'
        or c.first_name_eng like '%".$search."%'
        or c.family_name_eng like '%".$search."%'        
        LIMIT ".$page.",".$limit.";";
       
       $result=DB::select($db);
        
        $data=[];
        foreach($result as $row){
            $da=
            [
                "sale_id" => $row->sale_id,
                "SaleDate"=>date('Y-m-d',strtotime($row->sale_date)),
                "CompanyId"=>$row->CompanyId,
                "first_name_eng"=>$row->first_name_eng,
                "credit_limit"=>$row->credit_limit,
                "days_limit"=>$row->days_limit,
                "family_name_eng" =>$row->family_name_eng,
                "invoice_no"=>substr($row->invoice_no,4),
                "or_reff"=>$row->or_reff,
                "GrandTotal" =>$row->GrandTotal,
                "saleman"=>$row->saleman,
                "totalpaided"=>$row->totalpaided,
                "total_due_amount"=>$row->total_due_amount,               
                "salestatus"=>$row->salestatus,
                "balance_amount"=>$row->balance_amount,
                "Datedue"=>$row->Datedue,
                "Ccy"=>$row->Ccy,
                "created_by"=>$row->created_by,
                "BranchName"=>$row->BranchName,
                "PostedDate"=>$row->PostedDate,
                "PaymentStatus"=>ModeController::PaymentTerm($row->payment_terms),
                "authorized_by"=>$row->authorized_by,
                "authorized_date"=>$row->authorized_date,
                "updated_by"=>$row->updated_by,
                "status"=>$row->status,                
                "flag"=>$row->flag,
                "Ccy"=>$row->Ccy
            ];
            $data[]=$da;
        }
        return $data;
    }
    public static function TotalSearch($CompanyId,$userkey,$page,$limit,$brcode,$datestart,$dateend,$search){
        $db="select 
        count(*) as Total
        from rsk_sale s 
        inner join rsk_customer c on c.cus_id=s.cus_id
        left join rsk_staff rs on rs.System_Id = s.saleman_id
        left join branch b on b.brCode=s.brcode
        where s.flag in(1,2) and s.brcode='".$brcode."' and s.sale_date between DATE_FORMAT('".$datestart."','%Y%m%d') and DATE_FORMAT('".$dateend."','%Y%m%d') 
        and 
        s.sale_id like '%".$search."%'
        or CONCAT(c.first_name_eng,c.family_name_eng) like '%".$search."%'
        or s.sale_date like '%".date('Y-m-d',strtotime($search))."%'      
        or c.first_name_eng like '%".$search."%'
        or c.family_name_eng like '%".$search."%'
        
        ";
        $result=DB::select($db);
        foreach($result as $row){
            return $row->Total;
        }
        return 0;
    }
}
