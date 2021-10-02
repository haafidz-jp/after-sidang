<?php

namespace App\Models;

use CodeIgniter\Model;

class ProdukModel extends Model
{
    protected $db, $builder;

    public function __construct()
    {
        $this->db = \Config\Database::connect();
        $this->builder = $this->db->table('produk');  
    }

    // ambil kategori
    public function get_category() 
    {
        return $this->db->table('category')->get()->getResultObject();
    }
    
    // ambil sub kategori
    public function get_subcategory() 
    {
        return $this->db->table('sub_category')->get()->getResultObject();
    }

    // ambil kode barang
    public function get_kobar(){
        
		$q = $this->db->query("SELECT MAX(RIGHT(kode_produk,6)) AS kd_max FROM produk");
        $kd = "";
        if($q->getResultObject()>0){
            foreach($q->getResultObject() as $k){
                $tmp = ((int)$k->kd_max)+1;
                $kd = sprintf("%06s", $tmp);
            }
        }else{
            $kd = "000001";
        }
        return "PR".$kd;
	}

    // func select all data or by id
    public function select_data($id = FALSE)
    {
        if ($id == FALSE) {
            // default // return $this->builder->get()->getResultObject();

            // $query = $this->db->query('SELECT produk.id, produk.kode_produk, produk.name, produk.category, 
            // produk.sub_category, produk.merk, produk.kuantitas, produk.satuan, produk.sku , category.category_name, 
            // sub_category.subcategory_name FROM produk JOIN category ON produk.category = category.category_id JOIN sub_category 
            // ON produk.sub_category = sub_category.subcategory_id ORDER BY produk.kode_produk ASC');
            // return $query->getResultObject();

            return $this->db->table('produk')
            ->select('produk.id,produk.kode_produk,produk.name,produk.category,produk.sub_category,produk.merk,produk.kuantitas,produk.satuan,produk.sku,category.category_name,sub_category.subcategory_name')
            ->join('category', 'produk.category = category.category_id')
            ->join('sub_category', 'produk.sub_category = sub_category.subcategory_id')
            ->orderBy('produk.kode_produk ASC')
            ->get()->getResultObject();
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
