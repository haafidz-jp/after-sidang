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
    // ambil sub-kategori
    // public function get_sub_category($category_id){
		
    //     // return $this->db->getWhere('sub_category', array('subcategory_category_id' => $category_id))->getRow();
    //     // return $this->builder->getWhere(['subcategory_category_id' => $category_id])->getResultObject();
    //     // return $this->db->table('sub_category')->getWhere(array('subcategory_category_id' => $category_id))->getResultObject();

	// }

    // ambil kode produk
    // public function get_kode_produk()
    // {
    //     return $this->db->table('produk')
    //     ->selectMax('kode_produk', 'max_code')
    //     ->get();
    // }

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
            // return $this->builder->get()->getResultObject();
            $query = $this->db->query('SELECT produk.id, produk.kode_produk, produk.name, produk.category, 
            produk.sub_category, produk.merk, produk.kuantitas, produk.satuan, produk.sku , category.category_name, 
            sub_category.subcategory_name FROM produk JOIN category ON produk.category = category.category_id JOIN sub_category 
            ON produk.sub_category = sub_category.subcategory_id ORDER BY produk.kode_produk ASC');

            return $query->getResultObject();
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
