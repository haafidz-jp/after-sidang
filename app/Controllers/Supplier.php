<?php

namespace App\Controllers;

use App\Models\SupplierModel;

class Supplier extends BaseController
{
    protected $supplierModel;

    public function __construct()
    {
        $this->supplierModel = new SupplierModel();
        helper('form');    
    }

    public function index()
    {
        $data = [
            'title' => 'Supplier',
            'all_data' => $this->supplierModel->findAll()
        ];

        return view('supplier/index', $data);
    }

    public function add_data()
    {
        $data['title'] = 'Add Data';
        if ($this->request->getPost()) {
            $rules = [
                'namevendor' => 'required|alpha_space',
                'namesales' => 'required|alpha_space',
                'phone' => 'required|numeric',
                'email' => 'required|valid_email',
                'address' => 'required|string',
            ];

            if ($this->validate($rules)) {
                $inserted = [
                    'namevendor' => $this->request->getPost('namevendor'),
                    'namesales' => $this->request->getPost('namesales'),
                    'phone' => $this->request->getPost('phone'),
                    'email' => $this->request->getPost('email'),
                    'address' => $this->request->getPost('address')
                ];

                $this->supplierModel->insert($inserted);
                session()->setFlashData('success', 'data has been added to database');
                return redirect()->to('/supplier');
            } else {
                session()->setFlashData('failed', \Config\Services::validation()->getErrors());
                return redirect()->back()->withInput();
            }
        }
        return view('supplier/form_add', $data);
    }

    public function delete_data($id)
    {

        $this->supplierModel->delete($id);
        session()->setFlashData('Success', 'data has been deleted from database.');
        return redirect()->to('/supplier');
    }

    public function update_data($id)
    {
        $data = [
            'title' => 'Update Data',
            'dataById' => $this->supplierModel->where('id', $id)->first()
        ];

        if ($this->request->getPost()) {
            $rules = [
                'namevendor' => 'required|alpha_space',
                'namesales' => 'required|alpha_space',
                'phone' => 'required|numeric',
                'email' => 'required|valid_email',
                'address' => 'required|string'
            ];

            if ($this->validate($rules)) {

                $inserted = [
                    'namevendor' => $this->request->getPost('namevendor'),
                    'namesales' => $this->request->getPost('namesales'),
                    'phone' => $this->request->getPost('phone'),
                    'email' => $this->request->getPost('email'),
                    'address' => $this->request->getPost('address')
                ];

                $this->supplierModel->update($id, $inserted);
                session()->setFlashData('success', 'data has been updated from database');
                return redirect()->to('/supplier');
            } else {
                session()->setFlashData('failed', \Config\Services::validation()->getErrors());
                return redirect()->back()->withInput();
            }
        }
        return view('supplier/form_update', $data); 
    }
}
