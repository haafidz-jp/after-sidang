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
            'title'                 => 'Stok Keluar', // Nama Halaman
            'all_data'              => $this->produkKeluarModel->select_data(), // selecting all data
            'get_kode_transaksi'    => $this->produkKeluarModel->get_kode_transaksi(),
            'get_produk'            => $this->produkKeluarModel->get_produk(),
            
        ];

        return view('produkkeluar/index', $data);
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
            'jumlah_keluar' => 'required',
            'user_created'  => 'required',
        ]);

        if (!$rules) {
            session()->setFlashData('gagal', \Config\Services::validation()->getErrors());
            return redirect()->back();
        }

        $data = [
            'kode_transaksi'=> $this->request->getPost('kode_transaksi'),
            'tanggal'       => $this->request->getPost('tanggal'),
            'kode_produk'   => $this->request->getPost('kode_produk'),
            'jumlah_keluar' => $this->request->getPost('jumlah_keluar'),
            'user_created'  => $this->request->getPost('user_created'),
        ];

        $this->produkKeluarModel->add_data($data);

        // update stok 
        $this->db->table('produk')
        ->where('kode_produk', $this->request->getVar('kode_produk'))
            ->set('kuantitas', $this->request->getVar('total_stok'))
            ->update();

        session()->setFlashData('sukses', 'data tersimpan pada database.');
        return redirect()->back();
        
    }
}
