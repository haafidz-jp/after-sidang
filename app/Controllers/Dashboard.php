<?php
namespace App\Controllers;

use CodeIgniter\Controller;
use CodeIgniter\HTTP\RequestInterface;
use App\Models\DashboardModel;

class Dashboard extends BaseController
{
    protected $dashboard;

    public function __construct()
    {
        $this->dashboard = new DashboardModel();
    }


    public function index()
    {
        $data = [
            'title' => 'Dashboard',
            'total_produk_card'         => $this->dashboard->total_produk_card(),
            'total_supplier_card'       => $this->dashboard->total_supplier_card(),
            'produk_kurang_card_pak'    => $this->dashboard->produk_kurang_card_pak(),
            'produk_kurang_card_pcs'    => $this->dashboard->produk_kurang_card_pcs(),
            'produk_kurang_pak'         => $this->dashboard->produk_kurang_pak(),
            'produk_kurang_pcs'         => $this->dashboard->produk_kurang_pcs(),
            'produk_lebih_card_pak'     => $this->dashboard->produk_lebih_card_pak(),
            'produk_lebih_card_pcs'     => $this->dashboard->produk_lebih_card_pcs(),
            'produk_lebih_pak'          => $this->dashboard->produk_lebih_pak(),
            'produk_lebih_pcs'          => $this->dashboard->produk_lebih_pcs(),
            
        ];

        return view('dashboard/index', $data);
    }
}
