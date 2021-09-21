<?php

namespace App\Controllers;

use App\Models\ProdukKeluarModel;

class Produk_Keluar extends BaseController
{
    protected $produkKeluarModel;

    public function __construct()
    {
        $this->produkKeluarModel = new ProdukKeluarModel();   
        helper('form'); 
    }

    public function index()
    {
        $data = [
            'title' => 'Halaman Produk Keluar', // Nama Halaman
            'all_data' => $this->produkKeluarModel->select_data(), // selecting all data
            'get_kode_transaksi' => $this->produkKeluarModel->get_kode_transaksi(),
            
        ];

        return view('produkkeluar/index', $data);
    }

    public function add_data()
    {
        // validation
        $rules = $this->validate([
            'kode_transaksi'=> 'required',
            'tanggal'       => 'required',
            'kode_produk'   => 'required',
            'name'          => 'required',
            'jumlah_keluar'  => 'required',
        ]);

        if (!$rules) {
            session()->setFlashData('failed', \Config\Services::validation()->getErrors());
            return redirect()->back();
        }

        $data = [
            'kode_transaksi'=> $this->request->getPost('kode_transaksi'),
            'tanggal'       => $this->request->getPost('tanggal'),
            'kode_produk'   => $this->request->getPost('kode_produk'),
            'name'          => $this->request->getPost('name'),
            'jumlah_keluar' => $this->request->getPost('jumlah_keluar'),
        ];

        $this->produkModel->add_data($data);
        session()->setFlashData('success', 'data has been added to database.');
        return redirect()->back();
    }
}
