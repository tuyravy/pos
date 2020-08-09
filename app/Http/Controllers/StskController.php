<?php
/**
 * File LaravelController.php
 *
 * @author Tuan Duong <bacduong@gmail.com>
 * @package Laravue
 * @version 1.0
 */

namespace App\Http\Controllers;

use Illuminate\Http\Request;

/**
 * Class LaravueController
 *
 * @package App\Http\Controllers
 */
class StskController extends Controller
{
    /**
     * Entry point for Laravue Dashboard
     *
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function index()
    {
        //echo $testk="Hello world";
        return view('stsk');
    }
}
