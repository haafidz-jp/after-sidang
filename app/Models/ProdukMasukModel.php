<?php

namespace App\Models;

use CodeIgniter\Model;

class ProdukMasukModel extends Model
{
    protected $db, $builder;

    public function __construct()
    {
        $this->db = \Config\Database::connect();
        $this->builder = $this->db->table('produk_masuk');  
        $this->builderprod = $this->db->table('produk');  
    }

    // mengambil produk
    public function get_produk() 
    {
        return $this->db->table('produk')->get()->getResultObject();
    }

    // membuat kode transaksi
    public function get_kode_transaksi(){
        
		$q = $this->db->query("SELECT MAX(RIGHT(kode_transaksi,6)) AS kd_max FROM produk_masuk");
        $kd = "";
        if($q->getResultObject()>0){
            foreach($q->getResultObject() as $k){
                $tmp = ((int)$k->kd_max)+1;
                $kd = sprintf("%06s", $tmp);
            }
        }else{
            $kd = "000001";
        }
        return "PM".$kd;
	}

    // func select all data or by id
    public function select_data($id = FALSE)
    {
        if ($id == FALSE) {
            // default // return $this->builder->get()->getResultObject();

            // $query = $this->db->query('SELECT produk_masuk.kode_transaksi, produk_masuk.tanggal, 
            // produk_masuk.kode_produk, produk_masuk.jumlah_masuk, produk.kode_produk, produk.name, 
            // produk.kuantitas, produk.satuan FROM produk_masuk JOIN produk 
            // ON produk_masuk.kode_produk = produk.kode_produk ORDER BY produk_masuk.kode_transaksi ASC');
            // return $query->getResultObject();

            return $this->db->table('produk_masuk')
            ->select('produk_masuk.kode_transaksi,produk_masuk.tanggal,produk_masuk.kode_produk,produk_masuk.jumlah_masuk,produk.kode_produk,produk.name,produk.kuantitas,produk.satuan')
            ->join('produk', 'produk_masuk.kode_produk = produk.kode_produk')
            ->orderBy('produk_masuk.kode_transaksi ASC')
            ->get()->getResultObject();
        }

        return $this->builder->getWhere(['id' => $id])->getRow();
    }

    // func insert data to db
    public function add_data($data)
    {
        $this->builder->insert($data);
    }

    // func update data from db
    public function update_data($id, $data)
    {
        $this->builder->where('id', $id);
        $this->builder->update($data);
    }
}
