<?php

namespace App\Controllers;

use TCPDF;

class CetakProdukKeluar extends BaseController
{
    protected $db, $builder;

    public function __construct()
    {
        $this->db = \Config\Database::connect();
        helper('form');
    }

    public function index()
    {
        $data = [
            'title' => 'Cetak Produk Keluar',
        ];
        
        return view('cetak/viewprodukkeluar', $data);
    }

    public function cetaklaporanproduk()
    {
        $data = [
            'pdf_produk' => $this->db->table('produk')
            ->select('produk_keluar.kode_transaksi,produk_keluar.tanggal,produk_keluar.kode_produk,produk.name,produk_keluar.jumlah_keluar,produk.satuan')
            ->join('produk_keluar', 'produk.kode_produk = produk_keluar.kode_produk')
            ->where('produk_keluar.tanggal >=', $this->request->getVar('tanggal_awal'))
            ->where('produk_keluar.tanggal <=', $this->request->getVar('tanggal_akhir'))
            ->orderBy('produk_keluar.kode_transaksi ASC')->get()->getResultArray(),
        ];

        // $html = view('export/pdf', $data);
        $html = view('cetak/cetakprodukkeluar', $data);

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
        $pdf->Output('CetakProdukKeluar.pdf', 'I');
    }
}
