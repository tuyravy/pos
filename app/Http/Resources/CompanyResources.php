<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class CompanyResources extends JsonResource
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
                'Company_id'=>$this->Company_id,
                'company_name_en'=>$this->company_name_en,
                'CompanyCode'=>$this->CompanyCode
              ];
    }
}
