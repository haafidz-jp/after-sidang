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
            // 'get_stok' => $this->produkMasukModel->get_stok(),
            
        ];

        return view('produkmasuk/index', $data);
    }

    // mengambil stok berdasarkan pilihan
    public function get_stok()
    {
        // metode RAW Query
        // $query = $this->db->query('SELECT kuantitas FROM produk WHERE kode_produk = "PR000001"');
        // return $query->getRow();
        
        // $this->db = \Config\Database::connect();
        // return $this->db->table('produk')->get()->getResultObject();

        // WORKS
        // $data = $this->produkMasukModel->get_stok("PR000001");
        // echo json_encode($data);

        // echo 'route tersambung';

        // coba coba builder
        // $data = $this->db->table('produk')
        // ->where('kode_produk', $this->request->getVar('kode_produk'))
        // ->get()->getResultObject();
        // findAll();
        // echo json_encode($data);

        // coba coba (2)
        // return $this->db->table('produk')
        // ->select('kuantitas')
        // ->where(array('kode_produk' => 'PR000001'))
        // ->get()->getResultObject();

        $data = $this->db->table('produk')->select('kuantitas, kode_produk, name')
        ->where('kode_produk', $this->request->getVar('kode_produk'))
        ->get()->getResultObject();
        // ->get()->getResultObject();
        // findAll();
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
        session()->setFlashData('success', 'data has been added to database.');
        return redirect()->back();
    }
}
