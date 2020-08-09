<?php

namespace App\stsk\Models;

use Illuminate\Database\Eloquent\Model;

class Customer extends Model
{
    protected $table="rsk_customer";
    protected $fillable = [
        'cus_id',
        'cus_code',
        'first_name_eng',
        'family_name_eng',
        'first_name_kh',
        'family_name_kh',
        'gender',
        'marital_status',
        'position',
        'birth_date',
        'identify_type_1',
        'identity_number_1',
        'identify_expire_date_1',
        'identify_type_2',
        'identity_number_2',
        'identify_expire_date_2',
        'identify_type_3',
        'identity_number_3',
        'identify_expire_date_3',
        'house_no',
        'group_no',
        'street_no',
        'locationcode',
        'address_detail',
        'gis_code',
        'social_type',
        'social_contact',
        'email','phone',
        'company_name',
        'photo',
        'credit_limit',
        'days_limit',
        'balance',
        'ccy',
        'bank_account',
        'score',
        'cus_level',
        'cus_risk_level',
        'work_phone',
        'company_email',
        'company_vat_no',
        'company_contact_detail',
        'cus_anniversary_date',
        'cus_attach_file1',
        'cus_other_note',
        'joint_date',
        'length_service',
        'monthly_income',
        'profit',
        'flag',
        'economic_sector',
        'deposit_balance',
        'company_id',
        'created_by',
        'brcode',
        'authorized_by',
        'authorized_date'
    ];
}
