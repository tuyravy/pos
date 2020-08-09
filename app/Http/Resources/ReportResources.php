<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class ReportResources extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'title' =>$this->title,
            'fields_type' =>$this->fields_type,
            'CompanyCode' =>$this->CompanyCode,
            'plan_values' =>$this->plan_values,
            'result_value'=>$this->result_value,
            'result_month'=>$this->result_month,
            'result_previous_month'=>$this->result_previous_month,          
        ];
    }
}
