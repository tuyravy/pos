<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\stsk\Models\Warehouse;
use Auth;
use App\Http\Resources\WarehouseResource;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Hash;
use App\stsk\JsonResponse;
use Illuminate\Http\Response;
use Carbon\Carbon;
use DB;
class WarehouseController extends Controller
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
         $Warehouse = Warehouse::query()->where('flag',1);          
        return WarehouseResource::collection($Warehouse->paginate($limit));
 
    }
    public function getwarehouse(){

        $CompanyCode = Auth::user()->CompanyCode;
        $branch_code = Auth::user()->brcode;
        $Warehouse=Warehouse::query()->where('flag',1)->where('brcode',$branch_code);
        return WarehouseResource::collection($Warehouse->get()); 

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
        $CompanyCode = Auth::user()->CompanyCode;
        $branch_code = Auth::user()->brcode;
        $last_id = Warehouse::count();
        $company=new CompanyController();
        $field="company_name_en,Company_id";
        $com=$company->is_company($field,Auth::user()->brcode,$CompanyCode);
        $Warehouse=Warehouse::create(
            [
                'warehouse_code'=>($com->Company_id.$branch_code.($last_id+1)), 
                'warehouse_name'=>$request->warehouse_name,
                'warehouse_note'=> $request->warehouse_note,
                'company_name'=>$com->company_name_en,           
                'created_by'=>Auth::user()->name,               
                'company_id'=>$com->Company_id,
                'brcode'=>$request->ShortCode
            ]
        );
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($warehouse_id)
    {
        //
        $warehouse=Warehouse::query()->where('warehouse_id',$warehouse_id)->first();
        return new WarehouseResource($warehouse);
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
    public function update(Request $request,Warehouse $warehouse_id)
    {
        //
       //dd($request->all());
        $CompanyCode = Auth::user()->CompanyCode;
        $branch_code = Auth::user()->brcode;
        $last_id = Warehouse::count();
        $company=new CompanyController();
        $field="company_name_en,Company_id";
        $com=$company->is_company($field,Auth::user()->brcode,$CompanyCode);
        $Warehouse=
            [
                
                'warehouse_name'=>$request->warehouse_name,
                'warehouse_note'=> $request->warehouse_note,
                'company_name'=>$com->company_name_en,           
                'updated_by'=>Auth::user()->name,            
                'company_id'=>$com->Company_id,
                'brcode'=>$request->ShortCode
            ];
        
        DB::table('warehouse')->where('warehouse_id',$request->warehouse_id)->update($Warehouse);

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
        //
        $Warehouse=Warehouse::where('warehouse_id',$id)->first();

        if ($Warehouse->flag==1){
            Warehouse::where('warehouse_id',$id)->update(['flag'=>0]);
        }else{
            //update user status to activate
            Warehouse::where('warehouse_id',$id)->update(['flag'=>1]);
        }
        $Warehouse->save();
        
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
                $warehouse=Warehouse::query()->where('warehouse_id',$request->warehouse_id)->first();                          
                if ($warehouse->flag==1){
                    if($user->email<>Auth::user()->email){
                        Warehouse::query()->where('warehouse_id',$request->warehouse_id)
                        ->update([                           
                                    'authorized_by'=>$user->name,
                                    'authorized_date'=>Carbon::now(),
                                    'status'=>0
    
                                ]);
                        $warehouse->save();
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
