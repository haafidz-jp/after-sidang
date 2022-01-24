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
            'all_data' => $this->supplierModel->findAll(),
        ];

        return view('supplier/index', $data);
    }

    public function add_data()
    {
        // $data['title'] = 'Add Data';
        $data = [
            'title' => 'Tambah Data Supplier',
            'category' => $this->supplierModel->get_category(), // select all category
        ];

        if ($this->request->getPost()) {
            $rules = [
                'namevendor'    => 'required|string',
                'namesales'     => 'required|string',
                'phone'         => 'required|numeric',
                'email'         => 'required|valid_email',
                'address'       => 'required|string',
                'menyediakan'   => 'required|string',
                'user_created'  => 'required|numeric',
            ];

            if ($this->validate($rules)) {
                $inserted = [
                    'namevendor'    => $this->request->getPost('namevendor'),
                    'namesales'     => $this->request->getPost('namesales'),
                    'phone'         => $this->request->getPost('phone'),
                    'email'         => $this->request->getPost('email'),
                    'address'       => $this->request->getPost('address'),
                    'menyediakan'   => $this->request->getPost('menyediakan'),
                    'user_created'  => $this->request->getPost('user_created'),
                ];

                $this->supplierModel->insert($inserted);
                session()->setFlashData('sukses', 'data has been added to database');
                return redirect()->to('/supplier');
            } else {
                session()->setFlashData('gagal', \Config\Services::validation()->getErrors());
                return redirect()->back()->withInput();
            }
        }
        return view('supplier/form_add', $data);
    }

    public function delete_data($id)
    {

        $this->supplierModel->delete($id);
        session()->setFlashData('sukses', 'data has been deleted from database.');
        return redirect()->to('/supplier');
    }

    public function update_data($id)
    {
        $data = [
            'title' => 'Update Data',
            'dataById' => $this->supplierModel->where('id', $id)->first(),
            'category' => $this->supplierModel->get_category(), // select all category
        ];

        if ($this->request->getPost()) {
            $rules = [
                'namevendor'    => 'required|string',
                'namesales'     => 'required|string',
                'phone'         => 'required|numeric',
                'email'         => 'required|valid_email',
                'address'       => 'required|string',
                'menyediakan'   => 'required|string',
                'user_created'  => 'required|numeric',
            ];

            if ($this->validate($rules)) {

                $inserted = [
                    'namevendor'    => $this->request->getPost('namevendor'),
                    'namesales'     => $this->request->getPost('namesales'),
                    'phone'         => $this->request->getPost('phone'),
                    'email'         => $this->request->getPost('email'),
                    'address'       => $this->request->getPost('address'),
                    'menyediakan'   => $this->request->getPost('menyediakan'),
                    'user_created'  => $this->request->getPost('user_created'),
                ];

                $this->supplierModel->update($id, $inserted);
                session()->setFlashData('sukses', 'data has been updated from database');
                return redirect()->to('/supplier');
            } else {
                session()->setFlashData('gagal', \Config\Services::validation()->getErrors());
                return redirect()->back()->withInput();
            }
        }
        return view('supplier/form_update', $data); 
    }
}
