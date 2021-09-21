<?php namespace App\Controllers;

class Login extends BaseController
{
	public function index()
	{
        $data = [
            'title' => 'LOGIN PAGE',
        ];
		return view('auth/login', $data);
	}

  //--------------------------------------------------------------------

}