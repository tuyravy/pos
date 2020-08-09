<?php

namespace App\Http\Controllers;

use App\Http\Resources\ProductResource;
use Illuminate\Http\Request;
use App\stsk\Models\Product;
use Illuminate\Http\Resources\Json\ResourceCollection;
use Illuminate\Support\Arr;
use App\stsk\JsonResponse;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rule;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;
use DB;
class ProductController extends Controller
{
    const ITEM_PER_PAGE = 15;
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $searchParams = $request->all();  
        //defuail value
        $company=new CompanyController();
        $field="company_name_en,Company_id";
        $com=$company->is_company($field,Auth::user()->brcode,0);
        $companyid=$com->Company_id;
        $page=$request->page-1;
        $limt=$request->limit;
        //Value asign by method
        $ProductQuery = DB::table('product')
            ->Join('branch','branch.brCode','=','product.brcode')
            ->where('product.brCode',Auth::user()->brcode)
            ->where('product.flag',1)->where('Company_id',$companyid)->offset($page * $limt)->limit($limt)->get();   

        $Total= DB::table('product')->where('product.brCode',Auth::user()->brcode)->where('flag',1)->where('Company_id',$companyid)->get();
        //checking companycode
        if (!empty($request->CompanyId)) {
            $ProductQuery = DB::table('product')
            ->Join('branch','branch.brCode','=','product.brcode')
            ->where('product.flag',1)->where('Company_id',$request->CompanyId)->offset($page * $limt)->limit($limt)->get();
        }
        $data=[];
        foreach($ProductQuery as $row){
            $data[]=$row;
        }
        return collect(["data"=>$data,
                        "links"=>
                                ["first"=>'http://127.0.0.1:8000/api/warehouse?page=0',
                                 "last"=>'http://127.0.0.1:8000/api/warehouse?page=0',
                                "prev"=>'null',
                                "next"=>'null'
                                ],
                        "meta"=>[
                             "current_page"=>1,
                             "from"=>1,
                             "last_page"=>1,
                             "path"=>"http://127.0.0.1:8000/api/warehouse",
                             "per_page"=>15,
                             "to"=>3,
                             "total"=>count($Total)
                        ],
                        ])->toArray();
       //return ProductResource::collection($ProductQuery);
    }
    public static function is_product($string,$prcode,$companyid){
        $selectRaw=$string;
        $WhereRaw="prcode=".$prcode." and Company_id=".$companyid."";
        $result=DB::table("sys_product")->selectRaw($selectRaw)->whereRaw($WhereRaw)->get();
        foreach($result as $row){
            return $row;
        }
    }
    /**
     * Find Product ID by Company
     */
    public function FindProductByComId($CompanyId){
     
        
        $ProductQuery = DB::table('sys_product')->where('flag',1)->where('Company_id',$CompanyId)->get();
        $data=[];
        foreach($ProductQuery as $row){
            $da=[
                'prcode' => $row->prcode,
                'PrType' => $row->PrType,
                'FullDesc'=> $row->FullDesc,
                'Company_id'=>$row->Company_id,
                ];
            $data[]=$da;
        }
        return collect(["data"=>$data])->toArray();
    }

    public function AddProduct(Request $request){
        $Product = new Product();
        $company=new CompanyController();
        $com=$company->is_company('Company_id',Auth::user()->brcode,Auth::user()->CompanyCode);

        $company_id = $com->Company_id;
        $brcode = $request->BrCode;
        $created_by = Auth::user()->name;
        $created_date = Date('Y-m-d');

        $Product->AddProduct($request->subcategory_id,$request->product_code,$request->product_name_eng,$request->product_name_kh,$request->product_details,$request->warehouse_id,$company_id,$brcode,$created_by,$created_date);
    }
    protected static function existadditem($productcode)
    {
        $userkey=Auth::user()->UserKey;
        $item=DB::table('rsk_stock_product_hist')
                  ->where('product_code',$productcode)                
                  ->where('flag',1)
                  ->get();
        
        if(count($item)>0){
            return true;
        }else{
            return false;
        }
        
    }
    public function AddStockToList(Request $request){
        $company=new CompanyController();
        $field="company_name_en,Company_id";
        $com=$company->is_company($field,Auth::user()->brcode,0);
        $companyid=$com->Company_id;
        $exist=ProductController::existadditem($request->product_code);
        if($exist==true){
            return response()->json(new JsonResponse([], 'Already add list'), Response::HTTP_UNAUTHORIZED);
        }else{
            $GetProduct=Product::query()->where('product_code',$request->product_code)->where("flag",1)->get();
            foreach($GetProduct as $row){
                $data=[
                        "subcategory_id"=>$row->subcategory_id,
                        "product_code"=>$row->product_code,
                        "product_name_eng"=>$row->product_name_eng,
                        "product_name_kh"=>$row->product_name_kh,
                        "cost"=>0,
                        "defult_price"=>0,
                        "retail_price"=>0,
                        "wholesale_price"=>0,
                        "user_define_price_1"=>0,
                        "user_define_price_2"=>0,                      
                        "company_id"=> $companyid,
                        "brcode"=>Auth::user()->brcode,
                        "created_by"=>Auth::user()->name,
                        "created_date"=>$row->created_date
                        
                      
                    ];
                DB::table('rsk_stock_product_hist')->insert($data);
            }
        }
    }
    public function StockTempList(){
       
        $company=new CompanyController();
        $field="company_name_en,Company_id";
        $com=$company->is_company($field,Auth::user()->brcode,0);
        $companyid=$com->Company_id;
        //Value asign by method
        $rsk_stock_product_hist = DB::table('rsk_stock_product_hist')->where('flag',1)->where('Company_id',$companyid)->get();  
        
        //checking companycode        
        return collect(["data"=>["items"=>$rsk_stock_product_hist]])->toArray();
    }
    /**
     * Scan Product
     */
    public function ScanProduct(Request $request)
    {
        $searchParams = $request->all();  
        //defuail value
        $company=new CompanyController();
        $field="company_name_en,Company_id";
        $com=$company->is_company($field,Auth::user()->brcode,0);
        $companyid=$com->Company_id;

        //Value asign by method
        $Product = DB::table('product')->where('flag',1)->where('Company_id',$companyid)->get();       
        //checking companycode
        if (!empty($request->CompanyId)) {
            $ProductQuery = DB::table('product')->where('flag',1)->where('Company_id',$request->CompanyId)->get();
        }        
        $data=[];
        foreach($Product as $row){
            $da=[
                'value' => $row->product_code,                
                'link'=>$row->product_name_kh,
                ];
            $data[]=$da;
        }
        return collect(["data"=>$data])->toArray();
    }

    /**Find SubCategory */
    
    public function ScanCategory(Request $request){

        $searchParams = $request->all();  
        //defuail value
        $company=new CompanyController();
        $field="company_name_en,Company_id";
        $com=$company->is_company($field,Auth::user()->brcode,0);
        $companyid=$com->Company_id;

        //Value asign by method
        $sys_subcategory = DB::table('sys_subcategory')->where('Active',1)->where('Company_id',$companyid)->get();       
        //checking companycode
        if (!empty($request->CompanyId)) {
            $sys_subcategoryQuery = DB::table('sys_subcategory')->where('Active',1)->where('Company_id',$request->CompanyId)->get();
        }      
        return collect(["data"=>$sys_subcategory])->toArray();
    }
    public function SubCategoryToProduct(Request $request){
       
        $searchParams = $request->all();  
        //defuail value
        $company=new CompanyController();
        $field="company_name_en,Company_id";
        $com=$company->is_company($field,Auth::user()->brcode,0);
        $companyid=$com->Company_id;

        //Value asign by method
        $product = DB::table('product')
                ->where('flag',1)
                ->where('subcategory_id',$request->CategoryId)                
                ->get();       
        //checking companycode
        if (!empty($request->CompanyId)) {
            $product = DB::table('product')
                ->where('flag',1)
                ->where('subcategory_id',$request->CategoryId)                
                ->get();
        }      
        return collect(["data"=>$product])->toArray();
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
