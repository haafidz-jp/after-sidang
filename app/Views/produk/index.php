<?= $this->extend('layout/templates'); ?>

<?= $this->Section('content'); ?>
<div id="layoutSidenav_content">
    <main>
        <div class="container-fluid">
            <h1 class="mt-4"><i class="fas fa-box"></i> Daftar Produk</h1>
            <ol class="breadcrumb mb-4">
                <li class="breadcrumb-item"><a href="<?= base_url('dashboard'); ?>">Dashboard</a></li>
                <li class="breadcrumb-item active"><?= $title; ?></li>
            </ol>
            <div class="card mb-4">
                <div class="card-header">
                    <i class="fas fa-table mr-1"></i>
                    Tabel Daftar Produk
                </div>
                <div class="card-body">
                    <a href="" class="btn btn-primary btn-sm mb-2" data-toggle="modal" data-target="#addModal"><i class="fas fa-plus-square"></i> Tambah Data</a>

                    <?php
                    $errors = session()->getFlashdata('gagal');
                    if (!empty($errors)) : ?>
                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                            <strong><i class="fas fa-times"></i> Gagal</strong> data tidak di tambahkan ke database.
                            <ul>
                                <?php foreach ($errors as $e) { ?>
                                    <li><?= esc($e); ?></li>
                                <?php } ?>
                            </ul>
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                    <?php endif; ?>

                    <?php if (session()->getFlashData('sukses')) : ?>
                        <div class="alert alert-success alert-dismissible fade show" role="alert">
                            <strong><i class="fas fa-check"></i> Sukses</strong> <?= session()->getFlashData('sukses'); ?>
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                    <?php endif; ?>
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>Kode Produk</th>
                                    <th>Nama Produk</th>
                                    <th>Kategori</th>
                                    <th>Sub Kategori</th>
                                    <th>Merk</th>
                                    <th>Stok</th>
                                    <th>Satuan</th>
                                    <th>SKU</th>
                                    <th>Option</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php $no = 1;
                                foreach ($all_data as $datas) : ?>
                                    <tr>
                                        <td width="1%"><?= $no++; ?></td>
                                        <td><?= esc($datas->kode_produk); ?></td>
                                        <td><?= esc($datas->name); ?></td>
                                        <td><?= esc($datas->category_name); ?></td>
                                        <td><?= esc($datas->subcategory_name); ?></td>
                                        <td><?= esc($datas->merk); ?></td>
                                        <td><?= esc($datas->kuantitas); ?></td>
                                        <td><?= esc($datas->satuan); ?></td>
                                        <td><?= esc($datas->sku); ?></td>
                                        <td class="text-center" width="20%">
                                            <a href="" class="btn btn-success btn-sm mb-1" data-toggle="modal" data-target="#updateModal<?= $datas->id_produk; ?>">
                                                Update
                                            </a>
                                            <a href="" class="btn btn-danger btn-sm mb-1" data-toggle="modal" data-target="#deleteModal<?= $datas->id_produk; ?>">
                                                Delete
                                            </a>
                                        </td>
                                    </tr>
                                <?php endforeach; ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <!-- Add modal -->
    <div class="modal fade" id="addModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel"><i class="fas fa-plus-square"></i> Add Data</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <?= form_open('produk/add_data'); ?>
                    <?= csrf_field(); ?>
                    <div class="form-group">
                        <label for="kode_produk">Kode Produk</label>
                        <input type="text" name="kode_produk" value="<?php echo $get_kobar ?>" id="kode_produk" class="form-control" readonly>
                    </div>
                    <div class="form-group">
                        <label for="name">Nama Produk</label>
                        <input type="text" name="name" id="name" class="form-control" placeholder="Masukan Nama Produk" required>
                    </div>
                    <div class="form-group">
                        <input type="hidden" name="user_created" value=" <?php echo user_id(); ?>" id="user_created" class="form-control" readonly>
                    </div>
                    <div class="form-group">
                        <label for="category">Kategori</label>
                        <select name="category" id="category" class="form-control" required>
                            <option value="">No Selected</option>
                            <?php foreach($category as $row):?>
                            <option value="<?php echo $row->category_id;?>">
                            <?php echo $row->category_name;?></option>
                            <?php endforeach;?>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="category">Sub Kategory</label>
                        <select name="sub_category" id="sub_category" class="form-control" >
                            <option value="">- Pilih Sub Kategori -</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="supplier">Supplier</label>
                        <select name="supplier" id="supplier" class="form-control" required>
                            <option value="">No Selected</option>
                            <?php foreach($get_supplier as $row):?>
                            <option value="<?php echo $row->id_supplier;?>">
                            <?php echo $row->namevendor;?></option>
                            <?php endforeach;?>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="merk">Merk</label>
                        <input type="text" name="merk" id="merk" class="form-control" placeholder="Masukan Merk">
                    </div>
                        <input type="hidden" name="kuantitas" id="kuantitas" class="form-control" value="0">
                    <div class="form-group">
                        <label for="satuan">Satuan</label>
                        <select name="satuan" id="satuan" class="form-control" required>
                            <option value="">- Pilih Satuan -</option>
                            <option value="PAK">PAK</option>
                            <option value="PCS">PCS</option>
                            <option value="DUS">DUS</option>
                            <option value="RIM">RIM</option>
                            <option value="ROLL">ROLL</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="sku">SKU</label>
                        <input type="text" name="sku" id="sku" class="form-control" placeholder="12 Digit Kode di belakang kemasan Produk">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary btn-sm">Submit</button>
                    </div>
                    <?= form_close(); ?>
                </div>
            </div>
        </div>
    </div>

    <!-- Update modal -->
    <?php foreach ($all_data as $datas) : ?>
        <div class="modal fade" id="updateModal<?= $datas->id_produk; ?>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel"><i class="fas fa-edit"></i> Update Data</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <?= form_open('produk/update_data/' . $datas->id_produk); ?>
                        <?= csrf_field(); ?>
                        <input type="hidden" name="id" value="<?= $datas->id_produk; ?>">
                        <input type="hidden" name="user_created" value="<?= $datas->user_created; ?>" id="user_created" class="form-control" readonly>
                        <div class="form-group">
                            <label for="kode_produk">Kode Produk</label>
                            <input type="text" name="kode_produk" id="kode_produk" class="form-control" value="<?= $datas->kode_produk; ?>" readonly>
                        </div>
                        <div class="form-group">
                            <label for="name">Nama Produk</label>
                            <input type="text" name="name" id="name" class="form-control" value="<?= $datas->name; ?>">
                        </div>
                        <div class="form-group">
                            <label for="upcategory">Kategori</label> <br>
                            <select name="upcategory" id="upcategory" class="form-control">
                                <option value="">- Pilih Kategori -</option>
                                <?php foreach($category as $row):?>
                                <?php if($row->category_id == $datas->category):?>
                                <option value="<?php echo $row->category_id;?>" selected>
                                    <?php else: ?>
                                        <option value="<?php echo $row->category_id;?>">
                                    <?php endif;?>
                                <?php echo $row->category_name;?></option>
                                <?php endforeach;?>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="upsub_category">Sub Kategori</label> <br>
                            <select name="upsub_category" id="upsub_category" class="form-control">
                                <option value="">- Pilih Sub Kategori -</option>
                                <?php foreach($sub_category as $row):?>
                                <?php if($row->subcategory_id == $datas->sub_category):?>
                                <option value="<?php echo $row->subcategory_id;?>" selected>
                                    <?php else: ?>
                                        <option value="<?php echo $row->subcategory_id;?>">
                                    <?php endif;?>
                                <?php echo $row->subcategory_name;?></option>
                                <?php endforeach;?>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="upsupplier">Supplier</label> <br>
                            <select name="upsupplier" id="upsupplier" class="form-control" required>
                                <option value="">- Pilih Supplier -</option>
                                <?php foreach($get_supplier as $row):?>
                                <?php if($row->id_supplier == $datas->supplier):?>
                                <option value="<?php echo $row->id_supplier;?>" selected>
                                    <?php else: ?>
                                        <option value="<?php echo $row->id_supplier;?>">
                                    <?php endif;?>
                                <?php echo $row->namevendor;?></option>
                                <?php endforeach;?>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="merk">Merk</label>
                            <input type="text" name="merk" id="merk" class="form-control" value="<?= $datas->merk; ?>">
                        </div>
                        <div class="form-group">
                            <label for="satuan">Satuan</label>
                            <select name="satuan" id="satuan" class="form-control">
                                <?php if ($sat = $datas->satuan ?? $datas->satuan) : ?>
                                    <option value="">- Select -</option>
                                    <option value="PAK" <?= $sat == 'PAK' ? 'selected' : null ?>>
                                        PAK
                                    </option>
                                    <option value="PCS" <?= $sat == 'PCS' ? 'selected' : null ?>>
                                        PCS
                                    </option>
                                    <option value="DUS" <?= $sat == 'DUS' ? 'selected' : null ?>>
                                        DUS
                                    </option>
                                    <option value="RIM" <?= $sat == 'RIM' ? 'selected' : null ?>>
                                        RIM
                                    </option>
                                    <option value="ROLL" <?= $sat == 'ROLL' ? 'selected' : null ?>>
                                        ROLL
                                    </option>
                                <?php endif; ?>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="sku">SKU</label>
                            <input type="text" name="sku" id="sku" class="form-control" value="<?= $datas->sku; ?>">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary btn-sm">Submit</button>
                        </div>
                        <?= form_close(); ?>
                    </div>
                </div>
            </div>
        </div>
    <?php endforeach; ?>

    <!-- Delete modal -->
    <?php foreach ($all_data as $datas) : ?>
        <div class="modal fade" id="deleteModal<?= $datas->id_produk; ?>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel"><i class="fas fa-exclamation-circle"></i> Delete Data</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <?= form_open('produk/delete_data/' . $datas->id_produk); ?>
                        <?= csrf_field(); ?>
                        <input type="hidden" name="id" value="<?= $datas->id_produk; ?>">
                        <p>Click the Delete button to delete data (<?= $datas->name; ?>)..!!!</p>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                        </div>
                        <?= form_close(); ?>
                    </div>
                </div>
            </div>
        </div>
    <?php endforeach; ?>

    <script type="text/javascript">
        $(document).ready(function(){

            $('#category').change(function(){

                var subcategory_category_id = $("#category").val();

                $.ajax({
                    url : "<?php echo base_url('produk/get_sub_category');?>",
                    method : "POST",
                    data : {subcategory_category_id: subcategory_category_id,},
                    async : true,
                    dataType : 'JSON',
                    success: function(data){
                        var html = '';
                        var i;
                        for(i=0; i<data.length; i++){
                            html += '<option value='+data[i].subcategory_id+'>'+data[i].subcategory_id+ " | " +data[i].subcategory_name+'</option>';
                        }
                        $('#sub_category').html(html);
                    }
                });
                return false;
            });

            $('#upcategory').change(function(){

                var subcategory_category_idd = $("#upcategory").val();
                var selected = $("#upsub_category").val();
                
                console.log(selected);
                $.ajax({
                    url : "<?php echo base_url('produk/get_sub_category');?>",
                    method : "POST",
                    data : {subcategory_category_id: subcategory_category_idd,},
                    async : true,
                    dataType : 'JSON',
                    success: function(data){
                        var html = '';
                        var i;
                            for(i=0; i<data.length; i++){

                                html += '<option value='+data[i].subcategory_id+'>'+data[i].subcategory_id+ " | " +data[i].subcategory_name+'</option>';
                            }

                        $('#upsub_category').html(html);
                    }
                });
                return false;
            });
        });
    </script>

    <?= $this->endSection(); ?>
