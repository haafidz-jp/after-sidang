<?= $this->extend('layout/templates'); ?>

<?= $this->Section('content'); ?>
<div id="layoutSidenav_content">
    <main>
        <div class="container-fluid">
            <h1 class="mt-4"><i class="fas fa-box"></i> Produk Keluar</h1>
            <ol class="breadcrumb mb-4">
                <li class="breadcrumb-item"><a href="<?= base_url('dashboard'); ?>">Dashboard</a></li>
                <li class="breadcrumb-item active"><?= $title; ?></li>
            </ol>
            <div class="card mb-4">
                <div class="card-header">
                    <i class="fas fa-table mr-1"></i>
                    Tabel Produk Keluar
                </div>
                <div class="card-body">
                    <a href="" class="btn btn-primary btn-sm mb-2" data-toggle="modal" data-target="#addModal"><i class="fas fa-plus-square"></i> Tambah Data</a>
                    <a href=<?= base_url('export-pdf'); ?> class="btn btn-primary btn-sm mb-2 fa fa-file-pdf"> Cetak Laporan </a>
                    <!--<a href=<?= base_url('export-excel'); ?> class="btn btn-primary btn-sm mb-2 fa fa-file-excel"> Export Excel</a>-->


                    <?php
                    $errors = session()->getFlashdata('Failed');
                    if (!empty($errors)) : ?>
                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                            <strong><i class="fas fa-times"></i> Failed</strong> data not added to database.
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

                    <?php if (session()->getFlashData('success')) : ?>
                        <div class="alert alert-success alert-dismissible fade show" role="alert">
                            <strong><i class="fas fa-check"></i> Sukses</strong> <?= session()->getFlashData('success'); ?>
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
                                    <th>Kode Transaksi</th>
                                    <th>Tanggal</th>
                                    <th>Kode Produk</th>
                                    <th>Nama Produk</th>
                                    <th>Jumlah Keluar</th>
                                    <th>Satuan</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php $no = 1;
                                foreach ($all_data as $datas) : ?>
                                    <tr>
                                        <td width="1%"><?= $no++; ?></td>
                                        <td><?= esc($datas->kode_transaksi); ?></td>
                                        <td><?= esc($datas->tanggal); ?></td>
                                        <td><?= esc($datas->kode_produk); ?></td>
                                        <td><?= esc($datas->nama_produk); ?></td>
                                        <td><?= esc($datas->jumlah_keluar); ?></td>
                                        <td><?= esc($datas->satuan); ?></td>
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
                    <h5 class="modal-title" id="exampleModalLabel"><i class="fas fa-plus-square"></i> Tambah Data</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <?= form_open('produk_keluar/add_data'); ?>
                    <?= csrf_field(); ?>
                    <div class="form-group">
                        <label for="kode_transaksi">Kode Transaksi</label>
                        <input type="text" name="kode_transaksi" value="<?php echo $get_kode_transaksi ?>" id="kode_transaksi" class="form-control" readonly required>
                    </div>
                    <div class="form-group">
                        <label for="tanggal">Tanggal</label>
                        <input type="date" name="tanggal" id="tanggal" class="form-control" placeholder="Pilih Tanggal" required>
                    </div>
                    <div class="form-group">
                        <label for="name">Nama Produk</label>
                        <input type="text" name="name" id="name" class="form-control" placeholder="Masukan Nama Produk" required>
                    </div>
                    <div class="form-group">
                        <label for="stok">Stok</label>
                        <input type="text" name="stok" id="stok" class="form-control" required readonly>
                    </div>
                    <div class="form-group">
                        <label for="jumlah_keluar">Jumlah Keluar</label>
                        <input type="text" name="jumlah_keluar" id="jumlah_keluar" class="form-control" placeholder="Masukan jumlah barang yang masuk">
                    </div>
                    <div class="form-group">
                        <label for="total_stok">Total Stok</label>
                        <input type="text" name="total_stok" id="total_stok" class="form-control" required readonly>
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

<?= $this->endSection(); ?>
