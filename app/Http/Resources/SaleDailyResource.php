<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Controllers\ModeController;
class SaleDailyResource extends JsonResource
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
            'first_name_eng' =>$this->first_name_eng,
            'family_name_eng' =>$this->family_name_eng,
            'invoice_no' => $this->invoice_no,
            'customer' =>$this->customer,
            'SaleDate' => date('Y-m-d',strtotime($this->sale_date)),            
            'saleman' => $this->saleman,
            'GrandTotal' =>$this->GrandTotal,          
            'totalpaided' => $this->totalpaided,
            'balancedue' => $this->balancedue,
            'Datedue'  => $this->Datedue,
            'Ccy'  => $this->Ccy,
            'created_by' => $this->created_by,
            'BranchName'=> $this->BranchName,
            'PostedDate' =>$this->PostedDate,
            'authorized_by'  => $this->authorized_by,
            'authorized_date'  => $this->authorized_date,
            'updated_by'  => $this->updated_by,
            'status' => $this->status,            
            'flag' => $this->flag, 
        ];
    }
}
