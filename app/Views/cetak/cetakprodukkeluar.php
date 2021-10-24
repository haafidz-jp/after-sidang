<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

    <title>Cetak Laporan Produk Stok Keluar</title>
</head>

<body>
    <div class="container">
        <h1 align="center">CV. MULIA JAYA AGUNG</h1>
        <h3 align="center">List Stok Produk keluar</h3>

        <?php  
        if ($tanggal_awal==$tanggal_akhir) { ?>
            <div align="center">
                Tanggal <?php echo $tanggal_awal;; ?>
            </div>
        <?php
        } else { ?>
            <div align="center">
                Tanggal <?php echo $tanggal_awal; ?> s.d. <?php echo $tanggal_akhir; ?>
            </div>
        <?php
        }
        ?>
        <p align="center">Di cetak oleh : <?= user()->username; ?></p>
        
        <table cellpadding="0" class="table table-bordered table-striped " border="0.3">
        <tr>
                <th style="padding:auto;" valign="middle" width="30" align="center">NO.</th>
                <th style="padding:auto;" width="90" align="center">KODE TRANSAKSI</th>
                <th style="padding:auto;" width="90" align="center">TANGGAL</th>
                <th style="padding:auto;" width="70" align="center">KODE PRODUK</th>
                <th style="padding:auto;" width="70" align="center">NAMA PRODUK</th>
                <th style="padding:auto;" width="60" align="center">JUMLAH KELUAR</th>
                <th style="padding:auto;" width="60" align="center" valign="middle">SATUAN</th>
                <th style="padding:auto;" width="60" align="center" valign="middle">SISA STOK</th>
            </tr>
            <?php $no = 1; ?>
            <?php foreach ($pdf_produk as $pp) : ?>
                <tr>
                    <td align="center"><?= $no++; ?></td>
                    <td align="center"><?= $pp['kode_transaksi']; ?></td>
                    <td align="center"><?= $pp['tanggal']; ?></td>
                    <td align="center"><?= $pp['kode_produk']; ?></td>
                    <td align="center"><?= $pp['name']; ?></td>
                    <td align="center"><?= $pp['jumlah_keluar']; ?></td>
                    <td align="center"><?= $pp['satuan']; ?></td>
                    <td align="center"><?= $pp['kuantitas']; ?></td>
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