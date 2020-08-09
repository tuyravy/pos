<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Controllers\CompanyController;
use App\Http\Controllers\ModeController;
use Auth;

class CustomerResources extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        $CompanyCode = Auth::user()->CompanyCode;
        $branch_code = Auth::user()->brcode;
        $company=new CompanyController();
        $field="company_name_en";
        $com=$company->is_company($field,Auth::user()->brcode,$CompanyCode);
        $Br=$company->is_branch($branch_code);
        //Get json bank account
        $data=json_decode($this->bank_account,true);
        return [
            'cus_id'=>$this->cus_id, 
            'cus_code'=>$this->cus_code,
            'first_name_eng'=>$this->first_name_eng,
            'family_name_eng'=>$this->family_name_eng,
            'first_name_kh'=>$this->first_name_kh,
            'family_name_kh'=>$this->family_name_kh,
            'customer'=>$this->first_name_eng ." ".$this->family_name_eng,
            'gender'=>$this->gender,
            'marital_status'=>$this->marital_status,
            'position'=>$this->position,
            'birth_date'=>$this->birth_date,
            'identify_type_1'=>$this->identify_type_1,
            'identity_number_1'=>$this->identity_number_1,
            'identify_expire_date_1'=>$this->identify_expire_date_1,    
            'cus_anniversary_date'=>$this->cus_anniversary_date,        
            'house_no'=>$this->house_no,
            'group_no'=>$this->group_no,
            'street_no'=>$this->street_no,
            'locationcode'=>$this->locationcode,
            'address_detail'=>$this->address_detail,
            'gis_code'=>$this->gis_code,
            'social_type'=>$this->social_type,
            'social_contact'=>$this->social_contact,
            'email'=>$this->email,
            'phone'=>$this->phone,
            'company_name'=>$com->company_name_en,            
            'credit_limit'=>$this->credit_limit,
            'days_limit'=>$this->days_limit,
            'balance'=>$this->balance,
            'bank_account'=>$data["BankName"],
            'backaccountnumber'=>$data["BankNumber"],
            'ProCode'=>ModeController::getLocationSingle(substr($this->locationcode,0,-6)),
            'decode'=>ModeController::getLocationSingle(substr($this->locationcode,2,-4)),
            'ccode'=>ModeController::getLocationSingle(substr($this->locationcode,4,-2)),
            'vcode'=>ModeController::getLocationSingle($this->locationcode),
            'code'=>$this->locationcode,
            'flag'=>$this->flag,
            'brcode'=>$this->brcode,    
            'BrName'=>$Br->brName,      
            'work_phone'=>$this->work_phone,
            'company_email'=>$this->company_email,
            'company_vat_no'=>$this->company_vat_no,
            'company_contact_detail'=>$this->company_contact_detail,
            'cus_anniversary_date'=>$this->cus_anniversary_date,            
            'cus_other_note'=>$this->cus_other_note,
            'company_id'=>$this->company_id,
            'created_by'=>$this->created_by,
            'credit_limit'=>$this->credit_limit,
            'days_limit'=>$this->days_limit,
            'created_at'=>date("Y-m-d",strtotime($this->created_at)),
            'authorized_by'=>$this->authorized_by,
            'authorized_date'=>date("Y-m-d",strtotime($this->authorized_date)),
            'updated_by'=>$this->updated_by,
            'ccy'=>$this->ccy,
            'status'=>$this->status,
            
        ];
    }
}
