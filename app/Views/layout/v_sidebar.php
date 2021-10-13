<!-- Sidebar -->
<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

    <!-- Sidebar - Brand -->
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="<?= base_url ('/dashboard')?>">
        <div class="sidebar-brand-icon ">
            <i class="fas fa-warehouse"></i>
        </div>
        <div class="sidebar-brand-text mx-3">Inven <sup>tory</sup></div>
    </a>

    <!-- Divider -->
    <hr class="sidebar-divider my-0">

    <!-- Nav Item - Dashboard -->
    <li class="nav-item"> 
        <a class="nav-link" href="<?= base_url ('/dashboard')?>">
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>Dashboard</span></a>
    </li>

    <!-- Divider -->
    <hr class="sidebar-divider">

    <!-- Heading -->
    <div class="sidebar-heading">
        Data Produk
    </div>

    <!-- Nav Item - Daftar Produk -->
    <li class="nav-item">
        <a class="nav-link" href="<?= base_url('/produk')?>">
        <i class="fas fa-fw fa-list"></i>
        <span>Daftar Produk</span></a>
    </li>

    <!-- Divider -->
    <hr class="sidebar-divider">

    <!-- Heading -->
    <div class="sidebar-heading">
        Aktivitas Stok
    </div>


    <!-- Nav Item - Stok Masuk -->
    <li class="nav-item">
        <a class="nav-link" href="<?= base_url('/produk_masuk')?>">
        <i class="fas fa-fw fa-box"></i>
        <span>Stok Masuk</span></a>
    </li>

    <!-- Nav Item - Stok Keluar -->
    <li class="nav-item">
        <a class="nav-link" href="<?= base_url('/produk_keluar')?>">
        <i class="fas fa-fw fa-box"></i>
        <span>Stok Keluar</span></a>
    </li>

    <?php if(in_groups('admin')) :?>
    <!-- Divider -->
    <hr class="sidebar-divider">

    <!-- Heading -->
    <div class="sidebar-heading">
        Data Supplier
    </div>
    
    <!-- Nav Item - Daftar Supplier -->
    <li class="nav-item">
        <a class="nav-link" href="<?= base_url('/supplier')?>">
        <i class="fas fa-fw fa-user"></i>
        <span>Daftar Supplier</span></a>
    </li>
    <?php endif; ?>
    
    <!-- Divider -->
    <hr class="sidebar-divider d-none d-md-block">
    
    <!-- Heading -->
    <div class="sidebar-heading">
        Laporan
    </div>

    <!-- Nav Item - Export Collapse Menu -->
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseExport"
            aria-expanded="true" aria-controls="collapseExport">
            <i class="fas fa-fw fa-file"></i>
            <span>Cetak Laporan</span>
        </a>
        <div id="collapseExport" class="collapse" aria-labelledby="headingExport" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <!-- <h6 class="collapse-header">Custom Utilities:</h6> -->
                <a class="collapse-item" href=<?= base_url('/cetakproduk'); ?>> <i class="fas fa-fw fa-file-pdf"></i> Daftar Produk</a>
                <a class="collapse-item" href=<?= base_url('/cetakmasuk'); ?>> <i class="fas fa-fw fa-file-pdf"></i> Stok Masuk</a>
                <a class="collapse-item" href=<?= base_url('/cetakkeluar'); ?>> <i class="fas fa-fw fa-file-pdf"></i> Stok Keluar</a>
                <?php if(in_groups('admin')) :?>
                <a class="collapse-item" href=<?= base_url('/cetaksupplier'); ?>> <i class="fas fa-fw fa-file-pdf"></i> Daftar Supplier</a>
                <?php endif; ?>
            </div>
        </div>
    </li>

    <!-- Divider -->
    <hr class="sidebar-divider d-none d-md-block">

    

    <!-- Sidebar Toggler (Sidebar) -->
    <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
    </div>

</ul>
<!-- End of Sidebar -->