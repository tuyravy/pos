<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Resources\DynamicFormResources;
use App\stsk\Acl;
use App\stsk\JsonResponse;
use App\stsk\Models\Permission;
use Illuminate\Http\Resources\Json\ResourceCollection;
use Illuminate\Support\Arr;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rule;
use App\stsk\Models\DynamicForm;
use Validator;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Resources\Json\JsonResource;
use DB;
class DynamicFormController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $searchParams = $request->all();
        $companycode=explode(",",Auth::user()->CompanyCode);
        $whereRaw=('companycode in('.$companycode[0].')');
        $companyQuery=DB::table('skp_fields_from')->whereRaw($whereRaw)->where('flag',1)->where('model','PlanModel')->orderBy('order','ASC')->get();

        $companycode=$request->CompanyCode;
        if (!empty($companycode)) {
            $whereRaw=('companycode in('.$companycode.')');
            $companyQuery=DB::table('skp_fields_from')->whereRaw($whereRaw)->where('flag',1)->where('model','PlanModel')->orderBy('order','ASC')->get();
        }
        
        return DynamicFormResources::collection($companyQuery);
    }
    /**
     * Get fields from base on 
     */
    public function formbyservicetype(Request $request){
        $searchParams = $request->all();
        $company=new CompanyController();
        $field="CompanyCode";
        $com=$company->is_company($field,Auth::user()->brcode,$request->CompanyId);
        $companycode=$com->CompanyCode;        
        if (!empty($companycode)) {
            $whereRaw=('companycode in('.$companycode.')');
            $companyQuery=DB::table('skp_fields_from')
                ->whereRaw($whereRaw)
                ->where('model','PlanModel')
                ->where('servicetype',$request->servicepackage)
                ->orderBy('order','ASC')
                ->get();
            return DynamicFormResources::collection($companyQuery);
        }
        
        
    }
    /**
     * show the form for role permission
     * @return \\Illuminate\Http\Response
     */
    public function rules(Request $request){
        $searchParams = $request->all();
        $companycode=Auth::user()->CompanyCode;
        $whereRaw=('companycode in('.$companycode.')');
        $companyQuery=DB::table('skp_fields_from')
        ->Join('skp_rules_from','skp_rules_from.fields_code','skp_fields_from.fields_code')
        ->whereRaw($whereRaw)->where('skp_fields_from.flag',1)->where('skp_fields_from.model','PlanModel')->orderBy('skp_fields_from.order','ASC')->get();

        $companycode=$request->CompanyCode;
        if (!empty($companycode)) {
            $whereRaw=('companycode in('.$companycode.')');
            $companyQuery=DB::table('skp_fields_from')
                ->Join('skp_rules_from','skp_rules_from.fields_code=skp_fields_from.fields_code')
                ->whereRaw($whereRaw)->where('skp_fields_from.flag',1)->where('skp_fields_from.model','PlanModel')->orderBy('skp_fields_from.order','ASC')->get();
        }
        

        $data = [];
        foreach($companyQuery as $key=>$row){
                $da=[
                    $row->name=>[
                            "required"=>$row->required,
                            "message"=>$row->message,
                            "trigger"=>$row->trigger
                        ],
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
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
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
        //
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
}