# Proyek Akhir Semester PBP

Aplikasi Terkait Pandemi Covid-19

## Nama-nama anggota kelompok

- Dionisius Mikael Sutanto
- Dimas Tri Kurniawan
- Prinata Rakha Santoso
- Qosim Ariqoh Daffa
- Muhammad Rafif Priyo Waskito
- Rheina Elvaretta
- Amelia Putri Fadillah

## Link APK

https://drive.google.com/drive/folders/1bJe39DFnY7xZdq4JjjIVByT53N1Q3UT2?usp=sharing

## Modul dan Web Service

- lokasi ruang ICU/kamar yg available di RS, setidaknya jabodetabek (Qosim)
    - daftar lokasi rumah sakit ditampilkan berupa card, datanya diambil dari Django
    - penambahan data rumah sakit melalui form
- lokasi tempat vaksin, setidaknya jabodetabek (Rakha)
    - tempat vaksin ditampilkan dalam bentuk card, datanya diambil menggunakan web service dari Django
    - penambahan data menggunakan web service dengan mengirimkan data input user ke Django.
- lokasi tempat oksigen, setidaknya di jabodetabek (Dimas)
    - lokasi penjualan oksigen ditampilkan dalam bentuk card, datanya diambil menggunakan web service melalui httpresponse yang diconvert ke sebuah object
    - input data dapat dilakukan melalui form yang telah disediakan 
- beranda (Amelia)
	- beranda menampilkan akan menampilkan:
		- teks paragraf informasi covid dan vaksinasi covid
		- gambar ajakan vaksinasi
		- tabel penambahan kasus covid bulanan datanya diambil menggunakan web service dari Django
		- chart statistik vaksinasi
		- ditampilkan dalam bentuk card, 
    - penambahan data kasus covid bulanan menggunakan web service dengan mengirimkan data input user ke Django.
- pengalaman pasien (Rheina)
    - Menampilkan pesan-pesan (cerita, pengalaman, atau kalimat penyemangat) yang disubmit dalam bentuk card
    - Data akan diambil dan ditambahkan menggunakan webservice dari Django 
- lokasi tempat jual APD (Rafif)
    - terdapat card yang berisi penyedia apd, datanya berasal dari Django
    - bisa mengisi penyedia apd lewat form di flutter yang akan dikirimkan ke Django
- FAQ/tanya jawab (Dion)
    - menampilkan kolom faq (pertanyaan dan jawaban) dalam bentuk accordion
    - pertanyaan dan jawaban dapat diinput melalui form dari Django
