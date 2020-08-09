<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Controllers\ModeController;
class PlanResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        $Mode=ModeController::TrnModeName($this->PlanMode);
        return [
            'PlanName'=>$this->PlanName,
            'PlanDate'=>$this->PlanDate,
            'PlanCode' =>$this->PlanCode,
            'PlanTitle' =>$this->PlanTitle,
            'FieldType' =>$this->FieldType,
            'PlanMode' =>$this->PlanMode,
            'PlanModeName' =>$Mode['short_name'],
            'Values'=>$this->Values,
            'created_by'=>$this->created_by,
            'ccy'=>$this->ccy,
            'CompanyName'=>$this->CompanyName,
            'CompanyId'=>$this->CompanyId,
            'BrCode'=>$this->BrCode,
            'BrName'=>$this->BrName
        ];
    }
}
