<?= $this->extend('layout/templates'); ?>

<?= $this->Section('content'); ?>
<div id="layoutSidenav_content">
    <main>
        <div class="container-fluid">
            <h1 class="mt-4"><i class="fas fa-user"></i> Supplier</h1>
            <ol class="breadcrumb mb-4">
                <li class="breadcrumb-item"><a href="<?= base_url('dashboard'); ?>">Dashboard</a></li>
                <li class="breadcrumb-item"><a href="<?= base_url('supplier'); ?>">Supplier</a></li>
                <li class="breadcrumb-item active">Tambah Data</li>
            </ol>
            <div class="card mb-4">
                <div class="card-header">
                    <i class="fas fa-table mr-1"></i>
                    Form Tambah Data Supplier
                </div>
                <div class="card-body">
                    <?php
                    $errors = session()->getFlashdata('gagal');
                    if (!empty($errors)) : ?>
                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                            <strong><i class="fas fa-times"></i> Gagal</strong> data tidak ditambahkan ke dalam database.
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

                    <?php
                    if (isset($validation)) : ?>
                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                            <strong><i class="fas fa-times"></i> Gagal</strong> data tidak ditambahkan ke dalam database.
                            <ul>
                                <?= $validation->listErrors() ?>
                            </ul>
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                    <?php endif; ?>

                    <?= form_open_multipart(); ?>
                    <?= csrf_field(); ?>
                    <input type="hidden" name="user_created" value="<?php echo user_id(); ?>" id="user_created" class="form-control" readonly>
                    <div class="form-group">
                        <label for="name">Nama Vendor</label>
                        <input type="text" name="namevendor" id="namevendor" class="form-control" value="<?= old('namevendor'); ?>">
                    </div>
                    <div class="form-group">
                        <label for="gender">Nama Sales</label>
                        <input type="text" name="namesales" id="namesales" class="form-control" value="<?= old('namesales'); ?>">
                    </div>
                    <div class="form-group">
                        <label for="gender">No Telepon</label>
                        <input type="text" name="phone" id="phone" class="form-control" value="<?= old('phone'); ?>">
                    </div>
                    <div class="form-group">
                        <label for="gender">Alamat Email</label>
                        <input type="text" name="email" id="email" class="form-control" value="<?= old('email'); ?>">
                    </div>
                    <div class="form-group">
                        <label for="address">Alamat</label>
                        <textarea name="address" id="address" cols="30" rows="10" class="form-control"><?= old('address'); ?></textarea>
                    </div>
                    <div class="form-group">
                        <label for="menyediakan">Menyediakan</label>
                        <select name="menyediakan" id="menyediakan" class="form-control" required>
                            <option value="">No Selected</option>
                            <?php foreach($category as $row):?>
                            <option value="<?php echo $row['category_name'];?>">
                            <?php echo $row['category_name'];?></option>
                            <?php endforeach;?>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary btn-sm float-right">Submit</button>
                    <a href="<?= base_url('supplier'); ?>" class="btn btn-secondary btn-sm float-right mr-1">Back</a>
                    <?= form_close(); ?>
                </div>
            </div>
        </div>

        <script type="text/javascript">
            
        </script>
    </main>
    <?= $this->endSection(); ?>