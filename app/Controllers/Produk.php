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
            'title'         => 'Daftar Produk', // Nama Halaman
            'all_data'      => $this->produkModel->select_data(), // Select All Data
            'category'      => $this->produkModel->get_category(), // select all category
            'sub_category'  => $this->produkModel->get_subcategory(), // select all sub category
            'get_kobar'     => $this->produkModel->get_kobar(), // produksi kode barang
            'get_supplier'  => $this->produkModel->get_supplier(), // panggil supplier
            
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
            'user_created'  => 'required',
            'category'      => 'required',
            'sub_category'  => 'required',
            'merk'          => 'required',
            'kuantitas'     => 'required',
            'satuan'        => 'required',
            'sku'           => 'required',
            'supplier'      => 'required',
        ]);

        if (!$rules) {
            session()->setFlashData('gagal', \Config\Services::validation()->getErrors());
            return redirect()->back();
        }

        $data = [
            'kode_produk'   => $this->request->getPost('kode_produk'),
            'name'          => $this->request->getPost('name'),
            'user_created'  => $this->request->getPost('user_created'),
            'category'      => $this->request->getPost('category'),
            'sub_category'  => $this->request->getPost('sub_category'),
            'merk'          => $this->request->getPost('merk'),
            'kuantitas'     => $this->request->getPost('kuantitas'),
            'satuan'        => $this->request->getPost('satuan'),
            'sku'           => $this->request->getPost('sku'),
            'supplier'      => $this->request->getPost('supplier'),
        ];

        $this->produkModel->add_data($data);
        session()->setFlashData('sukses', 'data has been added to database.');
        return redirect()->back();
    }

    public function delete_data($id)
    {
        $this->produkModel->delete_data($id);
        session()->setFlashData('sukses', 'data has been deleted from database.');
        return redirect()->back();
    }

    public function update_data($id)
    {
        // validation
        $rules = $this->validate([
            'kode_produk'   => 'required',
            'name'          => 'required',
            'user_created'  => 'required',
            'upcategory'    => 'required',
            'upsub_category'=> 'required',
            'merk'          => 'required',
            'satuan'        => 'required',
            'sku'           => 'required',
            'upsupplier'    => 'required',
        ]);

        if (!$rules) {
            session()->setFlashData('gagal', \Config\Services::validation()->getErrors());
            return redirect()->back();
        }

        $data = [
            'kode_produk'   => $this->request->getPost('kode_produk'),
            'name'          => $this->request->getPost('name'),
            'user_created'  => $this->request->getPost('user_created'),
            'category'      => $this->request->getPost('upcategory'),
            'sub_category'  => $this->request->getPost('upsub_category'),
            'merk'          => $this->request->getPost('merk'),
            'satuan'        => $this->request->getPost('satuan'),
            'sku'           => $this->request->getPost('sku'),
            'supplier'      => $this->request->getPost('upsupplier'),
        ];

        $this->produkModel->update_data($id, $data);
        session()->setFlashData('sukses', 'data has been updated from database.');
        return redirect()->back();
    }
}
