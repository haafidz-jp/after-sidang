<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

    <title>Cetak Laporan Produk Stok Masuk</title>
</head>

<body>
    <div class="container mt-5">
    <h1 align="center">List Stok Produk Masuk</h1>
        <table cellpadding="0" class="table table-bordered table-striped " border="0.3">
            <tr>
                <th style="padding-left:5px;" valign="middle" width="30" align="center">NO.</th>
                <th style="padding-left:5px;" width="90">KODE TRANSAKSI</th>
                <th style="padding-left:5px;" width="90">TANGGAL</th>
                <th style="padding-left:5px;" width="90">KODE PRODUK</th>
                <th style="padding-left:5px;" width="90">NAMA PRODUK</th>
                <th style="padding-left:5px;" width="60" align="center">JUMLAH MASUK</th>
                <th style="padding-left:5px;" width="60" align="center">SATUAN</th>
            </tr>
            <?php $no = 1; ?>
            <?php foreach ($pdf_produk as $pp) : ?>
                <tr>
                    <td><?= $no++; ?></td>
                    <td><?= $pp['kode_transaksi']; ?></td>
                    <td><?= $pp['tanggal']; ?></td>
                    <td><?= $pp['kode_produk']; ?></td>
                    <td><?= $pp['name']; ?></td>
                    <td><?= $pp['jumlah_masuk']; ?></td>
                    <td><?= $pp['satuan']; ?></td>
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