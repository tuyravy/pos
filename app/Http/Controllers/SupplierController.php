<?php

namespace App\Http\Controllers;

use App\Http\Resources\SupplierResources;
use Illuminate\Http\Request;
use App\stsk\Models\Supplier;
use Illuminate\Http\Resources\Json\ResourceCollection;
use Illuminate\Support\Arr;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Auth;
use DB;

class SupplierController extends Controller
{
    //
    public function SupplierList(){
        $Supplier = new Supplier();
        $ListSupplier = $Supplier->where('flag',1)->get();

        return SupplierResources::collection($ListSupplier);
    }
}
