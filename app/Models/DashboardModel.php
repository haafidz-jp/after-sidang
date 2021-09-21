<?php

namespace App\Models;

use CodeIgniter\Model;

class DashboardModel extends Model
{

    public function __construct()
    {
        $this->db = \Config\Database::connect();
        $this->builder = $this->db->table('produk');  
    }

    // fungsi SELECT * FROM produk WHERE quantity < 10;
    public function produk_kurang_card()
    {
        return $this->db->query('SELECT * FROM produk WHERE kuantitas < 10') ->getNumRows();
    }

    // fungsi SELECT * FROM produk WHERE quantity < 10;
    public function produk_kurang()
    {
        return $this->builder->getWhere(['kuantitas <' => 10])->getResultObject();
    }

    // fungsi SELECT * FROM produk WHERE quantity > 50;
    public function produk_lebih_card()
    {
        return $this->db->query('SELECT * FROM produk WHERE kuantitas > 50') ->getNumRows();

    }

    // fungsi SELECT * FROM produk WHERE quantity > 50;
    public function produk_lebih()
    {
        return $this->builder->getWhere(['kuantitas >' => 50])->getResultObject();

    }

    // return INT
    public function total_produk_card()
    {
        return $this->db->table('produk')->countAll();
    }

    // return INT
    public function total_supplier_card()
    {
        return $this->db->table('supplier')->countAll();
    }
}