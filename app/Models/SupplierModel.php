<?php

namespace App\Models;

use CodeIgniter\Model;

class SupplierModel extends Model
{
    protected $table         = 'supplier';
    protected $primaryKey    = 'id';
    protected $returnType    = 'array';
    protected $allowedFields = ['namevendor', 'namesales', 'phone', 'email', 'address','menyediakan', 'user_created'];
    protected $useTimestamps = true;
    protected $createdField  = 'created_at';
    protected $updatedField  = 'updated_at';

    public function get_category() 
    {
        return $this->db->table('category')->get()->getResultArray();
    }
}