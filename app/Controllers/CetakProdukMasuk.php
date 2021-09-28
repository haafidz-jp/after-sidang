<?php

namespace App\Controllers;

use TCPDF;

class CetakProdukMasuk extends BaseController
{
    protected $db, $builder;

    public function __construct()
    {
        $this->db = \Config\Database::connect();
        helper('form'); 
        // $this->builder = $this->db->table('produk');
        // $this->builder = $this->db->table('produk')
        // ->select('produk_masuk.kode_transaksi,produk_masuk.tanggal,produk_masuk.kode_produk,produk.name,produk_masuk.jumlah_masuk,produk.satuan')
        // ->join('produk_masuk', 'produk.kode_produk = produk_masuk.kode_produk')
        // ->where('produk_masuk.tanggal >=', $this->request->getVar('tanggal_awal'))
        // ->where('produk_masuk.tanggal <=', $this->request->getVar('tanggal_akhir'))
        // ->orderBy('produk_masuk.kode_transaksi ASC');
        // ->get()->getResultObject();
    }

    public function index()
    {
        $data = [
            'title' => 'Cetak Produk Masuk',
        ];
        
        return view('cetak/viewprodukmasuk', $data);
    }

    public function cetaklaporanprodukmasuk()
    {
        $data = [
            'pdf_produk' => $this->db->table('produk')
            ->select('produk_masuk.kode_transaksi,produk_masuk.tanggal,produk_masuk.kode_produk,produk.name,produk_masuk.jumlah_masuk,produk.satuan')
            ->join('produk_masuk', 'produk.kode_produk = produk_masuk.kode_produk')
            ->where('produk_masuk.tanggal >=', $this->request->getVar('tanggal_awal'))
            ->where('produk_masuk.tanggal <=', $this->request->getVar('tanggal_akhir'))
            ->orderBy('produk_masuk.kode_transaksi ASC')->get()->getResultArray(),
        ];

        // $html = view('export/pdf', $data);
        $html = view('cetak/cetakprodukmasuk', $data);

        // create new PDF document
        $pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);


        // set margins
        $pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_RIGHT);
        $pdf->SetFooterMargin(PDF_MARGIN_FOOTER);

        // Add a page
        // This method has several options, check the source code documentation for more information.
        $pdf->AddPage();

        // Print text using writeHTMLCell()
        $pdf->writeHTML($html);
        $this->response->setContentType('application/pdf');
        // Close and output PDF document
        // This method has several options, check the source code documentation for more information.
        $pdf->Output('CetakProdukMasuk.pdf', 'I');
    }
}
