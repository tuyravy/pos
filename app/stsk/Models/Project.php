<?php

namespace App\stsk\Models;

use Illuminate\Database\Eloquent\Model;
use DB;
class Project extends Model
{
    //
    public $timestamps = true ;
    protected $table = "rsk_customer_project"; 
    protected $fillable = [
        'project_id','cus_id','project_name_eng', 'project_name_kh','project_address','gis_code',
        'project_start_date','project_exp_date','project_note','company_name','created_by','created_date',
        'authorized_by','authorized_date','created_at','updated_at','updated_by','company_id','brcode'
    ];
    public static function getProjectList()
    {
        $selectraw="
                    rsk_customer_project.project_id,
                    rsk_customer_project.BrCode,
                    branch.brName as BrName,
                    rsk_customer_project.project_name_eng,
                    rsk_customer_project.project_name_kh,
                    rsk_customer.gender,
                    rsk_customer_project.company_name,
                    rsk_customer.first_name_eng,
                    rsk_customer.family_name_eng,
                    rsk_customer_project.project_name_eng,
                    rsk_customer_project.project_name_kh,
                    rsk_customer_project.project_start_date,
                    rsk_customer_project.project_exp_date,
                    rsk_customer_project.created_by,
                    rsk_customer_project.authorized_by,
                    rsk_customer_project.authorized_date,
                    rsk_customer_project.created_date,
                    rsk_customer_project.created_at,
                    rsk_customer_project.updated_at,
                    rsk_customer_project.updated_by,
                    rsk_customer_project.status
                   ";
        $project=DB::table('rsk_customer_project')
                    ->Join("rsk_customer","rsk_customer.cus_id","=","rsk_customer_project.cus_id")
                    ->join("branch","branch.brCode","=","rsk_customer_project.BrCode")
                    ->selectRaw($selectraw)
                    ->where('rsk_customer_project.flag',1)
                    ->get();
        $data=[];
        foreach($project as $row){
            $da=[
                "project_id"=>$row->project_id,
                "BrCode"=>$row->BrCode,
                "BrName"=>$row->BrName,
                "project_name_eng"=>$row->project_name_eng,
                "project_name_kh"=>$row->project_name_kh,
                "gender"=>$row->gender,
                "company_name"=>$row->company_name,
                "first_name_eng"=>$row->first_name_eng,
                "family_name_eng"=>$row->family_name_eng,
                "project_name_eng"=>$row->project_name_eng,
                "project_start_date"=>date('Y-m-d',strtotime($row->project_start_date)),
                "project_exp_date"=>date('Y-m-d',strtotime($row->project_exp_date)),
                "created_by"=>$row->created_by,
                "created_at"=>date('Y-m-d',strtotime($row->created_at)),
                "authorized_by"=>$row->authorized_by,
                "authorized_date"=>date('Y-m-d',strtotime($row->authorized_date)),        
                "updated_at"=>date('Y-m-d',strtotime($row->updated_at)),
                "updated_by"=>$row->updated_by,
                "status"=>$row->status

            ];
            $data[]=$da;
        }
        return $data;
    }
    public static function ShowProjectList($id)
    {
        $selectraw="
                    rsk_customer_project.project_id,
                    rsk_customer_project.BrCode,
                    rsk_customer_project.project_name_eng,
                    rsk_customer_project.project_name_kh,
                    rsk_customer.gender,
                    rsk_customer_project.company_name,
                    rsk_customer.first_name_eng,
                    rsk_customer.family_name_eng,
                    rsk_customer_project.project_name_eng,
                    rsk_customer_project.project_name_kh,
                    rsk_customer_project.project_start_date,
                    rsk_customer_project.project_exp_date,
                    rsk_customer_project.created_by,
                    rsk_customer_project.authorized_by,
                    rsk_customer_project.authorized_date,
                    rsk_customer_project.created_date,
                    rsk_customer_project.created_at,
                    rsk_customer_project.updated_at,
                    rsk_customer_project.updated_by,
                    rsk_customer_project.status,
                    rsk_customer_project.gis_code,
                    rsk_customer_project.project_address,
                    rsk_customer_project.project_note                    
                   ";
        $project=DB::table('rsk_customer_project')
                    ->Join("rsk_customer","rsk_customer.cus_id","=","rsk_customer_project.cus_id")
                    ->selectRaw($selectraw)
                    ->where('rsk_customer_project.flag',1)
                    ->where('rsk_customer_project.project_id',$id)
                    ->get();
        $data=[];
        foreach($project as $row){
            $da=[
                "project_id"=>$row->project_id,
                "BrCode"=>$row->BrCode,
                "projectnameen"=>$row->project_name_eng,
                "projectnamekh"=>$row->project_name_kh,
                "gender"=>$row->gender,
                "company_name"=>$row->company_name,
                "first_name_eng"=>$row->first_name_eng,
                "family_name_eng"=>$row->family_name_eng,
                "project_name_eng"=>$row->project_name_eng,
                "datestartproject"=>date('Y-m-d',strtotime($row->project_start_date)),
                "dateendproject"=>date('Y-m-d',strtotime($row->project_exp_date)),
                "created_by"=>$row->created_by,
                "created_at"=>date('Y-m-d',strtotime($row->created_at)),
                "authorized_by"=>$row->authorized_by,
                "authorized_date"=>date('Y-m-d',strtotime($row->authorized_date)),        
                "updated_at"=>date('Y-m-d',strtotime($row->updated_at)),
                "updated_by"=>$row->updated_by,
                "status"=>$row->status,
                "gisCode"=>$row->gis_code,
                "projectaddress"=>$row->project_address,
                "projectnoted"=>$row->project_note,

            ];
            $data[]=$da;
        }
        return $data;
    }
}
