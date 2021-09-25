<?php

namespace App\Controllers;

use App\Models\ProdukModel;

class Produk extends BaseController
{
    protected $produkModel;

    public function __construct()
    {
        $this->produkModel = new ProdukModel();   
        helper('form'); 
    }

    public function index()
    {
        $data = [
            'title' => 'Daftar Produk', // Nama Halaman
            'all_data' => $this->produkModel->select_data(), // Select All Data
            'category' => $this->produkModel->get_category(), // select all category
            'get_kobar' => $this->produkModel->get_kobar(), // produksi kode barang
            
        ];

        return view('produk/index', $data);
    }

    // ambil sub_kategori
    public function get_sub_category(){

        $data = $this->db->table('sub_category')
        ->where('subcategory_category_id', $this->request->getVar('subcategory_category_id'))
        ->get()->getResultObject();

        echo json_encode($data);
	}

    public function add_data()
    {
        // validation
        $rules = $this->validate([
            'kode_produk'   => 'required',
            'name'          => 'required',
            'category'      => 'required',
            'sub_category'  => 'required',
            'merk'          => 'required',
            'kuantitas'     => 'required',
            'satuan'        => 'required',
            'sku'           => 'required',
        ]);

        if (!$rules) {
            session()->setFlashData('failed', \Config\Services::validation()->getErrors());
            return redirect()->back();
        }

        $data = [
            'kode_produk'   => $this->request->getPost('kode_produk'),
            'name'          => $this->request->getPost('name'),
            'category'      => $this->request->getPost('category'),
            'sub_category'  => $this->request->getPost('sub_category'),
            'merk'          => $this->request->getPost('merk'),
            'kuantitas'     => $this->request->getPost('kuantitas'),
            'satuan'        => $this->request->getPost('satuan'),
            'sku'           => $this->request->getPost('sku'),
        ];

        $this->produkModel->add_data($data);
        session()->setFlashData('success', 'data has been added to database.');
        return redirect()->back();
    }

    public function delete_data($id)
    {
        $this->produkModel->delete_data($id);
        session()->setFlashData('success', 'data has been deleted from database.');
        return redirect()->back();
    }

    public function update_data($id)
    {
        // validation
        $rules = $this->validate([
            'kode_produk'   => 'required',
            'name'          => 'required',
            'upcategory'    => 'required',
            'upsub_category'=> 'required',
            'merk'          => 'required',
            // 'kuantitas'     => 'required',
            'satuan'        => 'required',
            'sku'           => 'required',
        ]);

        if (!$rules) {
            session()->setFlashData('failed', \Config\Services::validation()->getErrors());
            return redirect()->back();
        }

        $data = [
            'kode_produk'   => $this->request->getPost('kode_produk'),
            'name'          => $this->request->getPost('name'),
            'category'      => $this->request->getPost('upcategory'),
            'sub_category'  => $this->request->getPost('upsub_category'),
            'merk'          => $this->request->getPost('merk'),
            // 'kuantitas'     => $this->request->getPost('kuantitas'),
            'satuan'        => $this->request->getPost('satuan'),
            'sku'           => $this->request->getPost('sku'),
        ];

        $this->produkModel->update_data($id, $data);
        session()->setFlashData('success', 'data has been updated from database.');
        return redirect()->back();
    }
}
