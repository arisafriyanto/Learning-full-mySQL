<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pencarian Data Tabel MySQL Menggunakan SELECT..REGEXP</title>
</head>
<body>
    <center>
        <h1>Pencarian Data Tabel MySQL Menggunakan SELECT..REGEXP</h1><br><br>

        <table border="1" cellspaccing="0" cellpadding="0" width="50%">
            <tr style="text-align: center">
                <th>No</th>
                <th>Nip</th>
                <th>Nama Dosen</th>
                <th>No Hp</th>
                <th>Alamat</th>
            </tr>

            <?php

                $conn = mysqli_connect("localhost", "root", "", "REGEXP");

                $no = 1;
                $query = mysqli_query($conn, "SELECT * FROM daftar_dosen WHERE nama_dosen REGEXP '^s.*' ");

                while($data = mysqli_fetch_assoc($query)) {
                    
            ?>

                <tr style="text-align: center">
                    <td><?=$no++;?></td>
                    <td><?=$data['nip'];?></td>
                    <td><?=$data['nama_dosen'];?></td>
                    <td><?=$data['no_hp'];?></td>
                    <td><?=$data['alamat'];?></td>
                </tr>

            <?php

                }

            ?>

        </table>

    </center>
</body>
</html>