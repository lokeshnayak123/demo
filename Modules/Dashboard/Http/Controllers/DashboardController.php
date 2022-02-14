<?php

namespace Modules\Dashboard\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Routing\Controller;


class DashboardController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
      $this->middleware(['ability','auth']);
    }

    public function index()
    {  
        $dynaForm = NULL;
        return view('dashboard::index',compact('dynaForm'));
    }
}
