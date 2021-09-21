<?php namespace App\Controllers;

class Landing extends BaseController
{
	public function index()
	{
        $data = [
            'title' => 'LANDING PAGE',
        ];
		return view('landing/index', $data);
	}

  //--------------------------------------------------------------------

}