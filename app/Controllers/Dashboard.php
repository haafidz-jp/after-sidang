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
            'total_produk_card' => $this->dashboard->total_produk_card(),
            'total_supplier_card' => $this->dashboard->total_supplier_card(),
            'produk_kurang_card' => $this->dashboard->produk_kurang_card(),
            'produk_kurang' => $this->dashboard->produk_kurang(),
            'produk_lebih_card' => $this->dashboard->produk_lebih_card(),
            'produk_lebih' => $this->dashboard->produk_lebih(),
            
        ];

        return view('dashboard/index', $data);
    }
}
