<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use Auth;
use App\User;
use Hash;
use App\Http\Controllers\CompanyController;
class UnityController extends Controller
{

    /**
     * store in unity blog 
     * @param @request product_id
     * return value true when product promotion but false when expire_date promotion
     */
    public static function is_promottion($product_id,$brcode,$company_id,$active){
        
        $product_id=DB::table('rsk_promotion')
                        ->where('product_id',$product_id)
                        ->where('flag',$active)
                        ->get();

        foreach($product_id as $row){
            return true;
        }
    }
    /**
     * store in unity blog
     * return promotion id
     */
    public static function is_promotionId($product_id,$brcode,$company_id){
        $product_id=DB::table('rsk_promotion')
                        ->where('product_id',$product_id)
                        ->where('flag',1)
                        ->get();

        foreach($product_id as $row){
            return $row->promotion_id;
        }
        return 0;
    }
    /**
     * Auth checking login
     */
    public function auth_login(Request $request)
    {
        $user=DB::table('users')
                        ->where('email',$request->username)                        
                        ->first();

                       
        if ($user->username && Hash::check($request->password,$user->password)) {
           
           
            return response()->json(['flag'=>1,'username'=>$user->username]);
        }else{
            return response()->json(['flag'=>0]);
        }
       
    
       
    } 

 /**
     * store in unity blog 
     * @param @request product_id
     * return value true when product promotion but false when expire_date promotion
     */
    // public static function is_promottion($product_id,$brcode,$company_id,$active,$Sale_date){
        
    //     $product_id=DB::table('promotion')
    //                     ->where('product_id',$product_id)
    //                     ->where('flag',$active)
    //                     ->whereBetween('promotion_start',$Sale_date)
    //                     ->whereBetween('promotion_end',$Sale_date)
    //                     ->get();

    //     foreach($product_id as $row){
    //         return true;
    //     }
    // }





    /**
     * store in unity blog
     * @param $request $brcode,$company_id,$warehouse_id,$productcode
     * return value $defullt_price
     */
    
    public static function getdefult_price($brcode,$company_id,$warehouse_id,$productcode,$active){
        $product_id=UnityController::getproductid($productcode,$warehouse_id,$company_id);
        if(UnityController::is_promottion($product_id,$brcode,$company_id,$active)==true)
        {

            $defullt_price=DB::table('promotion')
                        ->where('product_id',$product_id)
                        ->where('brcode',$brcode)                       
                        ->where('company_id',$company_id)
                        ->where('flag',$active)
                        ->get();
            foreach($defullt_price as $row){
                return $row->default_price*UnityController::getccy($row->ccy);
            }

        }else{

            $defullt_price=DB::table('product')
                        ->where('product_code',$productcode)
                        ->where('brcode',$brcode)
                        ->where('warehouse_id',$warehouse_id)
                        ->where('company_id',$company_id)
                        ->where('flag',$active)
                        ->get();
            foreach($defullt_price as $row){
                return $row->default_price*UnityController::getccy($row->ccy);
            }

        }
        
    }
     /**
     * store in unity blog
     * @param $request $brcode,$company_id,$warehouse_id,$productcode
     * return value $retail_price
     */
    public static function getretail_price($brcode,$company_id,$warehouse_id,$productcode,$active){
        $product_id=UnityController::getproductid($productcode,$warehouse_id,$company_id);
        if(UnityController::is_promottion($product_id,$brcode,$company_id,$active)==true)
        {

            $retail_price=DB::table('promotion')
                        ->where('product_id',$product_id)
                        ->where('brcode',$brcode)                       
                        ->where('company_id',$company_id)
                        ->where('flag',$active)
                        ->get();
            foreach($retail_price as $row){
                return $row->retail_price*UnityController::getccy($row->ccy);
            }

        }else{
            $retail_price=DB::table('product')
                            ->where('product_code',$productcode)
                            ->where('brcode',$brcode)
                            ->where('warehouse_id',$warehouse_id)
                            ->where('company_id',$company_id)
                            ->where('flag',$active)
                            ->get();
            foreach($retail_price as $row){
                return $row->retail_price*UnityController::getccy($row->ccy);
            }
        }
    }
     /**
     * store in unity blog
     * @param $request $brcode,$company_id,$warehouse_id,$productcode
     * return value $wholesale_price
     */
    public static function getwholesale_price($brcode,$company_id,$warehouse_id,$productcode,$active){
        $product_id=UnityController::getproductid($productcode,$warehouse_id,$company_id);
        if(UnityController::is_promottion($product_id,$brcode,$company_id,$active)==true)
        {

            $wholesale_price=DB::table('promotion')
                        ->where('product_id',$product_id)
                        ->where('brcode',$brcode)                       
                        ->where('company_id',$company_id)
                        ->where('flag',$active)
                        ->get();
            foreach($wholesale_price as $row){
                return $row->wholesale_price*UnityController::getccy($row->ccy);
            }

        }else{
            $wholesale_price=DB::table('product')
                ->where('product_code',$productcode)
                ->where('brcode',$brcode)
                ->where('warehouse_id',$warehouse_id)
                ->where('company_id',$company_id)
                ->where('flag',$active)
                ->get();
            foreach($wholesale_price as $row){
                return $row->wholesale_price*UnityController::getccy($row->ccy);
            }
        }
    }

    /**
     * store in unity blog
     * return array warehose for show all warehouse
     */
    public static function Getwarehouse()
    {
        $warehouse=DB::table('warehouse')
                      ->where('flag',1)
                      ->get();
        return $warehouse;
    }
    /**
     * store in unity blog
     * return array warehouse base user login
     */
    public static function getwarehouse_baseuser(){
        $warehouseid=Auth::user()->warehouse_id;
        $warehouse=DB::table('warehouse')
                      ->where('flag',1)
                      ->where('warehouse_id',$warehouseid)
                      ->get();
        return $warehouse;
    }
    /**
     * store in unity blog
     * return array customer base on brcode
     */
    public static function getcustomer(){

        $brcode=Auth::user()->brcode;
        $customer=DB::table('customer')
                    ->where('flag',1)
                    ->where('brcode',$brcode)
                    ->get();
        return $customer;

    }
    /**
     * Project select option
     * store unity blog
     * @param $request
     * return data in ajax for display value
     */
    public static function getproject(Request $request){

        $customer_project=DB::table('customer_project')
                    ->where('flag',1)                    
                    ->where('cus_id',$request->CustID)
                    ->get();
        $output=0;
        if(count($customer_project)>0){
            foreach($customer_project as $row)
            {
                $output.="<option value='".$row->project_id."'>";
                $output.=$row->project_name_kh;
                $output.="</option>";
            };
        }else{
            $customer_project=DB::table('customer_project')
                    ->where('flag',1)                    
                    ->where('cus_id','11000')
                    ->get();
            foreach($customer_project as $row)
            {
                $output.="<option value='".$row->project_id."'>";
                $output.=$row->project_name_kh;
                $output.="</option>";
            };
        }
        
        echo $output;
    }

    /**
     * Store in Unity blog
     * @param $look_code it key in table lookup_code 
     * return value $lookup
     */
    public static function getlookup_code($look_code)
    {
        $lookup=DB::table('lookup_code')
        ->where('flag',1)
        ->where('look_code',$look_code)
        ->orderBy('full_name_kh')
        ->get();
        return $lookup;
    }
    /**
     * Store in unity blog
     * @param $productcode,$warehouse_id,$company_id
     * return value product_id
     */
    public static function getproductid($productcode,$warehouse_id,$company_id)
    {
        $brcode=Auth::user()->brcode;
        $proid=DB::table('product')
                   ->where('product_code',$productcode)
                   ->where('warehouse_id',$warehouse_id)
                   ->where('company_id',$company_id)
                   ->where('brcode',$brcode)
                   ->get();
            
        foreach($proid as $row){
            return $row->product_id;
        }

    }
    /**
     * Get sale id by invoice number
     */
    
    public static function getsaleIdbyInvoice($brcode,$company_id,$Invoice){
        $sale_id=DB::table('sale')
        ->where('invoice_no',$Invoice)
        ->where('brcode',$brcode)
        ->where('company_id',$company_id)        
        ->max('sale_id');
        return $sale_id;
    }
    /**
     * store in unity blog
     * @param $brcode,$company_id
     * return max value sale_id base on brcode and company_id
     */
    public static function getsale_id($brcode,$company_id){

        $sale_id=DB::table('sale')
                    ->where('brcode',$brcode)
                    ->where('company_id',$company_id)
                    ->max('sale_id');
        return $sale_id;            
    }
    /**
     * store in unity blog
     * return exchange
     */
    public static function exchange($ccy_key){
        $company_id=Auth::user()->company_id;
        $brcode=Auth::user()->brcode;
        $company_id=Auth::user()->company_id;
        $max_fxdate=DB::table('fx_rate')
                        ->where('brcode',$brcode)
                        ->where('company_id',$company_id)
                        ->max('fx_date');
        
        $Ccy=DB::table('fx_rate')
                ->where('brcode',$brcode)
                ->where('company_id',$company_id)
                ->where('fx_date',$max_fxdate)
                ->get();
        foreach($Ccy as $row){

           return $row->fx_rate;
            
        }
    }
    /**
     * store in unity blog
     * @param $ccy_key,
     */
    public static function getccy($ccy_key){

        $brcode=Auth::user()->brcode;
        $company_id=Auth::user()->company_id;
        $max_fxdate=DB::table('fx_rate')
                       
                        ->where('company_id',$company_id)
                        ->max('fx_date');
        
        $Ccy=DB::table('fx_rate')
                
                ->where('company_id',$company_id)
                ->where('fx_date',$max_fxdate)
                ->get();
        foreach($Ccy as $row){

            switch($row->orig_ccy){

                case "USD":

                    switch($ccy_key){

                        case 1:
                            return $origCCY=1;
                        break;
                        case 2:
                            return $origCCY=$row->fx_rate;
                        break;
                       
                        case 5:
                            return $origCCY=$row->fx_rate;
                        break;

                    }

                break;
                case "KHR":

                    switch($ccy_key){

                        case 1:
                            return $origCCY=1;
                        break;
                        case 2:
                            return $origCCY=$row->fx_rate;
                        break;
                       
                        case 5:
                            return $origCCY=$row->fx_rate;
                        break;

                    }
                    
                break;
            } 
            
        }
    }
    /**
     * store in Unity blog
     * @param 
     */
    public static function is_discount_percentage($brcode,$company_id,$warehouse_id,$productcode,$active){
        $product_id=UnityController::getproductid($productcode,$warehouse_id,$company_id);
        if(UnityController::is_promottion($product_id,$brcode,$company_id,$active)==true)
        {

            $discount=DB::table('promotion')
                        ->where('product_id',$product_id)
                        ->where('flag',$active)
                        ->get();
            foreach($discount as $row){

                return $row->discount_percentage;
            }

        }else{
            return 0;
        }
    }
    /**
     * this funciton return province only
     */
    public static function getprovince(){
                //deful values p_code
                $selectRaw="distinct(p_code) as p_code,
                p_name_en,p_name_kh";
                $location=DB::table('location')
                ->selectRaw($selectRaw)
                ->where('flag',1)               
                ->get();
               
                return $location;
    }
      /**
     * store in Unity blog
     * @param $location_code when it use this function please assign number of lenth base or code ,pcode,dcode,ccode,vcode
     * return array location base on code   
     */
    public static function location(Request $request){

        $location_code = $request->locationcode;
        $lang = \Request::segment(1);
        $output="";
        switch(strlen($location_code))
        {   
                
                case 2:
                    //return d_code useing ajax
                    $location=DB::table('location')
                    ->select('d_code','d_name_en', 'd_name_kh')
                    ->where('p_code',$location_code)
                    ->where('flag',1)
                    ->distinct()
                    ->get();
                    
                    $d_name = 'd_name_'.$lang;
                    foreach($location as $row){

                        $output.="<option value='".$row->d_code."'>";
                        $output.=$row->$d_name;
                        $output.="</option>";
                    }
                    echo $output;
                break;
                case 4:
                    //return c_code
                    
                    $location=DB::table('location')
                    ->select('c_code','c_name_en', 'c_name_kh')
                    ->where('d_code',$location_code)
                    ->where('flag',1)
                    ->distinct()
                    ->get();

                    $c_name = 'c_name_'.$lang;
                    foreach($location as $row){

                        $output.="<option value='".$row->c_code."'>";
                        $output.=$row->$c_name;
                        $output.="</option>";
                    }
                    echo $output;

                break;
                case 6:
                    //return v_code
                    $location=DB::table('location')
                    ->select('location_code','v_name_en', 'v_name_kh')
                    ->where('c_code',$location_code)
                    ->where('flag',1)
                    ->distinct()
                    ->get();

                    $v_name = 'v_name_'.$lang;
                    foreach($location as $row){

                        $output.="<option value='".$row->location_code."'>";
                        $output.=$row->$v_name;
                        $output.="</option>";
                    }
                    echo $output;
                break;
               
        }
       
    }
    /**
     * this function for get invoice number auto
     * company-id+| BRCODE-YYMM-auto incensement  by company id , by branch 
     */
    public static function get_invoice(){
        $company=new CompanyController();
        $field="company_name_en,Company_id";
        $com=$company->is_company($field,Auth::user()->brcode,Auth::user()->CompanyCode);
        $company_id=$com->Company_id;
        $brcode=Auth::user()->brcode;
        $Date_Format=date('ym');
        $Year=date('19');
        $Invoice=DB::table('rsk_sale')
            ->where('brcode',$brcode)
            ->where('company_id',$company_id)
            ->max('invoice_no');
        if($Invoice==""){
            $Invoice=sprintf("%06d",0);
        }
        $Incensement=UnityController::right($Invoice,6);
        $Year_Invoice=substr(UnityController::right(str_replace('-','',$Invoice),11),0,2);
        
        if($Year>$Year_Invoice && ($Incensement==999999 || $Incensement==9999999 || $Incensement==99999999 || $Incensement==999999999))
        {
             $Auto_ID=sprintf("%06d",1+1);

        }else{
             $Auto_ID=sprintf("%06d",$Incensement+1);
        }
        

        
        //$company_id.'|'.$brcode.'-'.$Date_Format.'-'. $Auto_ID;
        return $company_id.'|'.$brcode.'-'.$Date_Format.'-'. $Auto_ID;
       
    }
    /**
     * this function for get vat by product
     * @param @Product_id
     */
    public static function vat($product_id){

        $vat=DB::table('product')
                 ->where('product_id',$product_id)
                 ->where('flag',1)
                 ->get();
        foreach($vat as $row){
            return $row->Product_Tax;
        }
    }
    
    /**
     * this function get left string 
     * @param $str,$length
     */
    public static function left($str, $length) {
        return substr($str, 0, $length);
    }
    /**
     * this function get right string
     * @param $str,$length
     */
    public static function right($str, $length) {
        return substr($str, -$length);
   }
   /**
    * this function get Sale Auto increment
    */
    public static function sale_autoId($brcode,$company_id){

         $sale_autoid=DB::table('rsk_sale')
                    ->where('brcode',$brcode)
                    ->where('company_id',$company_id)                   
                    ->max('sale_id');
        if($sale_autoid==""){

            return $brcode.$company_id.+1;
        }else{
            return $sale_autoid+1;
        }
           
    }
    /**
    * this function get Sale Auto increment
    */
    public static function temp_sale_autoId($brcode,$company_id,$cusid){

        $sale_autoid=DB::table('rsk_sale')
                   ->where('brcode',$brcode)
                   ->where('company_id',$company_id)
                   ->get()->last()->sale_id;
        return $sale_autoid;
        // foreach($sale_autoid as $row){
        //     return $row->sale_id;
        // }
                   
          
   }
   public static function transaction_no($brcode,$userkey){

    $sale_autoid=DB::table('rsk_tranhist')
               ->where('brcode',$brcode)     
               ->where('userkey',$userkey)       
               ->max('transaction_no');
            if($sale_autoid==""){

                return $brcode+1;
            }else{
                return $sale_autoid+1;
            }
               
      
}
   
    
    /**
     * Check Crdit amount customer
     */
    public static function LimitCrditAmout($cus_id,$brcode){

        $result=DB::table('customer')
                 ->where('cus_id',$cus_id)
                 ->where('flag',1)
                 ->where('brcode',$brcode)
                 ->get();
        foreach($result as $row){

            return $row->credit_limit;
        }
    }
    /**
     * Void Invoice
     * this function we void invoice after edit or delete reject
     * Void invoice set flag=-3 when we get report that void don't forget where by flag=-3
     */
    public static function voidInvoice($InvoiceNo,$brcode){
        //Set flag table sale
        DB::table('sale')
                ->where('invoice_no',$InvoiceNo)
                ->where('brcode',$brcode)
                ->update(array('flag'=>'-3'));
        //Set flag table sale_detail
        $sale_id=DB::table('sale')
                ->where('invoice_no',$InvoiceNo)
                ->get();
        $saleId="";
        foreach($sale_id as $row){
            $saleId=$row->sale_id;
        }
        
        DB::table('sale_detail')
            ->where('sale_id',$saleId)
            ->update(array('flag'=>'-3'));
        
        // //set flag table repayment

        DB::table('repayment')
            ->where('sale_id',$saleId)
            ->update(array('flag'=>'-3'));

        $repaymentId=DB::table('repayment')
            ->where('sale_id',$saleId)
            ->get();

        $reID="";
        foreach($repaymentId as $row){

            $reID=$row->repayment_id;
        }
        //set flag table repayment_detail
        DB::table('repayment_detail')
        ->where('repayment_id',$reID)
        ->update(array('flag'=>'-3'));

        return 0;
    }
    /**
     * this function get check deplicate or_reff
     */
    public static function getor_reff($or_reff){
        $company_id=Auth::user()->company_id;
        $brcode=Auth::user()->brcode;
        
        $or=DB::table('repayment_detail')
                ->where('brcode',$brcode)
                ->where('company_id',$company_id)
                ->where('or_reff',$or_reff)
                ->where('flag',[0,1])
                ->get();
        if(count($or)>0){
            return true;
        }else{
            return false;
        }
        
    }
    /**
     * this function get check  or_reff number
     */
    public static function getor_reffNo($sale_id,$brcode,$company_id){
        
        
        $or_reff=DB::table('rsk_sale')           
                        ->where('sale_id',$sale_id)
                        ->where('brcode',$brcode)
                        ->where('company_id',$company_id)
                        ->get()->last()->or_reff;
        
        return  $or_reff;
        
    }
    /**
     * this funciton get data from setting table
     * @param $lookcode return setting_value
     */
    public static function get_setting($look_code,$num_value){

        $setting_value=DB::table("setting")
                            ->where('look_code',$look_code)
                            ->where('flag',1)
                            ->get();

        foreach($setting_value as $row){
            if($num_value==1){
                return UnityController::left($row->setting_value_1,1);
            }
            if($num_value==2){
                return UnityController::left($row->setting_value_2,1);
            }
            if($num_value==3){
                return UnityController::left($row->setting_value_3,1);
            }
        }
    }

    /**
     * Get type of user like Deliver, Driver, ...
     * 
     * @return $mixed
     */
    public static function get_user_type()
    {
        $users = User::select('id', 'name')->where('emp_code', '<>', '')->where('flag', '=', 1)->get();
        return $users;
    }

    /**
     * Get Customer Name
     * This functionn we can get customer by name and brcode
     */
    public static function getCustomerName($cus_id,$brcode,$company_id){

            $customer=DB::table('customer')            
                            ->where('flag',1)
                            ->where('cus_id',$cus_id)
                            ->where('brcode',$brcode)
                            ->where('company_id',$company_id)
                            ->get();
            
            return  $customer;

    }
        /**
         * Get Customer Name
         * This functionn we can get customer by name and brcode
         */
        public static function getCustomerId($sale_id,$brcode,$company_id){

            $customer=DB::table('rsk_sale')           
                            ->where('sale_id',$sale_id)
                            ->where('brcode',$brcode)
                            ->where('company_id',$company_id)
                            ->get()->last()->cus_id;
            
            return  $customer;

    }
    /**
     * Get payment id
     * This functionn we can get customer by name and brcode
     */
    public static function is_paymentId($sale_id,$brcode,$company_id){

        $repayment_id=DB::table('rsk_repayment')           
                        ->where('sale_id',$sale_id)
                        ->where('brcode',$brcode)
                        ->where('company_id',$company_id)
                        ->get()->last()->repayment_id;
        
        return $repayment_id;

    }
    /**
     * Get payment id
     * This functionn we can get customer by name and brcode
     */
    public static function is_invoice_no($sale_id,$brcode,$company_id){

        $invoice_no=DB::table('rsk_sale')           
                        ->where('sale_id',$sale_id)
                        ->where('brcode',$brcode)
                        ->where('company_id',$company_id)
                        ->get()->last()->invoice_no;
        
        return  $invoice_no;

    }
    
}
