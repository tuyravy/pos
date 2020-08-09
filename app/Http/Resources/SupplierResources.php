<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class SupplierResources extends JsonResource
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
            'Id' =>$this->Id,
            'company_id' =>$this->company_id,
            'supplier_name' =>$this->supplier_name,
            'supplier_address' => $this->supplier_address,
            'supplier_phone' =>$this->supplier_phone,
            'supplier_email' =>$this->supplier_email,            
            'contact_person' => $this->contact_person,
            'booking_date' =>$this->booking_date,          
            'supplier_vat' => $this->supplier_vat,
            'created_by' => $this->created_by,
            'created_date'  => $this->created_date,
            'updated_at'  => $this->updated_at,
            'BrCode' => $this->BrCode,
            'BrName'=> $this->BrName,
            'flag' =>$this->flage,            
        ];
    }
}
