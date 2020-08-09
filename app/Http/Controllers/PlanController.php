<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use App\stsk\Models\Plan;
use App\Http\Resources\PlanResource;
use App\stsk\Acl;
use App\stsk\JsonResponse;
use App\stsk\Models\Permission;
use Illuminate\Http\Resources\Json\ResourceCollection;
use Illuminate\Support\Arr;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rule;
use App\Http\Controllers\CompanyController;
use Validator;
use DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Response;
use App\Http\Resources\UserResource;
use Carbon\Carbon;
use App\Http\Controllers\ModeController;
class PlanController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
         
       $com=new CompanyController(); 
       $companyId=0; 
       $CompanyCode =$request->CompanyCode; 
       $companyId=$com->is_company('Company_id',Auth::user()->brcode,$CompanyCode)->Company_id;
       $planlist=DB::select('CALL `get_by_company`('.$companyId.')');
       //$planlist=DB::select("select distinct CompanyId as CompanyId,PlanName,PlanDate,CompanyName,created_by as PostedBy,case when authorized_by is null then 'non authorized' else authorized_by end as AuthorizedBy,flag,status from stsk_plan where flag=1");
        $data=[];
        foreach($planlist as $row){
            $da=
            [
                "CompanyId"=>$row->CompanyId,
                "PlanName"=>$row->PlanName,
                "PlanModeName" =>ModeController::TrnModeName($row->PlanMode)->short_name,
                "PlanDate"=>date('Y-m-d',strtotime($row->PlanDate)),
                "CompanyName"=>$row->CompanyName,
                "PostedBy"=>$row->PostedBy,
                "AuthorizedBy"=>$row->AuthorizedBy,
                "flag"=>$row->flag,
                "status"=>$row->status
            ];
            $data[]=$da;
        }
        return collect(["data"=>$data])->toArray();

    }
    /**
     * Find plan for update 
     */
    public function updatePlan($companyId){

       
        $planlist=DB::select('CALL `get_by_company`('.$companyId.')');
        //$planlist=DB::select("select distinct CompanyId as CompanyId,PlanName,PlanDate,CompanyName,created_by as PostedBy,case when authorized_by is null then 'non authorized' else authorized_by end as AuthorizedBy,flag,status from stsk_plan where flag=1");
         $data=[];
         foreach($planlist as $row){
             $da=
             [
                 "CompanyId"=>$row->CompanyId,
                 "PlanName"=>$row->PlanName,
                 "PlanDate"=>date('Y-m-d',strtotime($row->PlanDate)),
                 "CompanyName"=>$row->CompanyName,
                 "PostedBy"=>$row->PostedBy,
                 "AuthorizedBy"=>$row->AuthorizedBy,
                 "flag"=>$row->flag,
                 "status"=>$row->status
             ];
             $data[]=$da;
         }
         return collect(["data"=>$data])->toArray();

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
        sleep(1);
        $com=new CompanyController();        
        $params=$request->all();         
        if(empty($params['servicepackage'])){
            $servicepeckage=0;
            $fields=DB::table('skp_fields_from')
            ->where('companycode',$com->is_company('CompanyCode',Auth::user()->brcode,$params['CompanyId'])->CompanyCode)
            ->where('flag',1)->where('model','PlanModel')->orderBy('order','ASC')->get(); 
        }else{
            $servicepeckage=$params['servicepackage'];
            $fields=DB::table('skp_fields_from')
            ->where('companycode',$com->is_company('CompanyCode',Auth::user()->brcode,$params['CompanyId'])->CompanyCode)            
            ->where('model','PlanModel')
            ->where('servicetype',$servicepeckage)
            ->orderBy('order','ASC')->get();             
        }            
        
         $validator = Validator::make($request->all(), [
             'PlanName' => 'required|max:100',             
             'PlanDate' => 'required',
         ]);
            
         if ($validator->fails()) {
             return response()->json(['errors' => $validator->errors()], 403);
         } else {
             //get fields    
            $data=[];
            foreach($fields as $field){
                if(empty($params[$field->name])){
                    $da=[
                        "PlanCode"=>$field->fields_code,
                        "FieldType"=>$field->type,
                        'PlanTitle'=>$field->name,
                        'Value' => 0
                    ];
                    $data[]=$da;
                }else{
                    $da=[
                        "PlanCode"=>$field->fields_code,
                        "FieldType"=>$field->type,
                        'PlanTitle'=>$field->name,
                        'Value' => $params[$field->name]
                    ];
                    $data[]=$da;
                }
                
            };
            
               //get  data
            foreach($data as $ro){
            
                $plan=Plan::create(
                [
                    "PlanName"=>$params['PlanName'],
                    "PlanDate"=>date('Y-m-d',strtotime($params['PlanDate'])),
                    "PlanCode"=>$ro['PlanCode'],
                    "PlanTitle"=>$ro['PlanTitle'],
                    "FieldType"=>$ro['FieldType'],
                    "PlanMode"=>$params['PlanMode'],
                    "servicepackage"=>$servicepeckage,
                    "created_by"=>Auth::user()->name,
                    "Values"=>$ro['Value'],
                    "ccy"=>$com->is_company('default_ccy',Auth::user()->brcode,$params['CompanyId'])->default_ccy,
                    "CompanyName"=>$com->is_company('company_name_en',Auth::user()->brcode,$params['CompanyId'])->company_name_en,
                    "CompanyId" =>$com->is_company('Company_id',Auth::user()->brcode,$params['CompanyId'])->Company_id,
                    "BrCode"=>Auth::user()->brcode,
                    "BrName"=>Auth::user()->brname
                ]);
            }
            return new  PlanResource($plan);
         }

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Plan $plan)
    {
        
       return new PlanResource($plan);
    }
    public function view_planlist($PCompanyId){
       // echo "hi";
      $planlist = DB::select("CALL `get_planlist`('".$PCompanyId."')"); 
       $data=[];
        foreach($planlist as $row){
            $da=
            [
                "PlanName"=>$row->PlanName ,
                "PlanDate"=>$row->PlanDate,
                "value"=>$row->value,
            ];
            $data[]=$da;
        }
        return collect(["data"=>$data])->toArray();
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
    public function update(Request $request, $id)
    {
        
    }

    // Update plan Funcation
    public function save_update( Request $request){

        $com=new CompanyController();        
        $params=$request->all();    
        $fields=DB::table('skp_fields_from')->where('companycode',$params['CompanyCode'])->where('flag',1)->where('model','PlanModel')->orderBy('order','ASC')->get(); 
      
         $validator = Validator::make($request->all(), [
             'PlanName' => 'required|max:100',             
             'PlanDate' => 'required',
         ]);
 
         if ($validator->fails()) {
             return response()->json(['errors' => $validator->errors()], 403);
         } else {

             //get fields    
             $data=[];
             foreach($fields as $field){
                 $da=[
                     "PlanCode"=>$field->fields_code,
                     "FieldType"=>$field->type,
                     'PlanTitle'=>$field->name,
                     'Value' => $params[$field->name]
                 ];
                 $data[]=$da;
             };
             
             $update =
             [
                "PlanName"=>$request->PlanName,
                "PlanDate"=>$request->PlanDate,
                "PlanCode"=>$ro['PlanCode'],
                "PlanTitle"=>$ro['PlanTitle'],
                "FieldType"=>$ro['FieldType'],
                "created_by"=>Auth::user()->name,
                "Values"=>$ro['Value'],
                "ccy"=>$com->is_company('default_ccy',Auth::user()->brcode,$params['CompanyCode'])->default_ccy,
                "CompanyName"=>$com->is_company('company_name_en',Auth::user()->brcode,$params['CompanyCode'])->company_name_en,
                "CompanyId" =>$com->is_company('Company_id',Auth::user()->brcode,$params['CompanyCode'])->Company_id,
                "BrCode"=>Auth::user()->brcode,
                "BrName"=>Auth::user()->brname
             ];

         }

    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request)
    {
        dd($request->all());
        

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
            $plan=Plan::where('CompanyId',$request->companyid)->first();
                if ($plan->flag==1){
                    Plan::where('CompanyId',$request->companyid)->where('PlanDate',$request->PlanDate)
                    ->update([                           
                                'authorized_by'=>$user->name,
                                'authorized_date'=>Carbon::now(),
                                'status'=>0
                            ]);
                }
                $plan->save();
                return response()->json(new JsonResponse([], 'login Success'), Response::HTTP_OK);

        }else{
             return response()->json(new JsonResponse([], 'login_error'), Response::HTTP_UNAUTHORIZED);
        }

    }
    public function delete_plan(Request $request){
        $plan=Plan::where('CompanyId',$request->companyid)                                       
                    ->first();
       
        if ($plan->flag==1){
            Plan::where('CompanyId',$request->companyid)->where('PlanDate',$request->PlanDate)->update(['flag'=>0]);
        }else{
            //update plan flag to activate
            Plan::where('CompanyId',$request->companyid)->where('PlanDate',$request->PlanDate)->update(['flag'=>1]);
        }
        $plan->save();
    }
}
