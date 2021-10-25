<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

    <title>Cetak Laporan Supplier</title>
</head>

<body>

    <div class="container mt-5">
    <h1 align="center">CV. MULIA JAYA AGUNG</h1>
            <h2 align="center">List Daftar List Supplier</h2>
            <p align="center"><?php echo "Tanggal " . date("d-m-Y"); ?></p> 
            <p align="center">Di Cetak oleh : <?= user()->username; ?></p> 
        <table cellpadding="6" class="table table-bordered table-striped " border="0.2">
                <tr>
                    <th style="padding-left:5px;" valign="middle" width="30" align="center">NO</th>
                    <th >NAMA VENDOR</th>
                    <th >NAMA SALES</th>
                    <th >NOMOR HP</th>
                    <th >EMAIL</th>
                    <th width="135">ALAMAT</th>
                </tr>
                <?php $no = 1; ?>
                <?php foreach ($pdf_produk as $pp) : ?>
                    <tr>
                        <td style="padding-left:5px;" valign="middle" width="30" align="center"><?= $no++; ?></td>
                        <td ><?= $pp['namevendor']; ?></td>
                        <td ><?= $pp['namesales']; ?></td>
                        <td ><?= $pp['phone']; ?></td>
                        <td ><?= $pp['email']; ?></td>
                        <td width="135"><?= $pp['address']; ?></td>
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