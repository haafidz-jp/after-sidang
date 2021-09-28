<?php

namespace App\Controllers;

use TCPDF;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class Export extends BaseController
{
    protected $db, $builder;

    public function __construct()
    {
        $this->db = \Config\Database::connect();
        $this->builder = $this->db->table('produk');
    }

    public function export_pdf()
    {
        $data = [
            'pdf_produk' => $this->builder->get()->getResultArray()
        ];

        // $html = view('export/pdf', $data);
        $html = view('cetak/stok', $data);

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
        $pdf->Output('produk.pdf', 'I');
    }

    public function export_excel()
    {
        $produk = $this->builder->get()->getResultArray();

        $spreadsheet = new Spreadsheet();
        // tulis header/nama kolom 
        $spreadsheet->setActiveSheetIndex(0)
            ->setCellValue('A1', 'No')
            ->setCellValue('B1', 'Name')
            ->setCellValue('C1', 'Category')
            ->setCellValue('D1', 'Quantity')
            ->setCellValue('E1', 'SKU');

        $column = 2;
        // tulis data ke cell
        $no = 1;
        foreach ($produk as $data) {
            $spreadsheet->setActiveSheetIndex(0)
                ->setCellValue('A' . $column, $no++)
                ->setCellValue('B' . $column, $data['name'])
                ->setCellValue('C' . $column, $data['category'])
                ->setCellValue('D' . $column, $data['quantity'])
                ->setCellValue('E' . $column, $data['sku']);
            $column++;
        }
        // tulis dalam format .xlsx
        $writer = new Xlsx($spreadsheet);
        $fileName = 'Produk_Data';

        // Redirect hasil generate xlsx ke web client
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment;filename=' . $fileName . '.xlsx');
        header('Cache-Control: max-age=0');

        $writer->save('php://output');
    }
}
