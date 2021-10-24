<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <!-- Custom CSS -->
    <!-- <link href="<?= base_url('assets/css/laporan.css')?>" rel="stylesheet"> -->
    <title>Cetak Laporan Produk</title>
</head>

<body>

    <div class="container">
            <h1 align="center">CV. MULIA JAYA AGUNG</h1>
            <h2 align="center">List Produk</h2>
            <p align="center"><?php echo "Tanggal " . date("d-m-Y"); ?></p> 
            <p align="center">Di Cetak oleh : <?= user()->username; ?></p> 

        <table cellpadding="6" class="table table-bordered table-striped " border="0.2">
                <tr>
                    <th style="padding-left:5px;" valign="middle" width="30" align="center">NO</th>
                    <th valign="middle" width="90">KODE BARANG</th>
                    <th valign="middle" width="90">NAMA PRODUK</th>
                    <th valign="middle" width="60" align="center">STOK</th>
                    <th valign="middle" width="70">SATUAN</th>
                    <th valign="middle" width="80">CEK</th>
                    <th valign="middle" width="80">KET</th>
                </tr>
                <?php $no = 1; ?>
                <?php foreach ($pdf_produk as $pp) : ?>
                    <tr>
                        <td style="padding-left:5px;" valign="middle" width="30" align="center"><?= $no++; ?></td>
                        <td width="90"><?= $pp['kode_produk']; ?></td>
                        <td width="90"><?= $pp['name']; ?></td>
                        <td width="60" align="center"><?= $pp['kuantitas']; ?></td>
                        <td width="70"><?= $pp['satuan']; ?></td>
                        <td width='80'></td>
                        <td width='80'></td>
                    </tr>
                <?php endforeach; ?>
        </table>
    </div>
    <!-- Optional JavaScript; choose one of the two! -->
    <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

</body>

</html>