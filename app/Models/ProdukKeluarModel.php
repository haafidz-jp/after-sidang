<?php

namespace App\Models;

use CodeIgniter\Model;

class ProdukKeluarModel extends Model
{
    protected $db, $builder;

    public function __construct()
    {
        $this->db = \Config\Database::connect();
        $this->builder = $this->db->table('produk_keluar');  
    }

    // membuat kode transaksi
    public function get_kode_transaksi(){
        
		$q = $this->db->query("SELECT MAX(RIGHT(kode_transaksi,6)) AS kd_max FROM produk_keluar");
        $kd = "";
        if($q->getResultObject()>0){
            foreach($q->getResultObject() as $k){
                $tmp = ((int)$k->kd_max)+1;
                $kd = sprintf("%06s", $tmp);
            }
        }else{
            $kd = "000001";
        }
        return "PK".$kd;
	}

    // func select all data or by id
    public function select_data($id = FALSE)
    {
        if ($id == FALSE) {
            return $this->builder->get()->getResultObject();
        }

        return $this->builder->getWhere(['id' => $id])->getRow();
    }

    // func insert data to db
    public function add_data($data)
    {
        $this->builder->insert($data);
    }

    // func delete data from db
    public function delete_data($id)
    {
        $this->builder->where('id', $id);
        $this->builder->delete();
    }

    // func update data from db
    public function update_data($id, $data)
    {
        $this->builder->where('id', $id);
        $this->builder->update($data);
    }
}
