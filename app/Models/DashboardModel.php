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


    //  CARD
    // fungsi SELECT * FROM produk WHERE quantity < 10; 
    public function produk_kurang_card_pak()
    {
        // return $this->db->query('SELECT * FROM produk WHERE kuantitas < 10 AND satuan = "PAK" ') ->getNumRows();
        return $this->builder->getWhere(['kuantitas <' => 10,'satuan' => 'PAK']) ->getNumRows();
    }
    
    // fungsi SELECT * FROM produk WHERE quantity < 10; 
    public function produk_kurang_card_pcs()
    {
        // return $this->db->query('SELECT * FROM produk WHERE kuantitas < 10 AND satuan = "PCS" ') ->getNumRows();
        return $this->builder->getWhere(['kuantitas <' => 10,'satuan' => 'PCS']) ->getNumRows();
    }

    // fungsi SELECT * FROM produk WHERE quantity > 50 AND satuan = 'PAK';
    public function produk_lebih_card_pak()
    {
        return $this->builder->getWhere(['kuantitas >' => 50,'satuan' => 'PAK']) ->getNumRows();
    }
    
    // fungsi SELECT * FROM produk WHERE quantity > 50 AND satuan = 'PCS';
    public function produk_lebih_card_pcs()
    {
        return $this->builder->getWhere(['kuantitas >' => 50,'satuan' => 'PCS']) ->getNumRows();
    }


    // TABEL KURANG
    // fungsi SELECT * FROM produk WHERE quantity < 10 AND satuan ='PAK';
    public function produk_kurang_pak()
    {
        return $this->builder->getWhere(['kuantitas <' => 10,'satuan' => 'PAK'])->getResultObject();
    }

    // fungsi SELECT * FROM produk WHERE quantity < 10 AND satuan ='PCS';
    public function produk_kurang_pcs()
    {
        return $this->builder->getWhere(['kuantitas <' => 10,'satuan' => 'PCS'])->getResultObject();
    }

    // TABEL LEBIH
    // fungsi SELECT * FROM produk WHERE quantity > 20 AND satuan ='PAK';
    public function produk_lebih_pak()
    {
        return $this->builder->getWhere(['kuantitas >' => 20,'satuan' => 'PAK'])->getResultObject();
    }
    
    // fungsi SELECT * FROM produk WHERE quantity > 20 AND satuan ='PCS';
    public function produk_lebih_pcs()
    {
        return $this->builder->getWhere(['kuantitas >' => 20,'satuan' => 'PCS'])->getResultObject();
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