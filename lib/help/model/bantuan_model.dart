import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

class BantuanModelItem with ChangeNotifier {
  final question;
  final description;
  Function(String text, String? href, String title)? onClickText;
  bool useEmail;
  BantuanModelItem({
    required this.question,
    required this.description,
    required this.useEmail,
    this.onClickText,
  });
}

class BantuanModel with ChangeNotifier {
  final List<BantuanModelItem> _items = [
//'Apa itu Bill ?',
    BantuanModelItem(
      question: 'Apa itu Bill ?',
      description: """
Bill adalah sistem pembayaran yang dapat digunakan untuk:
- Pembayaran harianmu di agen (warung/pedagang)
- Transfer uang
- Membeli pulsa, token listrik dan membayar lain-lain
- Menerima transfer dari rekening bank""",
      useEmail: false,
    ),
//'Apa itu PIN Bill ?',
    BantuanModelItem(
      question: 'Apa itu PIN Bill ?',
      description: """
PIN Bill adalah fitur keamanan yang terdiri dari 6 (enam) digit kode PIN (Personal Identification Number). Layaknya fungsi PIN pada kartu ATM, PIN Bill ditujukan untuk meningkatkan keamanan saat melakukan transaksi menggunakan Bill.

Saat melakukan pembuatan PIN, gunakan kombinasi angka yang mudah diingat dan jangan berikan PIN kamu ke orang lain.

PIN Bill dibutuhkan untuk melakukan hal-hal di bawah ini:

Transfer Bill ke pengguna Bill lainnya, Pembayaran transaksi Pulsa, Transaksi pembayaran di merchant Bill, Mengubah nomor handphone pada akun Bill

""",
      useEmail: false,
    ),
// 'Saya lupa PIN Bill saya',
    BantuanModelItem(
        question: 'Saya lupa PIN Bill saya',
        description: """
Kamu dapat mengatur kembali PIN Bill-mu dengan klik ‘Lupa PIN’ yang terdapat pada saat kamu harus memasukkan PIN Bill

![](resource:assets/images/ss1.png)

Lalu, langkah selanjutnya :
- Masukan email dan klik ‘kirim’ Setelah itu buka email dan kilk pada link yang di berikan untuk melakukan pergantian PIN.
- Masukkan kode PIN baru kamu sebanyak 2 (dua) kali, gunakan kombinasi angka yang mudah kamu ingat dan hanya kamu yang mengetahuinya Kamu akan mendapatkan SMS kode verifikasi (OTP), masukkan kode tersebut untuk menyelesaikan proses pembuatan PIN.
- Selesai! PIN Bill-mu sudah berhasil diperbarui

__Mengapa saya tidak mendapatkan kode verifikasi untuk mengatur ulang PIN Bill?__

Jika kamu tidak mendapatkan kode verifikasi untuk mengatur ulang PIN Bill:
- Pastikan kamu menggunakan nomor handphone yang terdaftar pada akun Bill
- Klik Kirim Ulang Kode apabila kode verifikasi belum masuk setelah 30 detik

__Pastikan kamu menggunakan nomor handphone yang terdaftar pada akun Bill Klik Kirim Ulang Kode apabila kode verifikasi belum masuk setelah 30 detik__

Kamu bisa mengubah nomor handphone yang terdaftar di akun Bill mu dengan nomor handphone yang kamu pakai saat ini melalui halaman Akun Saya pada aplikasi Bill.

Setelah kamu ubah nomor handphone-mu di aplikasi Bill, kamu bisa coba lagi mengatur ulang PIN Bill kamu.

__Mengapa saya tidak bisa melakukan transaksi setelah mengatur ulang PIN?__

Penting untuk diingat, meskipun kamu telah mengganti PIN Bill tapi kamu telah memasukkan PIN yang salah sebanyak 3 (tiga) kali maka kamu harus menunggu beberapa waktu untuk melakukan transaksi menggunakan Bill.""",
        useEmail: false),
//'Bagaimana cara mengatur PIN Bill',
    BantuanModelItem(
      question: 'Bagaimana Cara Merubah PIN saya?',
      description: """
Kalau kamu mau ganti PIN Bill, kamu bisa lakukan langkah-langkah berikut:
- Pada tampilan awal Bill, klik tombol akun
- Pilih 'profile'
- Pilih icon ‘edit profile’ di kanan atas  
- Pilih 'UbahPIN'
- Masukkan 6 (enam) digit angka untuk PIN lama kamu sebanyak satu kali
- Masukkan 6 (enam) digit angka untuk PIN baru kamu sebanyak 2 (dua) kali
- PIN Bill kamu sudah berhasil diperbarui

Jika kamu lupa PIN Bill kamu, kamu bisa [Klik Disini][Google] untuk informasi lebih lanjut.

[Google]: https://www.google.com/
""",
      useEmail: false,
      onClickText: (text, href, title) {
        launch("https://www.google.com/");
      },
    ),
//Mengapa saldo Bill saya tidak sesuai ?',
    BantuanModelItem(
      question: 'Mengapa saldo Bill saya tidak sesuai ?',
      description: """
Jika kamu merasa saldo Bill yang kamu miliki tidak sesuai setelah melakukan top up atau menggunakan Bill, kamu dapat mengeceknya kembali di menu 'Riwayat transaksi' yang ada pada menu utama --> tombol nominal mu atau kamu juga dapat melakukan restart aplikasi Bill. Setelah melakukan restart, saldo Bill kamu akan normal kembali.

![](resource:assets/images/ss2.png)

Jika saldo Bill yang kamu miliki tetap tidak sesuai setelah melakukan hal di atas, silakan laporkan ke kami dengan menekan tombol email  di bawah ini. Tim kami akan membalas laporan ke email yang terdaftar pada akun Bill kamu dalam waktu maksimum 2 (dua) hari kerja.
""",
      useEmail: true,
    ),
//'Bayar menggunakan Bill di rekan usaha Bill',
    BantuanModelItem(
      question: 'Bayar menggunakan Bill di rekan usaha Bill',
      description: """
Kini kamu bisa pakai Bill untuk melakukan pembayaran mulai dari beli makanan, minuman, hingga barang lainnya di banyak Rekan Usaha.

Sebelum membayar pakai Bill, pastikan kamu memiliki saldo Bill yang mencukupi dan telah memasang PIN Bill.

__Lalu, bagaimana cara bayar pakai Bill ?__

Yuk ikuti langkah-langkah berikut untuk bayar pakai Bill:
1. Tunjukan kode QR kita kepada rekan usaha Bill (user)

![](resource:assets/images/ss2.png)

2. Rekan usaha Bill memasukan nominal yang akan di bayarkan oleh user, lalu rekan usaha meng klik ‘pembayaran’ dan menunggu konfirmasi dari user/pelanggan

![](resource:assets/images/ss3.png) ![](resource:assets/images/ss4.png)

3. User Bill akan menerima konfirmasi bahwa ‘anda akan melakukan pembayaran sebesar Rp. xxxx kepada ‘rekan usaha Bill’. Setelah itu klik ‘Ok’ dan pembayaran berhasil di lakukan!

![](resource:assets/images/ss5.png) ![](resource:assets/images/ss6.png)

Catatan
1. Pastikan nominal pembayaran yang kamu masukkan sudah sesuai!
2. Pastikan nama Rekan Usaha yang tertera pada aplikasi sudah sesuai, memiliki tanda Penjual Terverifikasi
3. Pastikan bahwa kode QR dalam keadaan baik, apabila kode QR tidak jelas atau berwarna pudar, kamu dapat meminta kasir Rekan Usaha untuk menunjukkan kode QR di portal atau aplikasi Rekan Usaha

__Lalu, bagaimana cara bayar pakai Bill ?__

Berikut contoh stiker dan wobbler pada toko atau restoran (Rekan Usaha Bill) yang menandakan bahwa kamu bisa bayar dengan Bill

![](resource:assets/images/stiker1.png) ![](resource:assets/images/stiker2.png)

__Apakah saya dikenakan biaya tambahan untuk pembayaran ini?__

Kamu tidak dikenakan biaya tambahan untuk transaksi pembelian di toko offline dengan menggunakan Bill.

__Saya sudah melakukan pembayaran namun nominal yang tertera salah, apa yang harus saya lakukan?__

Apabila kamu sudah membayar namun nominal yang tertera salah, seperti:
- __Kelebihan nominal pembayaran__
Silakan tanyakan ke merchant untuk memberikan kembali kelebihan biaya dengan uang tunai
- __Pembayaran kurang__
Silakan lakukan transfer dengan scan kode QR merchant sebesar nominal kekurangan

__Mengapa saya selalu gagal ketika melakukan pembayaran di Rekan Usaha Bill?__

Jika kamu gagal melakukan pembayaran di Rekan Usaha Bill, pastikan hal-hal berikut ini:
- Kamu telah memasukkan PIN yang benar
- Saldo Bill kamu mencukupi

Jika kamu masih tidak bisa menggunakan Bill untuk pembayaran di Rekan Usaha, [klik disini]() untuk melihat informasi lebih lanjut.
""",
      useEmail: false,
    ),
//'Saya belum mendapatkan kode verifikasi (OTP)',
    BantuanModelItem(
      question: 'Saya belum mendapatkan kode verifikasi (OTP)',
      description: """
Langkah yang bisa kamu lakukan jika belum mendapatkan kode verifikasi (OTP) lewat SMS ketika masuk ke akun Bill, membuat PIN Bill, atau ingin mengganti PIN Bill karena lupa:
1. Pastikan kamu memasukkan nomor handphone yang sudah terdaftar di Bill
2. Pastikan sinyal handphone-mu bagus agar SMS kode verifikasi (OTP) bisa diterima
3. Tunggu sampai 30 detik hingga SMS kode verifikasi sampai, pastikan kamu menerima kode tersebut ya
4. Jika setelah 30 detik kamu belum mendapatkan SMS kode verifikasi (OTP), klik “Kirim Ulang” untuk mengirimnya lagi
5. Tunggu sampai 1 menit sampai kamu menerima SMS kode verifikasinya
6. Masih belum dapat SMS-nya juga? Klik tombol “Telepon Saya” untuk mendapatkan kode verifikasi (OTP) lewat telepon (kode verifikasi akan disebutkan dalam Bahasa Inggris dan Bahasa Indonesia secara bergantian)

__Bagaimana jika no handphone saya hilang ?__

Jangan khawatir! Kunjungi [artikel ini]() dan kami akan membantu kamu.
""",
      useEmail: false,
    ),
//'Saldo Bill saya belum masuk setelah melakukan Top Up',
    BantuanModelItem(
      question: 'Saldo Bill saya belum masuk setelah melakukan Top Up',
      description: """
Oke, tenang. Semua transaksi kamu tersimpan rapi di sistem kami. Jadi, apabila kamu mengalami hal ini, pastikan hal berikut:
1. Cek bukti transfer dan pastikan kamu sudah memasukkan nomor handphone yang terdaftar di akun Bill
2. Transaksi yang kamu lakukan tertera di menu 'Riwayat transaksi' 
3. Tutup dan buka kembali aplikasi Bill-mu

Jika setelah melakukan langkah diatas, tetapi saldo Bill mu masih belum masuk, laporkan ke kami dengan menekan tombol email  di bawah ini. Kami akan membalas ke email yang terdaftar pada akun Bill kamu dalam waktu maksimal 2 (dua) hari kerja.
""",
      useEmail: true,
    ),
// 'Bagaimana cara transfer saldo Bill ?',
    BantuanModelItem(
      question: 'Bagaimana cara transfer saldo Bill ?',
      description: """
Untuk menikmati fitur transfer, pastikan akun kamu sudah terdaftar di Bill. Jika sudah, maka kamu dapat dengan mudah melakukan transfer saldo Bill ke temanmu tanpa biaya tambahan.

__Langkah-langkah yang bisa kamu lakukan untuk melakukan transfer saldo Bill:__
1. Scan kode QR penerima transfer Bill
![](resource:assets/images/ss2.png)

2. Memasukan nominal yang akan di transfer kepada teman-mu, lalu tekan ‘transfer sekarang’
![](resource:assets/images/ss10.png)

3. Kamu telah berhasil transfer ke sesama pengguna Bill !
""",
      useEmail: false,
    ),
//'Cara mudah isi saldo Bill',
    BantuanModelItem(
      question: 'Cara mudah isi saldo Bill',
      description: """ 1. Tunjukan QR kode pada merchant
![](resource:assets/images/ss2.png)

2. Anda akan menerima konfirmasi Top up berhasil
![](resource:assets/images/ss7.png)
""",
      useEmail: false,
    ),
// 'Mengapa saya gagal melakukan pembayaran di rekan usaha Bill',
    BantuanModelItem(
      question: 'Mengapa saya gagal melakukan pembayaran di rekan usaha Bill',
      description: """
Sebelum kamu melakukan pembayaran di Rekan Usaha Bill, mohon pastikan bahwa kamu telah memperhatikan hal-hal berikut:
- Aplikasi Bill kamu adalah versi terbaru
- Saldo Bill kamu cukup untuk melakukan pembayaran
- Kamu tersambung dengan jaringan internet yang stabil
- Ketika memasukkan PIN Bill, pastikan kode PIN yang kamu masukkan sudah benar. [](Klik di sini) untuk melihat cara mengatur PIN Bill kamu.
- Melakukan scan QR dengan benar dan pastikan kode QR dalam kondisi baik.
- Mengaktifkan izin kamera untuk aplikasi Bill. [](Klik di sini) untuk informasi lebih lengkap cara mudah melakukan Scan QR.

Jika tetap tidak dapat melakukan pembayaran di Rekan Usaha Bill, silakan menghubungi kami dengan menekan tombol email di bawah ini.
""",
      useEmail: true,
    ),
// 'Dimana saya dapat melihat riwayat transaksi Bill ?',
    BantuanModelItem(
      question: 'Dimana saya dapat melihat riwayat transaksi Bill ?',
      description: """
Penasaran sama transaksi Bill kamu selama ini? Kamu bisa melihat riwayat transaksi mu dengan cara:
1. Pada menu utama klik ‘Lihat transaksi’
![](resource:assets/images/ss2.png)

2. Riwayat transaksi mu akan terlihat

![](resource:assets/images/ss8.png)

__Adakah batas maksimal waktu transaksi yang tercatat pada halaman Riwayat Bill?__

Tidak ada batasan waktu riwayat transaksi yang tercatat di halaman Riwayat. Kamu bisa geser ke bawah (scroll down) untuk menampilkan keseluruhan riwayat transaksi kamu.

__Apakah saya bisa memfilter riwayat transaksi?__

Bisa, dengan meng-klik icon filter di kanan atas, lalu kamu bisa seting waktu dan seting uang keluar atau uang masuk yang ingin kamu tampillkan

![](resource:assets/images/ss8.png) ![](resource:assets/images/ss9.png)
""",
      useEmail: false,
    ),
// 'Transaksi di toko/restoran berhasil, namun saldo terpotong dua kali',
    BantuanModelItem(
      question:
          'Transaksi di toko/restoran berhasil, namun saldo terpotong dua kali',
      description: """
Transaksi di toko atau restoran berhasil namun saldo Bill kamu terpotong dua kali? Kamu tidak perlu khawatir jika mengalami hal seperti ini, karena kami akan mengembalikan saldo Bill kamu dalam 2 (dua) hari kerja.

Jika kamu telah menunggu lebih dari 2 (dua) hari kerja tetapi saldo BIll kamu masih belum bertambah, silakan laporkan kepada kami dengan menekan tombol email  di bawah ini ya.
""",
      useEmail: true,
    ),
//'Mengapa saya tidak dapat menggunakan Bill ?',
    BantuanModelItem(
      question: 'Mengapa saya tidak dapat menggunakan Bill ?',
      description: """
Apakah kamu mengalami masalah tidak dapat melakukan pembayaran menggunakan Bill? Jangan khawatir. Mari pastikan terlebih dahulu hal-hal berikut:
- Aplikasi Bill kamu adalah versi terbaru
- Saldo Bill kamu cukup untuk melakukan pembayaran
- Kamu tersambung dengan jaringan internet yang stabil
- Kamu telah melakukan upgrade akun Bill
- Mengaktifkan izin kamera untuk aplikasi Bill untuk melakukan pembayaran dengan scan kode QR
- Memasukan PIN Bill dengan benar

Apabila kamu masih tidak dapat melakukan transaksi dengan Bill, maka ada kemungkinan bahwa akun Bill kamu telah diblokir/suspend. Untuk melindungi saldo Bill kamu, kami akan memblokir transaksi menggunakan Bill. Hal ini dilakukan untuk mencegah adanya potensi transaksi mencurigakan yang terjadi tanpa sepengetahuan kamu.

__Lalu, apa yang harus saya lakukan jika mengalami hal tersebut?__

Jika kamu tidak dapat menggunakan Bill, silakan laporkan detailnya ke kami dengan menekan tombol email  di bawah ini.
""",
      useEmail: true,
    ),
//'Saldo Bill saya hilang ketika membatalkan pesanan',
    BantuanModelItem(
      question: 'Saldo Bill saya hilang ketika membatalkan pesanan',
      description: """
Kamu habis membatalkan pesanan namun saldo Bill kamu berkurang? Tenang, jangan panik, kamu bisa melakukan hal-hal dibawah ini:
- Pastikan kamu memiliki koneksi internet yang baik
- Coba tutup dan buka kembali aplikasi Bill kamu
- Log out dan log in kembali ke aplikasi Bill Silakan tunggu dalam waktu maksimal 1 (satu) jam

Kalau kamu sudah mengikuti langkah-langkah di atas namun saldo Bill kamu masih belum sesuai, silakan laporkan ke kami dengan menekan tombol email  di bawah ini. Tim kami akan segera merespon dan membalas laporan kamu ke email yang terdaftar pada akun Bill kamu dalam waktu maksimum 2 (dua) hari.
""",
      useEmail: true,
    ),
//'No Handphone saya hilang'
    BantuanModelItem(
      question: 'No Handphone saya hilang ',
      description: """
Kalau nomor handphone yang terdaftar di akun Bill-mu hilang atau sudah tidak aktif, kamu bisa menghubungi layanan provider agar kamu bisa mendapatkan nomor handphone kamu kembali. Kemudian kamu bisa masuk lagi deh ke akun Bill dengan nomor tersebut.

__Atau kalau kamu memutuskan untuk mengganti nomor handphone untuk akun Bill-mu__

Silakan hubungi kami dengan menekan tombol telepon di bawah. Kami akan membantu untuk mengganti nomor handphone di akun Bill kamu.
""",
      useEmail: true,
    ),
  ];

  List<BantuanModelItem> get items {
    return [..._items];
  }
}
