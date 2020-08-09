<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use DB;
class WarehouseResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        $branch=DB::table('branch')->where('brCode',$this->brcode)->where('flag',1)->first();
        if($this->brcode==$branch->brCode){
            $BrCode=$branch->brCode;
        }else{
            $BrCode=$branch->shortcode;
        }
        return [
            'warehouse_id'=>$this->warehouse_id,
            'warehouse_code' =>$this->warehouse_code,
            'warehouse_name' =>$this->warehouse_name,
            'warehouse_note' =>$this->warehouse_note,
            'brcode' =>$this->brcode,
            'ShortCode'=>$BrCode,
            'BrName' => $branch->brName,
            'company_name' =>$this->company_name,
            'company_id' =>$this->company_id,
            'created_by' =>$this->created_by,
            'updated_by' =>$this->updated_by,
            'created_at' =>date('Y-m-d',strtotime($this->created_at)),
            'authorized_by' =>$this->authorized_by,
            'authorized_date' =>date('Y-m-d',strtotime($this->authorized_date)),
            'status'=>$this->status
            ];
    }
}
