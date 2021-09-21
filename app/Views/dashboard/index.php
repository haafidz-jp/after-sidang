<?= $this->extend('layout/templates'); ?>

<?= $this->Section('content'); ?>

<!-- Begin Page Content -->
<div class="container-fluid">

<!-- Page Heading -->
<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
    <!-- <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
        <i class="fas fa-download fa-sm text-white-50"></i> Generate Report</a> -->
</div>

<!-- Content Row -->
<div class="row">

    <!-- CARD Jumlah Produk -->
    <?php ?>
    <div class="col-xl-6 col-md-6 mb-4">
        <div class="card border-left-primary shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                            Jumlah Barang</div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800"><?= $total_produk_card ?> </div>
                    </div>
                    <div class="col-auto">
                        <i class="fas fa-box fa-2x text-gray-300"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- CARD Jumlah Supplier -->
    <div class="col-xl-6 col-md-6 mb-4">
        <div class="card border-left-success shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                            Jumlah Supplier</div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800"><?= $total_supplier_card ?></div>
                    </div>
                    <div class="col-auto">
                        <i class="fas fa-user fa-2x text-gray-300"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- CARD Jumlah Supplier -->
    <div class="col-xl-6 col-md-6 mb-4">
        <div class="card border-left-danger shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-danger text-uppercase mb-1">
                            Jumlah Barang Yang Hampir Habis!</div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800"><?= $produk_kurang_card ?></div>
                    </div>
                    <div class="col-auto">
                        <i class="fas fa-box-open fa-2x text-gray-300"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- CARD Jumlah Supplier -->
    <div class="col-xl-6 col-md-6 mb-4">
        <div class="card border-left-success shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                            Jumlah Barang Yang Sudah Banyak!</div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800"><?= $produk_lebih_card ?></div>
                    </div>
                    <div class="col-auto">
                        <i class="fas fa-box-open fa-2x text-gray-300"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

    <!-- Content Row -->

    <div class="row">

        <!-- Area STOK KURANG -->
        <div class="col-xl-12 col-lg-12">
            <div class="card shadow mb-4">
                <div
                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                    <h6 class="m-0 font-weight-bold text-danger">List Stok Barang < 10</h6>                
                </div>
                <!-- Card Body -> stok < 10 -->
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered display" id="dataTableKurang" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>Name</th>
                                    <th>Kategori</th>
                                    <th>Kuantitas</th>
                                    <th>SKU</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php $no = 1;
                                foreach ($produk_kurang as $datas) : ?>
                                    <tr>
                                        <td width="1%"><?= $no++; ?></td>
                                        <td><?= esc($datas->name); ?></td>
                                        <td><?= esc($datas->category); ?></td>
                                        <td><?= esc($datas->kuantitas); ?></td>
                                        <td><?= esc($datas->sku); ?></td>
                                    </tr>
                                <?php endforeach; ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <!-- AREA STOK LEBIH -->
        <div class="col-xl-12 col-lg-12">
            <div class="card shadow mb-4">
                <div
                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                    <h6 class="m-0 font-weight-bold text-success">List Stok Barang > 50</h6>                
                </div>
                <!-- Card Body -> stok > 50 -->
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered display" id="dataTableLebih" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>Name</th>
                                    <th>Kategori</th>
                                    <th>Kuantitas</th>
                                    <th>SKU</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php $no = 1;
                                foreach ($produk_lebih as $datas) : ?>
                                    <tr>
                                        <td width="1%"><?= $no++; ?></td>
                                        <td><?= esc($datas->name); ?></td>
                                        <td><?= esc($datas->category); ?></td>
                                        <td><?= esc($datas->kuantitas); ?></td>
                                        <td><?= esc($datas->sku); ?></td>
                                    </tr>
                                <?php endforeach; ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>


<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->



<?= $this->endSection(); ?>