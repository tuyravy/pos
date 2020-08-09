<?php

use Illuminate\Http\Request;
use \App\stsk\Faker;
use \App\stsk\JsonResponse;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::group(['middleware' => 'api'], function () {
    Route::post('auth/login', 'AuthController@login');    
    Route::group(['middleware' => 'auth:api'], function () {
    Route::get('auth/user', 'AuthController@user');
    Route::post('auth/logout', 'AuthController@logout');    
    });

    
    Route::apiResource('users', 'UserController')->middleware('permission:' . \App\stsk\Acl::PERMISSION_USER_MANAGE);
    Route::get('users/{user}/permissions', 'UserController@permissions')->middleware('permission:' . \App\stsk\Acl::PERMISSION_PERMISSION_MANAGE);
    Route::put('users/{user}/permissions', 'UserController@updatePermissions')->middleware('permission:' . \App\stsk\Acl::PERMISSION_PERMISSION_MANAGE);
    Route::apiResource('roles', 'RoleController')->middleware('permission:' . \App\stsk\Acl::PERMISSION_PERMISSION_MANAGE);
    Route::get('roles/{role}/permissions', 'RoleController@permissions')->middleware('permission:' . \App\stsk\Acl::PERMISSION_PERMISSION_MANAGE);
    Route::apiResource('permissions', 'PermissionController')->middleware('permission:' . \App\stsk\Acl::PERMISSION_PERMISSION_MANAGE);
  //------------------------------------------------------------------------------------------------------------------------------------------------------
  
    //SaleDaily Get sale 

    Route::apiResource('sales','SaleDailyController')->middleware('permission:' . \App\stsk\Acl::PERMISSION_USER_MANAGE);
    Route::get('sales/{id}', 'SaleDailyController@show')->middleware('permission:' . \App\stsk\Acl::PERMISSION_USER_MANAGE);
    Route::post('sales', 'SaleDailyController@store')->middleware('permission:' . \App\stsk\Acl::PERMISSION_USER_MANAGE);
    Route::post('addtolist','SaleDailyController@AddToList')->middleware('permission:' . \App\stsk\Acl::PERMISSION_USER_MANAGE);
   
    
    Route::get('listtempProduct','SaleDailyController@GetProList')->middleware('permission:' . \App\stsk\Acl::PERMISSION_USER_MANAGE);
    Route::delete('removeTempProduct/{id}','SaleDailyController@RemoveTemProduct')->middleware('permission:' . \App\stsk\Acl::PERMISSION_USER_MANAGE);
    Route::put('sales/{id}/sales', 'SaleDailyController@update')->middleware('permission:' . \App\stsk\Acl::PERMISSION_USER_MANAGE);
    Route::delete('sales/{id}', 'SaleDailyController@destroy')->middleware('permission:' . \App\stsk\Acl::PERMISSION_USER_MANAGE); 
    Route::post('sales/authorized','SaleDailyController@authorized');
    Route::get('Saleman','SaleDailyController@GetSaleMan')->middleware('permission:' . \App\stsk\Acl::PERMISSION_USER_MANAGE);
    Route::get('PaymentMothod','SaleDailyController@GetPaymentMothod')->middleware('permission:' . \App\stsk\Acl::PERMISSION_USER_MANAGE);
    Route::get('DeliveryPersion','SaleDailyController@GetDelivery')->middleware('permission:' . \App\stsk\Acl::PERMISSION_USER_MANAGE);
    Route::put('ProductlistbyOption/{id}','SaleDailyController@GetProductListbyOption')->middleware('permission:' . \App\stsk\Acl::PERMISSION_USER_MANAGE);
    Route::post('UpdatePricebyOption','SaleDailyController@UpdatePricebyOption')->middleware('permission:' . \App\stsk\Acl::PERMISSION_USER_MANAGE);
    Route::get('ProListDraft/{id}','SaleDailyController@GetProListDraft')->middleware('permission:' . \App\stsk\Acl::PERMISSION_USER_MANAGE);    //---------------------------------------------------------------
    Route::get('ViewDetailItem/{id}','SaleDailyController@ViewDetailItem')->middleware('permission:' . \App\stsk\Acl::PERMISSION_USER_MANAGE);
    
    Route::get('DraftSale/{id}','SaleDailyController@getDraftSale')->middleware('permission:' . \App\stsk\Acl::PERMISSION_USER_MANAGE); 
    Route::get('SummaryPayment/{id}','SaleDailyController@GetSummaryPayment')->middleware('permission:' . \App\stsk\Acl::PERMISSION_USER_MANAGE);
    Route::post('PaidedAmt','SaleDailyController@Paided')->middleware('permission:' . \App\stsk\Acl::PERMISSION_USER_MANAGE);
    
    //Product Get all 
    Route::apiResource('products','ProductController');
    Route::get('FindProductByComId/{id}',['as'=>'company.FindProductByComId','uses'=>'ProductController@FindProductByComId']);
    Route::get('ScanProduct',['as'=>'company.ScanProduct','uses'=>'ProductController@ScanProduct']);
    Route::get('ScanCategory',['as'=>'company.ScanCategory','uses'=>'ProductController@ScanCategory']);
    Route::post('AddStockToList','ProductController@AddStockToList')->middleware('permission:' . \App\stsk\Acl::PERMISSION_USER_MANAGE);
    Route::get('StockTempList','ProductController@StockTempList')->middleware('permission:' . \App\stsk\Acl::PERMISSION_USER_MANAGE);

    Route::post('sys_product',['as'=>'product.sys_product','uses'=>'ProductController@AddProduct'])->middleware('permission:' . \App\stsk\Acl::PERMISSION_USER_MANAGE);
    //Modes Get all 
     Route::apiResource('modes','ModeController')->middleware('permission:' . \App\stsk\Acl::PERMISSION_USER_MANAGE);
     Route::get('findModesByComId/{id}', ['as'=>'modes.index','uses'=>'ModeController@findModesByComId']);
     Route::get('sys_lookup_Mode/{id}', ['as'=>'modes.sys_lookup_Mode','uses'=>'ModeController@sys_lookup_Mode']);
     Route::get('sys_getProvince', ['as'=>'modes.getProvince','uses'=>'ModeController@getProvince']);
     Route::get('sys_getLocation/{id}', ['as'=>'modes.getLocationbyPro','uses'=>'ModeController@getLocationbyPro']);
     Route::get('sys_DeliveryBy', ['as'=>'modes.getDeliveryBy','uses'=>'ModeController@getDeliveryBy']);
     Route::get('sys_Warehouse', ['as'=>'modes.getWarehouse','uses'=>'ModeController@getWarehouse']);
     Route::get('sys_Category',['as'=>'modes.getCategory','uses'=>'ModeController@getCategory']);
     Route::get('sys_SubCategory',['as'=>'modes.getSubCategory','uses'=>'ModeController@GetSubCategory']);
     Route::post('AddSubCategory',['as'=>'modes.AddSubCategory','uses'=>'ModeController@AddSubCategory'])->middleware('permission:' . \App\stsk\Acl::PERMISSION_USER_MANAGE);

    //Compnay Get company name by user
    Route::apiResource('company', 'CompanyController')->middleware('permission:' . \App\stsk\Acl::PERMISSION_USER_MANAGE);
    // Route::get('company/findcompanyId',['as'=>'company.findcompanyId','uses'=>'CompanyController@CompanyToBranch']);
    
    Route::get('CompanyToBranch', 'CompanyController@CompanyToBranch')->middleware('permission:' . \App\stsk\Acl::PERMISSION_USER_MANAGE); 
    Route::get('GetBranch', 'CompanyController@GetBranch')->middleware('permission:' . \App\stsk\Acl::PERMISSION_USER_MANAGE);
    
    //DynamicForm
    Route::apiResource('dynamicform', 'DynamicFormController')->middleware('permission:' . \App\stsk\Acl::PERMISSION_USER_MANAGE); 
    Route::get('dynamicrolesform', 'DynamicFormController@rules')->middleware('permission:' . \App\stsk\Acl::PERMISSION_USER_MANAGE); 
    Route::get('formbyservicetype','DynamicFormController@formbyservicetype')->middleware('permission:' . \App\stsk\Acl::PERMISSION_USER_MANAGE);
    //Plan Get company name by user
    Route::apiResource('plan','PlanController')->middleware('permission:' . \App\stsk\Acl::PERMISSION_USER_MANAGE);
    Route::get('plan/{id}', 'PlanController@show')->middleware('permission:' . \App\stsk\Acl::PERMISSION_USER_MANAGE);
    Route::post('plan', 'PlanController@store')->middleware('permission:' . \App\stsk\Acl::PERMISSION_USER_MANAGE); 
    Route::get('view_planlist', 'PlanController@view_planlist')->middleware('permission:' . \App\stsk\Acl::PERMISSION_USER_MANAGE); 
    Route::post('delete_plan','PlanController@delete_plan')->middleware('permission:' . \App\stsk\Acl::PERMISSION_USER_MANAGE); 
    Route::post('plan/authorized','PlanController@authorized');
    Route::get('updatePlan/{id}', ['as'=>'Plan.updatePlan','uses'=>'PlanController@updatePlan'])->middleware('permission:' . \App\stsk\Acl::PERMISSION_USER_MANAGE);
    // Reports
    Route::apiResource('report', 'ReportsController')->middleware('permission:' . \App\stsk\Acl::PERMISSION_USER_MANAGE);
    Route::get('report', 'ReportsController@index')->middleware('permission:' . \App\stsk\Acl::PERMISSION_USER_MANAGE);

    //Customer
    Route::apiResource('customer','Customer')->middleware('permission:' . \App\stsk\Acl::PERMISSION_USER_MANAGE);
    Route::post('customer', 'Customer@store')->middleware('permission:' . \App\stsk\Acl::PERMISSION_USER_MANAGE);
    Route::get('customer/{id}', 'Customer@show')->middleware('permission:' . \App\stsk\Acl::PERMISSION_USER_MANAGE);
    Route::put('customer/{id}/customer', 'Customer@update')->middleware('permission:' . \App\stsk\Acl::PERMISSION_USER_MANAGE);
    Route::post('customer/authorized','Customer@authorized');
    //Project
    Route::apiResource('Project','ProjectController')->middleware('permission:' . \App\stsk\Acl::PERMISSION_USER_MANAGE);
    Route::post('Project', 'ProjectController@store')->middleware('permission:' . \App\stsk\Acl::PERMISSION_USER_MANAGE);
    Route::post('Project/authorized','ProjectController@authorized');
    Route::put('Project/{id}/Project', 'ProjectController@update')->middleware('permission:' . \App\stsk\Acl::PERMISSION_USER_MANAGE);
    Route::delete('Project/{id}', 'ProjectController@destroy')->middleware('permission:' . \App\stsk\Acl::PERMISSION_USER_MANAGE);
    Route::get('Project/{id}', 'ProjectController@show')->middleware('permission:' . \App\stsk\Acl::PERMISSION_USER_MANAGE);
    Route::get('GetProjectName/{id}','ProjectController@getProjectName')->middleware('permission:' . \App\stsk\Acl::PERMISSION_USER_MANAGE);
    //Warehouse
    Route::apiResource('warehouse','WarehouseController')->middleware('permission:' . \App\stsk\Acl::PERMISSION_USER_MANAGE);
    Route::post('warehouse', 'WarehouseController@store')->middleware('permission:' . \App\stsk\Acl::PERMISSION_USER_MANAGE);
    Route::delete('warehouse/{id}', 'WarehouseController@destroy')->middleware('permission:' . \App\stsk\Acl::PERMISSION_USER_MANAGE);
    Route::put('warehouse/{id}/warehouse', 'WarehouseController@update')->middleware('permission:' . \App\stsk\Acl::PERMISSION_USER_MANAGE);
    Route::post('warehouse/authorized','WarehouseController@authorized');
    Route::put('warehouse/{id}','WarehouseController@show')->middleware('permission:' . \App\stsk\Acl::PERMISSION_USER_MANAGE);
    Route::get('GetWarehouse',['as'=>'warehouse.getwarehouse','uses'=>'WarehouseController@getwarehouse'])->middleware('permission:' . \App\stsk\Acl::PERMISSION_USER_MANAGE);
    //Delivery
    Route::apiResource('delivery','DeliveryController')->middleware('permission:' . \App\stsk\Acl::PERMISSION_USER_MANAGE);
    Route::post('delivery', 'DeliveryController@store')->middleware('permission:' . \App\stsk\Acl::PERMISSION_USER_MANAGE);
    
    /**Supplier */

    Route::get('SupplierList','SupplierController@SupplierList')->middleware('permission:' . \App\stsk\Acl::PERMISSION_USER_MANAGE);
    Route::get('SubCategoryToProduct','ProductController@SubCategoryToProduct')->middleware('permission:' . \App\stsk\Acl::PERMISSION_USER_MANAGE);
});
