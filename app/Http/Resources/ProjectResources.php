<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use DB;
class ProjectResources extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        $cum=DB::Table("rsk_customer")->where('cus_id',$this->cus_id)->where('flag',1)->first();
        return 
        [
        'customer'=>$cum->first_name_eng ." ".$cum->family_name_eng,
        'project_id'=>$this->project_id,
        'cus_id'=>$this->cus_id,
        'project_name_eng'=>$this->project_name_eng,
        'project_name_kh'=>$this->project_name_kh,
        'project_address'=>$this->project_address,
        'gis_code'=>$this->gis_code,
        'project_start_date'=>$this->project_start_date,
        'project_exp_date'=>$this->project_exp_date,
        'project_note'=>$this->project_note,
        'company_name'=>$this->company_name,
        'created_by'=>$this->create_by,
        'created_date'=>$this->create_date,
        'authorized_by'=>$this->authorized_by,
        'authorized_date'=>$this->authorized_date,
        'created_at'=>$this->create_at,
        'updated_at'=>$this->updated_at,
        'updated_by'=>$this->updated_by,
        'company_id'=>$this->company_id,
        'brcode'=>$this->brcode
        ];
    }
}
