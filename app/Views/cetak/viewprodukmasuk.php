<?= $this->extend('layout/templates'); ?>

<?= $this->Section('content'); ?>
<div class="w-100 h-75">

    <h2 class="ml-5">
        <i class="fa fa-file mr-2"></i>    
        Laporan Data Produk Masuk</h2>
    <div class="d-flex flex-column mt-4 bg-white p-3">
        <?= form_open('CetakProdukMasuk/cetaklaporanprodukmasuk'); ?>
        <?= csrf_field(); ?>
        <div class="form-group d-inline-flex">
            <label for="tanggal" class="ml-5">Tanggal</label>
            <input type="date" name="tanggal_awal" class="form-control col-6 ml-5" id="tanggal_awal">
            <label for="sd" class="ml-5">s.d.</label>
            <input type="date" name="tanggal_akhir" class="form-control col-6 ml-5" id="tanggal_akhir">
        </div>
        <div class="form-group d-inline-flex">
        </div>	

        <div class="box-footer">
            <div class="form-group">
                <div class=" ml-5">
                <button type="submit" class="btn btn-primary btn-social btn-submit">
                    <i class="fa fa-print"></i> Cetak
                </button>
                </div>
            </div>
        </div>
        <?= form_close(); ?>
    </div>
</div>

<?= $this->endSection(); ?>