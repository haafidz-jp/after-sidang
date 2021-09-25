<?php

namespace App\Controllers;

use App\Models\ProdukMasukModel;

class Produk_Masuk extends BaseController
{
    protected $produkMasukModel;

    public function __construct()
    {
        $this->produkMasukModel = new ProdukMasukModel();   
        helper('form'); 
    }

    public function index()
    {
        $data = [
            'title' => 'Halaman Produk Masuk', // Nama Halaman
            'all_data' => $this->produkMasukModel->select_data(), // selecting all data
            'get_kode_transaksi' => $this->produkMasukModel->get_kode_transaksi(),
            'get_produk' => $this->produkMasukModel->get_produk(),
            
        ];

        return view('produkmasuk/index', $data);
    }

    // mengambil stok berdasarkan pilihan
    public function get_stok()
    {
        $data = $this->db->table('produk')->select('kuantitas')
        ->where('kode_produk', $this->request->getVar('kode_produk'))
        ->get()->getResultObject();

        echo json_encode($data);
    }

    public function add_data()
    {
        // validation
        $rules = $this->validate([
            'kode_transaksi'=> 'required',
            'tanggal'       => 'required',
            'kode_produk'   => 'required',
            'jumlah_masuk'  => 'required',
        ]);

        if (!$rules) {
            session()->setFlashData('failed', \Config\Services::validation()->getErrors());
            return redirect()->back();
        }

        $data = [
            'kode_transaksi'=> $this->request->getPost('kode_transaksi'),
            'tanggal'       => $this->request->getPost('tanggal'),
            'kode_produk'   => $this->request->getPost('kode_produk'),
            'jumlah_masuk'  => $this->request->getPost('jumlah_masuk'),
        ];

        $this->produkMasukModel->add_data($data);

        // update stok 
        $this->db->table('produk')
        ->where('kode_produk', $this->request->getVar('kode_produk'))
            ->set('kuantitas', $this->request->getVar('jumlah_masuk'))
            ->update();

        session()->setFlashData('Sukses', 'data has been added to database.');
        return redirect()->back();
        
    }
}
