<?php

namespace App\Http\Controllers;

use App\Http\Resources\CompanyResources;
use App\stsk\Acl;
use App\stsk\JsonResponse;
use App\stsk\Models\Permission;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\ResourceCollection;
use Illuminate\Support\Arr;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rule;
use App\stsk\Models\Company;
use Validator;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\CompanyController;
use DB;
class CompanyController extends Controller
{
    
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $companycode=Auth::user()->CompanyCode;
        $whereRaw=('CompanyCode in('.$companycode.')');
        $companyQuery=Company::whereRaw($whereRaw)->get();
        return CompanyResources::collection($companyQuery);
    }

    /**
     * Find company name by Id 
     */
    // public function findcompanyId($CompanyId){

        

    // }


    public function GetBranch(){
        $companycode=Auth::user()->CompanyCode;
        $Branch_list= array();
        $Branch_list = json_decode(Auth::user()->Branch_list);       
        $whereRaw = ('CompanyCode in('.$companycode.')');
       
       
        $companyQuery=DB::table('branch')
            ->whereRaw($whereRaw)
            ->whereIn("BrCode",$Branch_list->BrCode)
            ->where('flag',1)
            ->orderBy('brCode','ASC')
            ->get();
        $data=[];
        foreach($companyQuery as $row){
            $da=[
                    'BrCode'=>$row->BrCode,
                    'BrName'=>$row->brName,
                    'ShortCode' =>$row->shortcode,
                    'BrNamekh'=>$row->brNamekh
                ];
            $data[]=$da;
        }
        return collect(["data"=>$data])->toArray();
    }
    /**
     * Get Company filde by varible
     */
    public function is_company($string,$brcode,$is_companyid){
        $selectRaw=$string;
        if($is_companyid!=""){
            $WhereRaw="Company_id in(".$is_companyid.") or CompanyCode in(".$is_companyid.")";
        }else{
            $WhereRaw="CompanyCode=(SELECT CompanyCode FROM branch WHERE brcode in('".$brcode."'))";
        }        
        $result=DB::table("company")->selectRaw($selectRaw)->whereRaw($WhereRaw)->get();
        foreach($result as $row){
            return $row;
        }
    }
    /**
     * Get Branch Name
     */
    public function is_branch($brcode){
        $brname=DB::table('branch')->where('brCode',$brcode)->get();
        foreach($brname as $row){
            return $row;
        }
    }
    /**
     * display branch code depance on company
     */
    public function CompanyToBranch(Request $request){

        $searchParams = $request->all();
        $companycode=Auth::user()->CompanyCode;
        $whereRaw=('CompanyCode in('.$companycode.')');
        $companyQuery=DB::table('branch')->whereRaw($whereRaw)->where('flag',1)->orderBy('brCode','ASC')->get();

        $companycode=$request->CompanyCode;
        if (!empty($companycode)) {
            $whereRaw=('CompanyCode in('.$companycode.')');
            $companyQuery=DB::table('branch')->whereRaw($whereRaw)->where('flag',1)->orderBy('brCode','ASC')->get();
        }
        $data=[];
        foreach($companyQuery as $row){
            $da=[
                    'BrCode'=>$row->brCode,
                    'BrName'=>$row->brName,
                    'BrNamekh'=>$row->brNamekh
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
