<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use App\stsk\Models\Plan;
use App\Http\Resources\PlanResource;
use App\Http\Resources\ReportResources;
use App\stsk\Acl;
use App\stsk\JsonResponse;
use App\stsk\Models\Permission;
use Illuminate\Http\Resources\Json\ResourceCollection;
use Illuminate\Support\Arr;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rule;
use App\Http\Controllers\CompanyController;
use Validator;
use DB;
use Illuminate\Support\Facades\Auth;

class ReportsController extends Controller
{
    public function index(Request $request){
        //get all report and relationship values
       // $reportlist=DB::select("select distinct title as title from stsk_fields_summary where flag=1");
    //    $ReportDatePreMonth=date("Y-n-j", strtotime("last day of previous month"));
    //    $ReportDateInMonth=date("Y-m-t", strtotime(now()));
       
       $company=new CompanyController();
       $field="CompanyCode";
       $com=$company->is_company($field,Auth::user()->brcode,Auth::user()->CompanyCode);

       if(empty($request->CompanyCode) || $request->Saledate=='Invalid date'){
           $CompanyCode=$com->CompanyCode;
           $ReportDate=date('Y-m-d');
       }else{
        $CompanyCode=$request->CompanyCode;
        $ReportDate=$request->Saledate;
       }
       $reportlist=DB::select("CALL get_data_filter_reports('".$CompanyCode."','".$ReportDate."')");
        $data=[];
        foreach($reportlist as $row){
            $da=
            [
                "title"=>$row->title,
                "fields_type"=>$row->fields_type,
                "CompanyCode" =>$row->CompanyCode,
                "plan_values"=>$row->plan_values,
                "result_value"=>$row->result_value,
                "result_month"=>$row->result_month,
                "result_in_year"=>$row->result_in_year,
                "plan_yearly_values"=>$row->plan_yearly_values,
                "result_previous_month"=>$row->result_previous_month,
            ];
            $data[]=$da;
        }
        return collect(["data"=>$data])->toArray();

    }
}
