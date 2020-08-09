<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Response;
use Illuminate\Support\Arr;
use Carbon\Carbon;
use App\stsk\Models\Project;
use Illuminate\Support\Facades\Hash;
use App\stsk\JsonResponse;
use App\Http\Resources\ProjectResources;
use App\stsk\Models\Customer as CustomerModel;
use DB;
class ProjectController extends Controller
{
    //
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
        $Project = Project::getProjectList();       
        return collect(["data"=>$Project])->toArray();

    }
    /**
     * Get project name by cutomer id
     */
    public function getProjectName($CusId){
        $project=Project::query()->where('cus_id',$CusId)->get();
        return collect(["data"=>$project])->toArray();
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
        $field="company_name_en,Company_id";
        $com=$company->is_company($field,Auth::user()->brcode,$CompanyCode);
        $Project=Project::create(
            [
                'cus_id'        =>$request->customer, 
                'project_name_eng'=>$request->projectnameen,
                'project_name_kh'=> $request->projectnamekh,
                'project_address'=>$request->projectaddress,
                'gis_code'=>$request->gisCode,
                'project_start_date'=>date('Y-m-d',strtotime($request->datestartproject)),
                'project_exp_date'=>date('Y-m-d',strtotime($request->dateendproject)),
                'project_note'=>$request->projectnoted,                
                'company_name'=>$com->company_name_en,                
                'created_by'=>Auth::user()->name,               
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
    public function show($project_id)
    {
        $project=Project::query()->where('project_id',$project_id)->first();
        return new ProjectResources($project);
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
         //
         
        
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request,Project $project_id)
    {
        //
        $CompanyCode = Auth::user()->CompanyCode;
        $branch_code = Auth::user()->brcode;
        $last_id = CustomerModel::count();
        $company=new CompanyController();
        $field="company_name_en,Company_id";
        $com=$company->is_company($field,Auth::user()->brcode,$CompanyCode);
        $Project=
            [
                'cus_id'        =>$request->cus_id, 
                'project_name_eng'=>$request->project_name_eng,
                'project_name_kh'=> $request->project_name_kh,
                'project_address'=>$request->project_address,
                'gis_code'=>$request->gis_code,
                'project_start_date'=>date('Y-m-d',strtotime($request->project_start_date)),
                'project_exp_date'=>date('Y-m-d',strtotime($request->project_exp_date)),
                'project_note'=>$request->project_note,                
                'company_name'=>$com->company_name_en,                
                'updated_by'=>Auth::user()->name,  
                'updated_at'=>Carbon::now(),             
                'company_id'=>$com->Company_id,
                'brcode'=>$branch_code
            ];
        DB::table("rsk_customer_project")->where('project_id',$request->project_id)->update($Project);
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
        $sale=Project::where('project_id',$id)->first();

        if ($sale->flag==1){
            Project::where('project_id',$id)->update(['flag'=>0]);
        }else{
            //update user status to activate
            Project::where('project_id',$id)->update(['flag'=>1]);
        }
        $sale->save();
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
                $Project=Project::query()->where('project_id',$request->project_id)->first();                          
                if ($Project->flag==1){
                    if($user->email<>Auth::user()->email){
                        Project::query()->where('project_id',$request->project_id)
                        ->update([                           
                                    'authorized_by'=>$user->name,
                                    'authorized_date'=>Carbon::now(),
                                    'status'=>0
    
                                ]);
                        $Project->save();
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
