<?php

namespace App\Http\Controllers;
use App\Http\Resources\SaleDailyResource;
use App\Http\Resources\ProductResource;
use App\Http\Resources\ModeResource;
use App\stsk\Acl;
use App\stsk\JsonResponse;
use App\stsk\Models\Permission;
use App\stsk\Models\Sales;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\ResourceCollection;
use Illuminate\Support\Arr;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rule;
use Validator;
use Carbon\Carbon;
use DB;
use App\Http\Controllers\CompanyController;
use App\Http\Controllers\ProductController;
use Illuminate\Http\Response;
use App\Http\Resources\UserResource;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\UnityController;
use App\stsk\Models\Product;
class SaleDailyController extends Controller
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
        
        $company=new CompanyController();
        $com=$company->is_company('Company_id',Auth::user()->brcode,Auth::user()->CompanyCode);
        $CompanyId=$com->Company_id;
        $limit = Arr::get($searchParams, 'limit', static::ITEM_PER_PAGE);
        $page = Arr::get($searchParams, 'page');
        $brcode = Arr::get($searchParams, 'brcode');
        $search = Arr::get($searchParams, 'search');
        $datestart = Arr::get($searchParams, 'datestart');
        $dateend = Arr::get($searchParams, 'dateend');
        
        if($dateend==""){
            $datestart = date('Y-m-01');
            $dateend = date("Y-m-d");
        }
        if($brcode==""){
            $brcode = Auth::user()->brcode;
        }
        if($search!=""){
            $SaleDaily = Sales::SearchSaleList($CompanyId,Auth::user()->UserKey,$page,$limit,$brcode,date('Y-m-d',strtotime($datestart)),date('Y-m-d',strtotime($dateend)),$search);
            $total=Sales::TotalSearch($CompanyId,Auth::user()->UserKey,$page,$limit,$brcode,date('Y-m-d',strtotime($datestart)),date('Y-m-d',strtotime($dateend)),$search);
          
        }else{
            $SaleDaily = Sales::getSalelist($CompanyId,Auth::user()->UserKey,$page,$limit,$brcode,date('Y-m-d',strtotime($datestart)),date('Y-m-d',strtotime($dateend)));
            $total=Sales::TotalSaleList($CompanyId,Auth::user()->UserKey,$page,$limit,$brcode,date('Y-m-d',strtotime($datestart)),date('Y-m-d',strtotime($dateend)));
        }
       
       
        return collect(["data"=>$SaleDaily,"total"=>$total])->toArray();
        //return SaleDailyResource::collection($SaleDaily->paginate($limit));

    }
    public function getDraftSale($invoice_no){
        $sale=DB::select("select 
                                s.sale_date,
                                s.sale_id,
                                c.first_name_eng as firstName,
                                c.family_name_eng as familyName,
                                c.Position,
                                c.phone,
                                c.email,
                                sl.full_name_en as paymentterms,
                                cp.project_name_eng as project_name_eng,                         
                                substr(s.invoice_no,3) as invoice_no,
                                st.StaffNameEng as saleman,
                                s.delivery_cost as delivery_cost,
                                '' as totalpaided,
                                s.total_due_amount as balancedue,
                                s.sale_date as sale_date,
                                c.address_detail as address_detail,
                                '' as Datedue,
                                '' as Ccy,
                                '' as created_by,
                                '' as BranchName,
                                '' as PostedDate,
                                '' as authorized_by ,
                                '' as authorized_date,
                                '' as updated_by,
                                '' as status,
                                s.company_id as CompanyId
                            from rsk_sale s 
                            inner join rsk_customer c on c.cus_id=s.cus_id
                            left join sys_lookup_code sl on sl.look_id = s.payment_terms
                            left join rsk_customer_project cp on cp.project_id = s.project_id
                            left join rsk_staff st on st.System_Id = s.saleman_id
                            where s.invoice_no='".$invoice_no."'");
        foreach($sale as $row){
            $sale_date = date("Y-m-d",strtotime($row->sale_date));
            return collect(["data"=>$row,"sale_date"=>$sale_date])->toArray();
        }
        
    }
    /**Get Sale Men */
    public function GetSaleMan(){
        $sale=DB::table('rsk_staff')->where('emp_type','SEMP002')->get();
        return collect(["data"=>$sale])->toArray();
    }
    /**Get Delivery */
    public function GetDelivery(){
        $sale=DB::table('rsk_staff')->where('emp_type','SEMP001')->get();
        return collect(["data"=>$sale])->toArray();
    }
    /**
     * Get Payment Mothod
     */
    public function GetPaymentMothod()
    {
        $PaymentMonthod = DB::Table('sys_lookup_code')->where('look_code','repayment_status')->where('flag',1)->get();
        return collect(["data" => $PaymentMonthod ])->toArray();

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
     * store in product blog
     * @param $productcode 
     * return true or false when use add duplicate product code on time it exist 
     */
    
    protected static function existadditem($productcode)
    {
        $userkey=Auth::user()->UserKey;
        $item=DB::table('rsk_tranhist')
                  ->where('productcode',$productcode)
                  ->where('userkey',$userkey)
                  ->where('flag',1)
                  ->get();
        
        if(count($item)>0){
            return true;
        }else{
            return false;
        }
        
    }
    //Get Summary Payment
    public function GetSummaryPayment($id){
            $TempTable=DB::select("select *,case 
                    when saletype=1 then defult_price
                    when saletype=2 then retail_price
                    when saletype=3 then wholesale_price
                    when saletype=4 then defult_price
                    end as displayprice,
                    (select delivery_cost from rsk_sale where sale_id =rt.sale_id order by sale_id ASC) as DeliveryCost
                    from rsk_tranhist rt
                    where userkey='".Auth::user()->UserKey."'
                    and flag=2 and sale_id='".$id."'");
            $data=[];
            $sale_id = "";
            $SubTotal= 0 ;
            $TotalDiscount = 0;
            $TaxAmount = 0;
            $GRANDTOTAL =0;
            $discount_percentage =0;
            $DeliveryCost = 0;
            $Sale_id =0;
            foreach($TempTable as $row){
            $da=[
                "id"=>$row->id,
                "sale_id"=>$row->sale_id,
                "productcode"=>$row->productcode,
                "productname"=>$row->productname,                
                "displayprice"=>$row->displayprice,             
                "qty"=>$row->qty,
                "discount_percentage"=>$row->discount_percentage,
                "product_Tax"=>$row->product_Tax,
                "TaxAmount"=>$row->displayprice*$row->qty*$row->product_Tax/100,
                "DiscountAmount"=>$row->displayprice*$row->qty*$row->discount_percentage/100,
                "total"=>($row->total + $row->product_Tax)*(100/100-$row->discount_percentage/100)               
                ];
            $data[]=$da;         
                
                $TotalDiscount +=$row->displayprice*$row->qty*$row->discount_percentage/100;
                $TaxAmount +=$row->displayprice*$row->qty*$row->product_Tax/100;
                $SubTotal +=($row->displayprice*$row->qty)-($row->displayprice*$row->qty*$row->product_Tax/100);
                $DeliveryCost = $row->DeliveryCost;
                $Sale_id = $row->sale_id;
            }
                
            $GRANDTOTAL = $SubTotal + $DeliveryCost + $TaxAmount;

            return collect(["data"=>["SubTotal"=>$SubTotal,'TotalDiscount'=>$TotalDiscount,'TaxAmount'=>$TaxAmount,                
                'DeliveryCost'=>$DeliveryCost,
                'GRANDTOTAL' =>$GRANDTOTAL,
                'sale_id' =>$Sale_id
            ]])->toArray();
    }
    //Add Product to temp list
    public function AddToList(Request $request){
        
        $exist=SaleDailyController::existadditem($request->product_code);
        if($exist==true){
            return response()->json(new JsonResponse([], 'Already add list'), Response::HTTP_UNAUTHORIZED);
        }else{
            $GetProduct=Product::query()->where('product_code',$request->product_code)->where("flag",1)->get();
            foreach($GetProduct as $row){
                $data=[
                        "productcode"=>$row->product_code,
                        "productname"=>$row->product_name_kh,
                        "unit_price"=>$row->cost,
                        "defult_price"=>$row->defult_price,
                        "retail_price"=>$row->retail_price,
                        "wholesale_price"=>$row->wholesale_price,
                        "before_price"=>$row->defult_price,
                        "qty"=>$row->qty,
                        "discount_percentage"=>0,
                        "product_Tax"=>$row->Product_Tax,
                        "total"=>0,
                        "userkey"=>Auth::user()->UserKey,
                        "brcode"=>Auth::user()->brcode,                        
                        "saletype"=>$request->chooseoption
                    ];
                DB::table('rsk_tranhist')->insert($data);
            }
        }
    }
    //Get temp Product list 
    public function GetProList(){
        $TempTable=DB::select("select *,case 
                            when saletype=1 then defult_price
                            when saletype=2 then retail_price
                            when saletype=3 then wholesale_price
                            when saletype=4 then defult_price
                            end as displayprice
                            from rsk_tranhist
                            where userkey='".Auth::user()->UserKey."'
                            and flag=1");
        $data=[];
        foreach($TempTable as $row){
            $da=[
                "id"=>$row->id,
                "productcode"=>$row->productcode,
                "productname"=>$row->productname,                
                "displayprice"=>$row->displayprice,             
                "qty"=>$row->qty,
                "discount_percentage"=>$row->discount_percentage,
                "TaxAmount"=>$row->displayprice*$row->qty*$row->product_Tax/100,
                "DiscountAmount"=>$row->displayprice*$row->qty*$row->discount_percentage/100,
                "product_Tax"=>$row->product_Tax,
                "total"=>($row->displayprice*$row->qty-($row->displayprice*$row->qty*$row->product_Tax/100))*(100/100-$row->discount_percentage/100)             
            ];
            $data[]=$da;
        }
        return collect(["data"=>["items"=>$data]])->toArray();
    }
    public function ViewDetailItem($sale_id){
        $TempTable=DB::select("select *,case 
                when saletype=1 then defult_price
                when saletype=2 then retail_price
                when saletype=3 then wholesale_price
                when saletype=4 then defult_price
                end as displayprice
                from rsk_tranhist
                where userkey='".Auth::user()->UserKey."'
                and sale_id='".$sale_id."'
                ");
                $data=[];
                foreach($TempTable as $row){
                $da=[
                "id"=>$row->id,
                "productcode"=>$row->productcode,
                "productname"=>$row->productname,                
                "displayprice"=>$row->displayprice,             
                "qty"=>$row->qty,
                "discount_percentage"=>$row->discount_percentage,
                "TaxAmount"=>$row->displayprice*$row->qty*$row->product_Tax/100,
                "DiscountAmount"=>$row->displayprice*$row->qty*$row->discount_percentage/100,
                "product_Tax"=>$row->product_Tax,
                "total"=>($row->displayprice*$row->qty-($row->displayprice*$row->qty*$row->product_Tax/100))*(100/100-$row->discount_percentage/100)             
                ];
                $data[]=$da;
                }
        return collect(["data"=>["items"=>$data]])->toArray();
        
    }
    //Get temp Product list 
    public function GetProListDraft($saleAutoID){
        
        $TempTable=DB::select("select *,case 
                            when saletype=1 then defult_price
                            when saletype=2 then retail_price
                            when saletype=3 then wholesale_price
                            when saletype=4 then defult_price
                            end as displayprice
                            from rsk_tranhist
                            where userkey='".Auth::user()->UserKey."'
                            and flag=2
                            and sale_id='".$saleAutoID."'");
        $data=[];
        $sale_id = "";
        $invoice_no=0;
        $SubTotal=0;
        $TotalDiscount=0;
        $TaxAmount=0;
        $GRANDTOTAL=0;
      
        foreach($TempTable as $row){
            $da=[
                "id"=>$row->id,
                "sale_id"=>$row->sale_id,
                "productcode"=>$row->productcode,
                "productname"=>$row->productname,                
                "displayprice"=>$row->displayprice,             
                "qty"=>$row->qty,
                "discount_percentage"=>$row->discount_percentage,
                "product_Tax"=>$row->product_Tax,
                "TaxAmount"=>$row->displayprice*$row->qty*$row->product_Tax/100,
                "DiscountAmount"=>$row->displayprice*$row->qty*$row->discount_percentage/100,
                "total"=>($row->displayprice*$row->qty-($row->displayprice*$row->qty*$row->product_Tax/100))*(100/100-$row->discount_percentage/100)              
            ];
            $data[]=$da;
            $sale_id = $row->sale_id;
            $invoice_no = $row->invoice_no;
            
            $TotalDiscount +=$row->displayprice*$row->qty*$row->discount_percentage/100;
            $TaxAmount +=$row->displayprice*$row->qty*$row->product_Tax/100;
            $SubTotal +=$row->displayprice*$row->qty-$row->displayprice*$row->qty*$row->product_Tax/100;
        }
     
        $GRANDTOTAL=$SubTotal + $TaxAmount + $TotalDiscount;
        return collect(["data"=>["items"=>$data,'sale_id'=>$sale_id,'invoice_no'=>$invoice_no,'SubTotal'=>$SubTotal,'TotalDiscount'=>$TotalDiscount,'TaxAmount'=>$TaxAmount,'GRANDTOTAL'=>$GRANDTOTAL]])->toArray();
    }
    /**
     * Get Product list by Option
     */
    public function GetProductListbyOption($option)
    {
         $temp=DB::table('rsk_tranhist')
         ->where('userkey',Auth::user()->UserKey)
         ->where('flag',1)
         ->update(['saletype'=>$option]);
        
    }
    /**
     * Edit Price before sale
     */
    public function UpdatePricebyOption(Request $request){
       
        switch($request->chooseoption){
            case 1:
                $temp=DB::table('rsk_tranhist')
                ->where('userkey',Auth::user()->UserKey)
                ->where('productcode',$request->productcode)
                ->where('flag',1)
                ->update(['defult_price'=>$request->displayprice,'qty'=>$request->qty,'total'=>$request->displayprice*$request->qty]);
            break;
            case 2:
                $temp=DB::table('rsk_tranhist')
                ->where('userkey',Auth::user()->UserKey)
                ->where('productcode',$request->productcode)
                ->where('flag',1)
                ->update(['retail_price'=>$request->displayprice,'qty'=>$request->qty,'total'=>$request->displayprice*$request->qty]);
            break;
            case 3:
                $temp=DB::table('rsk_tranhist')
                ->where('userkey',Auth::user()->UserKey)
                ->where('productcode',$request->productcode)
                ->where('flag',1)
                ->update(['wholesale_price'=>$request->displayprice,'qty'=>$request->qty,'total'=>$request->displayprice*$request->qty]);
            break;
            case 4:
                $temp=DB::table('rsk_tranhist')
                ->where('userkey',Auth::user()->UserKey)
                ->where('productcode',$request->productcode)
                ->where('flag',1)
                ->update(['defult_price'=>$request->displayprice,'qty'=>$request->qty,'total'=>$request->displayprice*$request->qty]);
            break;
        }
        
    }
    //remove temp product list in table temp
    public function RemoveTemProduct($id){

        DB::table('rsk_tranhist')->where('id',$id)->where('userkey',Auth::user()->UserKey)->where('flag',1)->delete();
    }

    /**
     * paided resource in storage.
     */
    public function Paided(Request $request){
        $company=new CompanyController();
        $com=$company->is_company('Company_id',Auth::user()->brcode,Auth::user()->CompanyCode);
        $CompanyId=$com->Company_id;
        DB::beginTransaction();
        try{
            $Data=[

                "total_amount" =>$request->GRANDTOTAL,
                "total_discount" =>$request->TotalDiscount,
                "total_paid_amount" =>str_replace(",","",$request->TotalPaided),
                "total_due_amount" =>$request->GRANDTOTAL - str_replace(",","",$request->TotalPaided),
                "discount_rate" =>0,
                "flag"=>1,
                "paided_date" =>Carbon::now()
            ];
            $payment=[
                "sale_id"=>$request->sale_id,
                "paid_amount"=>str_replace(",","",$request->TotalPaided),
                "balance_amount"=>$request->GRANDTOTAL-str_replace(",","",$request->TotalPaided),
                "company_id"=> $CompanyId,
                "brcode"=>Auth::user()->brcode,
                "created_by"=>Auth::user()->name,
                "flag"=>1,
                "created_date"=>Carbon::now()
            ];
            DB::table('rsk_repayment')->insert($payment);
           
            $payment_detail=[
                "repayment_id"=>UnityController::is_paymentId($request->sale_id,Auth::user()->brcode,$com->Company_id),
                "repayment_date"=>Carbon::now(),
                "repayment_amt"=>str_replace(",","",$request->TotalPaided),
                "Invoce_due_amount"=>0,
                "ccy"=>0,
                "cus_id"=>UnityController::getCustomerId($request->sale_id,Auth::user()->brcode,$com->Company_id),
                "or_reff"=>UnityController::getor_reffNo($request->sale_id,Auth::user()->brcode,$com->Company_id),
                "invoice_no"=>UnityController::is_invoice_no($request->sale_id,Auth::user()->brcode,$com->Company_id),
                "repayment_note"=>"",
                "company_id"=>$CompanyId,
                "brcode"=>Auth::user()->brcode,
                "created_by"=>Auth::user()->name,
                "created_date"=>Carbon::now()
            ];
            DB::table('rsk_repayment_detail')->insert($payment_detail);
            // $TempSale =DB::table('rsk_tranhist')
            //            ->where('sale_id',$request->sale_id)
            //            ->where('userkey',Auth::user()->UserKey)
            //            ->get();
            // foreach($TempSale as $row){

            //     $SaleDetail =[
            //             "sale_id" =>$row->sale_id,
            //             "product_id"=>UnityController::getproductid($row->productcode,Auth::user()->warehouse_id,$com->Company_id),
            //             "prodcut_code"=>$row->productcode,
            //             "qty"=>$row->qty,
            //             "unit_id"=>1,
            //             "unit_cost"=>1,
            //             "unit_price"=>$row->unit_price,
            //             "Pro_loss_unit_price"=>0,
            //             "discount_percentage"=>$row->discount_percentage,
            //             "discount_amt"=>0,
            //             "paid_amount"=>0,
            //             "sale_date"=>Carbon::now(),
            //             "sale_due_date"=>Carbon::now(),
            //             "cus_id"=>UnityController::getCustomerId($row->sale_id,Auth::user()->brcode,$com->Company_id),
            //             "project_id"=>$request->ProjectId,
            //             "saleman_id"=>$request->SystemId,
            //             "ccy"=>'USD',
            //             "promotion_id"=>UnityController::is_promotionId($row->productcode,Auth::user()->brcode,$com->Company_id),
            //             "product_expire_date"=>Carbon::now(),
            //             "withholding_tax_on_non_resident"=>0,
            //             "withholding_tax_on_resident"=>0,
            //             "created_by"=>Auth::user()->name,
            //             "created_date"=>Carbon::now(),
            //         ];
            //         DB::table('rsk_sale_detail')->insert($SaleDetail);

            // }

               
            DB::table('rsk_sale')->where('sale_id',$request->sale_id)->update($Data);
            DB::commit();       
        }catch(\Exception $e){  
            dd($e);         
            DB::rollback();
            return response()->json(new JsonResponse([], 'Transaction error'), Response::HTTP_UNAUTHORIZED);
        }
    }
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $company=new CompanyController();
        $field="company_name_en,Company_id";
        $com=$company->is_company($field,Auth::user()->brcode,$request->CompanyId);
        DB::table('rsk_tranhist')
        ->where('userkey',Auth::user()->UserKey)
        ->where('flag',1)
        ->update(['brcode'=>Auth::user()->brcode,               
        'transaction_no'=>UnityController::transaction_no(Auth::user()->brcode,Auth::user()->UserKey)]);

        $sale_id=0;
        $invoice=0;
        $transaction_no = UnityController::transaction_no(Auth::user()->brcode,Auth::user()->UserKey);
        DB::beginTransaction();
        try{
        
        $invoice=UnityController::get_invoice();
        //Save to rks_temp_sale
        $params = $request->all();           
        $SaleDate=date('Y-m-d',strtotime($request->SaleDate));
        $DeliveryDate=date('Y-m-d',strtotime($request->DeliveryDate));
        
        $Sale=[
                "sale_id"=>UnityController::sale_autoId(Auth::user()->brcode,$com->Company_id),
                "invoice_no"=>$invoice,
                "sale_date"=>$SaleDate,
                "cus_id"=>$request->CusId,
                "project_id"=>$request->ProjectId,
                "saleman_id"=>$request->SystemId,
                "or_reff"=>$request->reff_no,
                "total_amount"=>0,
                "total_due_amount"=>0,
                "vat_amount"=>0,
                "sale_due_date"=>Carbon::now(),
                "total_paid_amount"=>0,
                "total_discount"=>0,
                "discount_rate"=>0,
                "ccy"=>0,
                "warehouse_id"=>0,
                "delivery_id"=>$request->DeliveryBy,
                "delivery_date"=>$DeliveryDate,
                "delivery_note"=>$request->DeliveryNoted,
                "delivery_reff_no"=>0,
                "delivery_address"=>$request->DeliveryAddress,
                "delivery_cost"=>$request->DeliveryCost,
                "company_id"=>$com->Company_id,
                "brcode"=>Auth::user()->brcode,
                "sale_status"=>0,
                "payment_status"=>0,
                "repayment_status"=>0,
                "payment_terms"=>$request->PaymentMothod,
                "created_by"=>Auth::user()->name,
                "created_date"=>Carbon::now(),
                "flag"=>2
             ];
            DB::table('rsk_sale')->insert($Sale);

            $transaction_no=DB::table('rsk_tranhist')
                ->where('brcode',Auth::user()->brcode)     
                ->where('userkey',Auth::user()->UserKey)       
                ->max('transaction_no');

            DB::table('rsk_tranhist')
            ->where('userkey',Auth::user()->UserKey)
            ->where('transaction_no',$transaction_no)
            ->update(['brcode'=>Auth::user()->brcode,               
            'sale_id'=>UnityController::temp_sale_autoId(Auth::user()->brcode,$com->Company_id,$request->CusId),'invoice_no'=>$invoice,'flag'=>2]);
            $sale_id = UnityController::temp_sale_autoId(Auth::user()->brcode,$com->Company_id,$request->CusId);
            
            
            


                $rsk_tranhist=DB::table('rsk_tranhist')
                    ->where('userkey',Auth::user()->UserKey)
                    ->where('transaction_no',$transaction_no)
                    ->where('sale_id',$sale_id)
                    ->get();
                foreach($rsk_tranhist as $row){
                    $SaleDetail =[
                        "sale_id" =>$row->sale_id,
                        "product_id"=>UnityController::getproductid($row->productcode,Auth::user()->warehouse_id,$com->Company_id),
                        "prodcut_code"=>$row->productcode,
                        "qty"=>$row->qty,
                        "unit_id"=>1,
                        "unit_cost"=>1,
                        "unit_price"=>$row->unit_price,
                        "Pro_loss_unit_price"=>0,
                        "discount_percentage"=>$row->discount_percentage,
                        "discount_amt"=>0,
                        "paid_amount"=>0,
                        "sale_date"=>Carbon::now(),
                        "sale_due_date"=>Carbon::now(),
                        "cus_id"=>$request->CusId,
                        "project_id"=>$request->ProjectId,
                        "saleman_id"=>$request->SystemId,
                        "ccy"=>'USD',
                        "promotion_id"=>UnityController::is_promotionId($row->productcode,Auth::user()->brcode,$com->Company_id),
                        "product_expire_date"=>Carbon::now(),
                        "withholding_tax_on_non_resident"=>0,
                        "withholding_tax_on_resident"=>0,
                        "created_by"=>Auth::user()->name,
                        "created_date"=>Carbon::now(),
                    ];
                    DB::table('rsk_sale_detail')->insert($SaleDetail);
                }
                if($request->PaymentMothod=='SRPM002' || $request->PaymentMothod=='SRPM004'){
                    DB::table('rsk_tranhist')
                    ->where('userkey',Auth::user()->UserKey)
                    ->where('transaction_no',$transaction_no)
                    ->where('sale_id',$sale_id)
                    ->update(['flag'=>3]);  
                }
                DB::table('rsk_sale')
                    ->where('sale_id',$sale_id)
                    ->update(['flag'=>1]);  

            
            DB::commit();     
            return response()->json(new JsonResponse(["SaleAutoID"=>$transaction_no,"repayment_status"=>$request->PaymentMothod,"sale_id"=>$sale_id]));  
        }catch(\Exception $e){
            
            DB::rollback();
            return response()->json(new JsonResponse([], 'Transaction error'), Response::HTTP_UNAUTHORIZED);
        }
        // // echo 'store';
        // sleep(1);
        // // $request->all();
        //    $validator = Validator::make($request->all(), [
        //     'TrnName' => 'required|max:100',
        //     'PrCode' => 'required',
        //     'TrnDate' => 'required',
        //     'amount' => 'required|numeric|min:0|max:9999999999',
        //     'tranote' => 'max:500',
            
        // ]);
        // if ($validator->fails()) {
        //     return response()->json(['errors' => $validator->errors()], 403);
        // } else {
        //     $params = $request->all();           
        //     $TrnDate=date('Y-m-d',strtotime($request->TrnDate));
           
        // //    // echo  date('Y-m-d',strtotime($params['TrnDate']));
        // //   // echo $params['TrnMode'];  
        //     $sale = Sales::create([
        //         'TrnName' => $params['TrnName'],
        //         'PrName' =>$PrName->FullDesc,
        //         'PrCode' => $params['PrCode'],
        //         'TrnDate' => $TrnDate,
        //         'TrnMode' => $params['TrnMode'],
        //         'TrnAmt' => $params['amount'],
        //         'TrnNote' => $params['tranote'],
        //         'TrnType' => 'TTP001',
        //         'Posteddate' =>Carbon::now(),
        //         'created_date'=>Carbon::now(),
        //         'CompanyName' =>$com->company_name_en,
        //         'CompanyId'=> $params['CompanyId'],
        //         'BrCode' =>Auth::user()->brcode,
        //         'BrName' =>Auth::user()->brname,
        //         'created_by' =>Auth::user()->name,
        //         'ccy' => $params['ccy'],    
        //     ]); 
            
           
        //     return new  SaleDailyResource($sale);
        //  }
    }
    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Sales $sale)
    {
       
        return new SaleDailyResource($sale);
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
    public function update(Request $request,Sales $sale)
    {  
      
        $company=new CompanyController();
        $field="company_name_en,Company_id";
        $com=$company->is_company($field,Auth::user()->brcode,$request->Company_id);
        $PrName=ProductController::is_product('FullDesc',$request->PrCode,$request->Company_id);

        if ($sale === null) {
            return response()->json(['error' => 'Sale not found'], 404);
        }

        $validator = Validator::make($request->all(),[
            'TrnName' => 'required|max:100',
            'TrnDate' => 'required',
            'TrnAmt' => 'required|numeric|min:0|max:9999999999',
            'TrnMode' => 'required',
            ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 403);
        } else {  
            $update=
            [
                "TrnName" =>$request->TrnName,
                "PrCode"  =>$request->PrCode,
                "PrName"  =>$PrName->FullDesc,
                "TrnDate" =>$request->TrnDate,
                "TrnAmt"  =>$request->TrnAmt,               
                "TrnMode" =>$request->TrnMode,
                "TrnNote" =>$request->TrnNote,
                "TrnType" =>'TTP001',                
                "CompanyName"=>$com->company_name_en,
                "CompanyId"=>$request->Company_id,               
                "updated_by"=>Auth::user()->name,
                "updated_at"=>Carbon::now(),
                "ccy"=>$request->ccy,
                "status"=>1,
                "flag"=>$request->flag,
            ];
            DB::table('stsk_detail')->where('Id',$request->Id)->update($update);
            $sale=DB::table('stsk_detail')->where('Id',$request->Id)->get();
            $data=[];
            foreach($sale as $row){
                $da=[
                    "Id" =>$row->Id,
                    "TrnName" =>$row->TrnName,
                    "PrCode"  =>$row->PrCode,
                    "PrName"  =>$row->PrName,
                    "TrnDate" =>$row->TrnDate,
                    "TrnAmt"  =>$row->TrnAmt,               
                    "TrnMode" =>$row->TrnMode,
                    "TrnNote" =>$row->TrnNote,
                    "TrnType" =>$row->TrnType,
                    "Posteddate"=>$row->Posteddate,
                    "created_date"=>$row->created_date,
                    "CompanyName"=>$row->CompanyName,
                    "CompanyId"=>$row->CompanyId,
                    "BrCode"=>$row->BrCode,
                    "BrName"=>$row->BrName,
                    "created_by"=>$row->created_by,
                    "ccy"=>$row->ccy,
                    "flag"=>$row->flag
                ];
                $data[]=$da;
            }
            return collect(["data"=>$data])->toArray();
        
        }
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
                $sale=Sales::where('sale_id',$request->sale_id)->first();
                if ($sale->flag==1){
                    if($user->email<>Auth::user()->email){
                        Sales::where('sale_id',$request->sale_id)
                        ->update([                           
                                    'authorized_by'=>$user->name,
                                    'authorized_date'=>Carbon::now(),
                                    'status'=>0
    
                                ]);
                        $sale->save();
                        return response()->json(new JsonResponse([], 'login Success'), Response::HTTP_OK);
                        }else{
                            return response()->json(new JsonResponse([], "You can't approve this transcation"), Response::HTTP_UNAUTHORIZED);
                        }
                }                
            
        }else{
             return response()->json(new JsonResponse([], 'login_error'), Response::HTTP_UNAUTHORIZED);
        }
        
        

    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {    
        $sale=Sales::where('sale_id',$id)->first();
        if ($sale->flag==1){
            Sales::where('sale_id',$id)->update(['flag'=>0]);
        }else{
            //update user status to activate
            Sales::where('sale_id',$id)->update(['flag'=>1]);
        }
        $sale->save();

    }

}
