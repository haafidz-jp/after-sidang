<?= $this->extend('layout/templates'); ?>

<?= $this->Section('content'); ?>
<div id="layoutSidenav_content">
    <main>
        <div class="container-fluid">
            <h1 class="mt-4"><i class="fas fa-box"></i> Produk Masuk</h1>
            <ol class="breadcrumb mb-4">
                <li class="breadcrumb-item"><a href="<?= base_url('dashboard'); ?>">Dashboard</a></li>
                <li class="breadcrumb-item active"><?= $title; ?></li>
            </ol>
            <div class="card mb-4">
                <div class="card-header">
                    <i class="fas fa-table mr-1"></i>
                    Tabel Produk Masuk
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
                                    <th>Jumlah Masuk</th>
                                    <th>Satuan</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php $no = 1;
                                foreach ($all_data as $datas) : ?>
                                    <tr>
                                        <td width="1%"><?= $no++; ?></td>
                                        <td width='150'><?= esc($datas->kode_transaksi); ?></td>
                                        <td width='100'><?= esc($datas->tanggal); ?></td>
                                        <td width='150'><?= esc($datas->kode_produk); ?></td>
                                        <td width='300'><?= esc($datas->name); ?></td>
                                        <td><?= esc($datas->jumlah_masuk); ?></td>
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
                    <?= form_open('produk_masuk/add_data'); ?>
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
                        <select name="kode_produk" id="kodeProduk" class="form-control" required>
                        <option value="">- Pilih Produk -</option>
                            <?php foreach($get_produk as $row) { ?>
                                <option value="<?php echo $row->kode_produk;?>">
                                    <?php echo $row->kode_produk;?> |
                                    <?php echo $row->name;?>
                                </option>
                            <?php } 
                            ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="stok">Stok</label>
                        <input type="text" name="" id="stokAwal" class="form-control" readonly>
                    </div>
                    <div class="form-group">
                        <label for="jumlah_masuk">Barang Masuk</label>
                        <input type="number" name="" id="inputMasuk" class="form-control" placeholder="Masukan jumlah barang yang masuk">
                    </div>
                    <div class="form-group">
                        <label for="total_stok">Total Stok</label>
                        <input type="number" name="jumlah_masuk" id="jumlah_masuk" class="form-control" required readonly>
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

    <script type="text/javascript">
    $("#inputMasuk").keyup(function(){
        var a = parseInt($("#stokAwal").val());
        var b = parseInt($("#inputMasuk").val());
        var c = a+b;
        $("#jumlah_masuk").val(c);
    });
    </script>

    <script type="text/javascript">
        $(document).ready(function(){
 
            $('#kodeProduk').change(function(){ 
                var kode_produk = $("#kodeProduk").val();
                $.ajax({
                    url : "<?php echo base_url('produk_masuk/get_stok');?>",
                    method : "POST",
                    data : {kode_produk: kode_produk,},
                    async : true,
                    dataType : 'json',
                    success: function(data){
                        // console.log(data[0].kuantitas);
                        $( "#stokAwal" ).val( data[0].kuantitas ); 
                        // autofill form stok awal when user click pilih barang
                    }
                });
                return false;
            }); 
             
        });
    </script>

<?= $this->endSection(); ?>
