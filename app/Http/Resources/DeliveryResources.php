<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Controllers\ModeController;
class DeliveryResources extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        $Mode=ModeController::TrnModeName($this->delivery_status);
      
        return [
            'sale_id'=>$this->sale_id,
            'wh_transfer_id'=>$this->wh_transfer_id,
            'refference_no'=>$this->refference_no,
            'driver_staff_id'=>$this->driver_staff_id,
            'delivery_address'=>$this->delivery_address,
            'GPS_address'=>$this->GPS_address,            
            'delivery_date'=>date('Y-m-d',strtotime($this->delivery_date)),
            'delivery_cost'=>$this->delivery_cost,
            'delivery_status'=>$Mode['full_name_en'],
            'recieved_By'=>$this->recieved_By,
            'recieved_date'=>date('Y-m-d',strtotime($this->recieved_date)),
            'created_by'=>$this->created_by,
            'created_at'=>date('Y-m-d',strtotime($this->created_at)),
            'authorized_by'=>$this->authorized_by,
            'authorized_date'=>date('Y-m-d',strtotime($this->authorized_date)),        
            'ccy'=>$this->ccy,
            'status'=>$this->status,
            'flag'=>$this->flag
        ];
    }
}
