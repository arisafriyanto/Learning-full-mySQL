Jika pada query SELECT..LIKE kita menggunakan pola ‘s%’ sebagai kata kunci yang berarti ‘kata yang diawali dengan huruf s dan memiliki banyak huruf 1 atau lebih’ dalam regular expression, penulisannya menjadi ‘^S.*’. Terlihat sedikit rumit, tapi mari kita pelajari aturan penulisan RegExp:

. : tanda titik dalam RegExp berarti sebuah karakter apa saja
[ … ]: tanda kurung siku ini berarti kumpulan karakter. Misalkan [abc] akan cocok dengan ‘a’, ‘b’, atau ‘c’. kita bisa juga menggunakan jangkauan (range), contohnya [a-z] akan cocok dengan seluruh huruf, [0-9] akan cocok dengan seluruh angka.
*: tanda bintang ini akan cocok dengan 0 atau lebih karakter sebelumnya. Misalkan ‘a*’ berarti akan cocok dengan seluruh kata yang mengandung 0 atau lebih a.
^: tanda pangkat atau topi ini menandakan berada di awal kata.
$: tanda dollar ini berarti bahwa pola berada di akhir kata.
Mari kita contohkan penggunakan pola RegExp:

‘ab*’: Pola ini berarti akan cocok dengan seluruh kata yang mengandung a dan diikuti oleh b atau tidak sama sekali. Contohnya: ‘a’, ‘ab’, ‘abbbbbb’, dan juga ‘kebab’, karena untuk RegExp, kita harus menyatakan dimana karakter itu muncul.
‘^ab*’: Pola ini sama artinya dengan ‘ab*’ seperti diatas, namun tanda ^ menyatakan bahwa pola ini harus berada di awal kata, sehingga ‘kebab’ tidak akan cocok.
‘^s..i$’: Pola ini akan cocok dengan seluruh kata yang diawali dengan s, dan diakhiri dengan i, terdiri dari 4 huruf. Contohnya: susi, sapi, dan siti.
Pencarian Data Tabel MySQL Menggunakan SELECT..REGEXP
Format dasar dari query pencarian menggunakan Regular Expression adalah:

SELECT nama_kolom_tampil FROM nama_tabel WHERE nama_kolom_cari REGEXP keyword_reguler_expression
nama_kolom_tampil adalah nama dari kolom yang akan kita tampilkan, bisa semua kolom dalam tabel, atau hanya kolom tertentu saja.
nama_tabel adalah nama tabel dimana nama_kolom_tampil berada.
nama_kolom_cari adalah kolom yang akan kita gunakan untuk pencarian.
keyword_regular_expression adalah kata kunci dalam bentuk regular expression yang digunakan untuk pencarian.