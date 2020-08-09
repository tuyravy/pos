<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\ResourceCollection;
use Illuminate\Support\Arr;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rule;
use App\stsk\JsonResponse;
use App\Http\Resources\CustomerResources;
use Validator;
use Carbon\Carbon;
use DB;
use Illuminate\Http\Response;
use Auth;
use App\stsk\Models\Customer as CustomerModel;
use App\Http\Controllers\CompanyController;
class Customer extends Controller
{
    const ITEM_PER_PAGE = 15;
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        //
        $searchParams = $request->all();
        $limit = Arr::get($searchParams, 'limit', static::ITEM_PER_PAGE);
        $customer = CustomerModel::query();          
        return CustomerResources::collection($customer->paginate($limit));

    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
        //dd($request->all());
       
        $CompanyCode = Auth::user()->CompanyCode;
        $branch_code = Auth::user()->brcode;
        $last_id = CustomerModel::count();
        $company=new CompanyController();
        $field="Company_id";
        $com=$company->is_company($field,Auth::user()->brcode,$CompanyCode);
        $customer=CustomerModel::create(
            [
                'cus_id'        => ($com->Company_id.$branch_code.($last_id+1)), 
                'cus_code'      => 'CUS0000'.($last_id+1),
                'first_name_eng'=> $request->fristnameeng,
                'family_name_eng'=>$request->lastnameeng,
                'first_name_kh'=>$request->fristnamekh,
                'family_name_kh'=>$request->lastnamekh,
                'gender'=>$request->gender,
                'marital_status'=>$request->marristatus,
                'birth_date'=>date('Y-m-d',strtotime($request->dateofbrith)),
                'identify_type_1'=>$request->Identify_type,
                'identity_number_1'=>$request->identifynumber,
                'identify_expire_date_1'=>date('Y-m-d',strtotime($request->identify_expire_date)),
                'position'=>$request->position,
                'house_no'=>$request->house_no,
                'group_no'=>$request->group_no,
                'street_no'=>$request->street_no,
                'address_detail'=>$request->address,
                'locationcode'=>$request->vcode,
                'email'=>$request->email,
                'phone'=>$request->phone,
                'gis_code'=>$request->gisCode,
                'company_name'=>$request->companyname,
                'work_phone'=>$request->workphone,
                'company_email'=>$request->companyemail,
                'social_type'=>$request->social_type,
                'social_contact'=>$request->socialcontact,
                'bank_account'=>'{"BankName":"'.$request->bankaccount.'","BankNumber":"'.$request->backaccountnumber.'"}',
                'credit_limit'=>$request->creditlimit,
                'days_limit'=>$request->dayslimit,
                'ccy'=>$request->ccy,
                'created_by'=>Auth::user()->name,
                'company_contact_detail'=>$request->company_contact_detail,
                'company_id'=>$com->Company_id,
                'brcode'=>$branch_code
            ]
        );
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $customer=CustomerModel::query()->where('cus_id',$id)->first();
        return new CustomerResources($customer);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
        
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request,customer $cus_id)
    {
        
        //
        //
       
       
        $CompanyCode = Auth::user()->CompanyCode;
        $branch_code = Auth::user()->brcode;
        $last_id = CustomerModel::count();
        $company=new CompanyController();
        $field="Company_id";
        $com=$company->is_company($field,Auth::user()->brcode,$CompanyCode);
        $locationcode="";
        if($request->code<>$request->vcode){
            $locationcode=$request->code;
        }else{
            $locationcode=$request->code;
        }
        
        $customer=
            [
                'cus_id'=>$request->cus_id,
                'first_name_eng'=>$request->first_name_eng,
                'family_name_eng'=>$request->family_name_eng,
                'first_name_kh'=>$request->first_name_kh,
                'family_name_kh'=>$request->family_name_kh,
                'gender'=>$request->gender,
                'marital_status'=>$request->marital_status,
                'birth_date'=>date('Y-m-d',strtotime($request->birth_date)),
                'identify_type_1'=>$request->identify_type_1,
                'identity_number_1'=>$request->identity_number_1,
                'identify_expire_date_1'=>date('Y-m-d',strtotime($request->identify_expire_date_1)),
                'position'=>$request->position,
                'house_no'=>$request->house_no,
                'group_no'=>$request->group_no,
                'street_no'=>$request->street_no,
                'address_detail'=>$request->address_detail,
                'locationcode'=>$locationcode,
                'email'=>$request->email,
                'phone'=>$request->phone,
                'gis_code'=>$request->gis_code,
                'company_name'=>$request->company_name,
                'work_phone'=>$request->work_phone,
                'company_email'=>$request->company_email,
                'social_type'=>$request->social_type,
                'social_contact'=>$request->social_contact,
                'bank_account'=>'{"BankName":"'.$request->bank_account.'","BankNumber":"'.$request->backaccountnumber.'"}',
                'credit_limit'=>$request->credit_limit,
                'days_limit'=>$request->days_limit,
                'ccy'=>$request->ccy,
                'created_by'=>Auth::user()->name,
                'company_contact_detail'=>$request->company_contact_detail,
                'company_id'=>$com->Company_id,
                'brcode'=>$branch_code
            ];
           
            DB::table('rsk_customer')->where('cus_id',$request->cus_id)->where('flag',1)->update($customer);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
     /**
     * authorized approve
     */
    public function authorized(Request $request){
        $BrCode=Auth::user()->brcode;       
        $user=DB::table('users')
                        ->where('email',$request->email)                        
                        ->first();                       
        if ($user->email && $BrCode==$user->brcode && Hash::check($request->password,$user->password)) {
                $Customer=CustomerModel::query()->where('cus_id',$request->Id)->first();             
                if ($Customer->flag==1){
                    if($user->email<>Auth::user()->email){
                        CustomerModel::query()->where('cus_id',$request->Id)
                        ->update([                           
                                    'authorized_by'=>$user->name,
                                    'authorized_date'=>Carbon::now(),
                                    'status'=>0
    
                                ]);
                        $Customer->save();
                        return response()->json(new JsonResponse([], 'login Success'), Response::HTTP_OK);
                        }else{
                            return response()->json(new JsonResponse([], "You can't approve this transcation"), Response::HTTP_UNAUTHORIZED);
                        }
                }                
            
        }else{
             return response()->json(new JsonResponse([], 'login_error'), Response::HTTP_UNAUTHORIZED);
        }
    }
}
