<?php

namespace App\Http\Controllers;
use App\stsk\JsonResponse;
use App\Http\Resources\ModeResource;
use Illuminate\Http\Request;
use App\stsk\Models\Mode;
use Illuminate\Http\Resources\Json\ResourceCollection;
use Illuminate\Support\Arr;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\CompanyController;
use App\stsk\Models\Category;
use DB;
class ModeController extends Controller
{
    const ITEM_PER_PAGE = 15;
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {

        $ModeQuery = Mode::all()->where('look_code',$request->TrnModeType)->where('company_id',$request->CompanyId)->where('flag',1);        
        return ModeResource::collection($ModeQuery);
    }
    public static function PaymentTerm($look_id){
        $PaymentStatus = Mode::where('look_code','repayment_status')->where('flag',1)->where('look_id',$look_id)->get()->last()->full_name_en;
        return $PaymentStatus;
    }
    /**
     * Display a listing of TrnMode by Company
     */
    public function findModesByComId($CompanyId){
        $ModeQuery = Mode::all()->where('look_code','TrnMode')->where('company_id',$CompanyId)->where('flag',1);        
        return ModeResource::collection($ModeQuery);
    }
    /**
     * Display Deliver by
     * It join with table user for emp_code with Lookup table
     */
    public function getDeliveryBy(){
        $company=new CompanyController();
        $com=$company->is_company('Company_id',Auth::user()->brcode,Auth::user()->CompanyCode);
        $Delivery=DB::table("sys_lookup_code")
                        ->Join("users","users.emp_code","=","sys_lookup_code.look_id")
                        ->where('sys_lookup_code.company_id',$com->Company_id)
                        ->where('users.flag',1)->get();
        $data=[];
        foreach($Delivery as $row){
            $data[]=$row;
        }
        return collect(["data"=>$data])->toArray();
        
    }
    /**
     * Display Category 
     */
    public function getCategory(){
        $company=new CompanyController();
        $com=$company->is_company('Company_id',Auth::user()->brcode,Auth::user()->CompanyCode);
        $Category=DB::table("sys_category")
                        ->where('Company_id',$com->Company_id)
                        ->where('Active',1)->get();
        $data=[];
        foreach($Category as $row){
            $data[]=$row;
        }
        return collect(["data"=>$data])->toArray();
    }

    public function GetSubCategory(){
        $company=new CompanyController();
        $com=$company->is_company('Company_id',Auth::user()->brcode,Auth::user()->CompanyCode);
        $Category=DB::table("sys_subcategory")
                        ->where('Company_id',$com->Company_id)
                        ->where('Active',1)->get();
        $data=[];
        foreach($Category as $row){
            $data[]=$row;
        }
        return collect(["data"=>$data])->toArray();
    }

    public function AddSubCategory(Request $request)
    {
        $company=new CompanyController();
        $com=$company->is_company('Company_id',Auth::user()->brcode,Auth::user()->CompanyCode);
        $sys_category = new Category();
        $sys_category->syscategory($request->CategoryId,$request->setSubCategoryName,"បង្កើតឈ្មោះផលិតផលរង",Auth::user()->brcode,$com->Company_id);
       
    }
    /**
     * Display Warehouse name base on branch code
     */
    public function getWarehouse()
    {
        $BrCode=Auth::user()->brcode;
        $warehouse=DB::table('warehouse')
                      ->where('brcode',$BrCode)
                      ->where('flag',1)
                      ->where('status',0)
                      ->get();
        $data=[];
        foreach($warehouse as $row){
            $data[]=$row;
        }   
        return collect(["data"=>$data])->toArray();
    }
    /**
     * Display Full Name for TrnMode
     */
    public static function TrnModeName($look_id){

        $ModeQuery = Mode::all()->where('look_id',$look_id)->where('flag',1);      
        foreach($ModeQuery as $row){           
            return $row;
        }
        return 0;

    }
    public function sys_lookup_Mode($look_code){

        $ModeQuery = Mode::all()->where('look_code',$look_code)->where('flag',1);      
        return ModeResource::collection($ModeQuery);
    }
    public function getProvince(){
        $db=DB::select("select distinct(p_code),p_name_en from location");
        $data=[];
        foreach($db as $row){
            $da=
            [
                "code"=>$row->p_code,
                "name"=>$row->p_name_en
            ];
            $data[]=$da;
        }
       return collect(["data"=>$data])->toArray();
    }
    public function getLocationbyPro($locationcode){
        $data=[];
        switch(strlen($locationcode)){
            case 2:
                $db=DB::select("select distinct(d_code),d_name_en from location where p_code='".$locationcode."'");               
                foreach($db as $row){
                    $da=
                    [
                        "code"=>$row->d_code,
                        "name"=>$row->d_name_en
                    ];
                    $data[]=$da;
                }
            break;
            case 4:
                $db=DB::select("select distinct(c_code),c_name_en from location where d_code='".$locationcode."'");               
                foreach($db as $row){
                    $da=
                    [
                        "code"=>$row->c_code,
                        "name"=>$row->c_name_en
                    ];
                    $data[]=$da;
                }
            break;
            case 6:
                $db=DB::select("select distinct(location_code),v_name_en from location where c_code='".$locationcode."'");               
                foreach($db as $row){
                    $da=
                    [
                        "code"=>$row->location_code,
                        "name"=>$row->v_name_en
                    ];
                    $data[]=$da;
                }
            break;           
        }
        
       return collect(["data"=>$data])->toArray();
    }
    public static function getLocationSingle($locationcode){
        switch(strlen($locationcode)){
            case 2:
            $db=DB::select("select distinct(p_code),p_name_en from location where p_code='".$locationcode."'");               
                foreach($db as $row){
                   return $row->p_name_en;
                }
            break;
            case 4:
                $db=DB::select("select distinct(d_code),d_name_en from location where d_code='".$locationcode."'");               
                foreach($db as $row){
                   return $row->d_name_en;
                }
            break;
            case 6:
               
                $db=DB::select("select distinct(c_code),c_name_en from location where c_code='".$locationcode."'");               
                foreach($db as $row){
                   return $row->c_name_en;
                }
            break;
            case 8:
               
                $db=DB::select("select distinct(location_code),v_name_en from location where location_code='".$locationcode."'");               
                foreach($db as $row){
                   return $row->v_name_en;
                }
            break;
        }
    }
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        
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
