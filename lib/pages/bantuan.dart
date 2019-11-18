import 'package:flutter/material.dart';
import 'package:bill/pages/home.dart';
import 'package:bill/pages/detail.dart';
import 'package:bill/pages/termCondition.dart';
import 'package:bill/pages/saya.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_camera_ml_vision/flutter_camera_ml_vision.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:loader_search_bar/loader_search_bar.dart';

class Bantuan extends StatelessWidget {
  final String tipe;
  final String que;
  final int index;

  Bantuan({this.tipe, this.que, this.index});
  @override
  Widget build(BuildContext context) {
    return BantuanPage(tipe, que, index);
  }
}

class BantuanPage extends StatefulWidget {
  final String tp;
  final String q;
  final int i;

  BantuanPage(this.tp, this.q, this.i);
  @override
  BantuanPageState createState() => new BantuanPageState();
}

class BantuanPageState extends State<BantuanPage> {
  List<String> question = [
    'Apa itu Bill ?',
    'Apa itu PIN Bill ?',
    'Saya lupa PIN Bill saya',
    'Bagaimana cara mengatur PIN Bill',
    'Mengapa saldo Bill saya tidak sesuai ?',
    'Bayar menggunakan Bill di rekan usaha Bill',
    'Saya belum mendapatkan kode verifikasi (OTP)',
    'Saldo Bill saya belum masuk setelah melakukan Top Up',
    'Bagaimana cara transfer saldo Bill ?',
    'Cara mudah isi saldo Bill',
    'Mengapa saya gagal melakukan pembayaran di rekan usaha Bill',
    'Dimana saya dapat melihat riwayat transaksi Bill ?',
    'Transaksi di toko/restoran berhasil, namun saldo terpotong dua kali',
    'Mengapa saya tidak dapat menggunakan Bill ?',
    'Saldo Bill saya hilang ketika membatalkan pesanan',
    'No Handphone saya hilang'
  ];

  List<String> description = List();

  @override
  void initState() {
    String md0 = """
Bill adalah sistem pembayaran yang dapat digunakan untuk:
- Pembayaran harianmu di agen (warung/pedagang)
- Transfer uang
- Membeli pulsa, token listrik dan membayar lain-lain
- Menerima transfer dari rekening bank""";
    description.add(md0);

    String md1 = """
PIN Bill adalah fitur keamanan yang terdiri dari 6 (enam) digit kode PIN (Personal Identification Number). Layaknya fungsi PIN pada kartu ATM, PIN Bill ditujukan untuk meningkatkan keamanan saat melakukan transaksi menggunakan Bill.

Saat melakukan pembuatan PIN, gunakan kombinasi angka yang mudah diingat dan jangan berikan PIN kamu ke orang lain.

PIN Bill dibutuhkan untuk melakukan hal-hal di bawah ini:

Transfer Bill ke pengguna Bill lainnya, Pembayaran transaksi Pulsa, Transaksi pembayaran di merchant Bill, Mengubah nomor handphone pada akun Bill

Nah... Kamu sudah buat PIN Bill belum?

Jika belum, silakan [](klik di sini) untuk mengetahui cara membuat PIN Bill.
""";
    description.add(md1);

    String md2 = """
Kamu dapat mengatur kembali PIN Bill-mu dengan klik ‘Lupa PIN’ yang terdapat pada saat kamu harus memasukkan PIN Bill

![](resource:images/ss1.png)

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

Penting untuk diingat, meskipun kamu telah mengganti PIN Bill tapi kamu telah memasukkan PIN yang salah sebanyak 3 (tiga) kali maka kamu harus menunggu beberapa waktu untuk melakukan transaksi menggunakan Bill.""";
    description.add(md2);

    String md3 = """
Kalau kamu mau ganti PIN Bill, kamu bisa lakukan langkah-langkah berikut:
- Pada tampilan awal Bill, klik tombol akun
- Pilih 'profile'
- Pilih icon ‘edit profile’ di kanan atas  
- Pilih 'UbahPIN'
- Masukkan 6 (enam) digit angka untuk PIN lama kamu sebanyak satu kali
- Masukkan 6 (enam) digit angka untuk PIN baru kamu sebanyak 2 (dua) kali
- PIN Bill kamu sudah berhasil diperbarui

Jika kamu lupa PIN Bill kamu, kamu bisa klik di sini untuk informasi lebih lanjut.

Perlu diingat juga, kalau kamu sebelumnya salah memasukkan PIN sebanyak 3 (tiga) kali namun sudah mengubah PIN Bill, maka kamu harus menunggu selama 1 (satu) jam agar dapat melakukan transaksi kembali menggunakan Bill. Hal ini dilakukan untuk mencegah akun kamu disalahgunakan oleh orang lain
""";
    description.add(md3);

    String md4 = """
Jika kamu merasa saldo Bill yang kamu miliki tidak sesuai setelah melakukan top up atau menggunakan Bill, kamu dapat mengeceknya kembali di menu 'Riwayat transaksi' yang ada pada menu utama --> tombol nominal mu atau kamu juga dapat melakukan restart aplikasi Bill. Setelah melakukan restart, saldo Bill kamu akan normal kembali.

![](resource:images/ss2.png)

Jika saldo Bill yang kamu miliki tetap tidak sesuai setelah melakukan hal di atas, silakan laporkan ke kami dengan menekan tombol email  di bawah ini. Tim kami akan membalas laporan ke email yang terdaftar pada akun Bill kamu dalam waktu maksimum 2 (dua) hari kerja.
""";
    description.add(md4);

    String md5 = """
Kini kamu bisa pakai Bill untuk melakukan pembayaran mulai dari beli makanan, minuman, hingga barang lainnya di banyak Rekan Usaha.

Sebelum membayar pakai Bill, pastikan kamu memiliki saldo Bill yang mencukupi dan telah memasang PIN Bill.

__Lalu, bagaimana cara bayar pakai Bill ?__

Yuk ikuti langkah-langkah berikut untuk bayar pakai Bill:
1. Tunjukan kode QR kita kepada rekan usaha Bill (user)

![](resource:images/ss2.png)

2. Rekan usaha Bill memasukan nominal yang akan di bayarkan oleh user, lalu rekan usaha meng klik ‘pembayaran’ dan menunggu konfirmasi dari user/pelanggan

![](resource:images/ss3.png) ![](resource:images/ss4.png)

3. User Bill akan menerima konfirmasi bahwa ‘anda akan melakukan pembayaran sebesar Rp. xxxx kepada ‘rekan usaha Bill’. Setelah itu klik ‘Ok’ dan pembayaran berhasil di lakukan!

![](resource:images/ss5.png) ![](resource:images/ss6.png)

Catatan
1. Pastikan nominal pembayaran yang kamu masukkan sudah sesuai!
2. Pastikan nama Rekan Usaha yang tertera pada aplikasi sudah sesuai, memiliki tanda Penjual Terverifikasi
3. Pastikan bahwa kode QR dalam keadaan baik, apabila kode QR tidak jelas atau berwarna pudar, kamu dapat meminta kasir Rekan Usaha untuk menunjukkan kode QR di portal atau aplikasi Rekan Usaha

__Lalu, bagaimana cara bayar pakai Bill ?__

Berikut contoh stiker dan wobbler pada toko atau restoran (Rekan Usaha Bill) yang menandakan bahwa kamu bisa bayar dengan Bill

![](resource:images/stiker1.png) ![](resource:images/stiker2.png)

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

Jika kamu masih tidak bisa menggunakan Bill untuk pembayaran di Rekan Usaha, [](klik disini) untuk melihat informasi lebih lanjut.
""";
    description.add(md5);

    String md6 = """
Langkah yang bisa kamu lakukan jika belum mendapatkan kode verifikasi (OTP) lewat SMS ketika masuk ke akun Bill, membuat PIN Bill, atau ingin mengganti PIN Bill karena lupa:
1. Pastikan kamu memasukkan nomor handphone yang sudah terdaftar di Bill
2. Pastikan sinyal handphone-mu bagus agar SMS kode verifikasi (OTP) bisa diterima
3. Tunggu sampai 30 detik hingga SMS kode verifikasi sampai, pastikan kamu menerima kode tersebut ya
4. Jika setelah 30 detik kamu belum mendapatkan SMS kode verifikasi (OTP), klik “Kirim Ulang” untuk mengirimnya lagi
5. Tunggu sampai 1 menit sampai kamu menerima SMS kode verifikasinya
6. Masih belum dapat SMS-nya juga? Klik tombol “Telepon Saya” untuk mendapatkan kode verifikasi (OTP) lewat telepon (kode verifikasi akan disebutkan dalam Bahasa Inggris dan Bahasa Indonesia secara bergantian)

__Bagaimana jika no handphone saya hilang ?__

Jangan khawatir! Kunjungi [](artikel ini) dan kami akan membantu kamu.
""";
    description.add(md6);

    String md7 = """
Oke, tenang. Semua transaksi kamu tersimpan rapi di sistem kami. Jadi, apabila kamu mengalami hal ini, pastikan hal berikut:
1. Cek bukti transfer dan pastikan kamu sudah memasukkan nomor handphone yang terdaftar di akun Bill
2. Transaksi yang kamu lakukan tertera di menu 'Riwayat transaksi' 
3. Tutup dan buka kembali aplikasi Bill-mu

Jika setelah melakukan langkah diatas, tetapi saldo Bill mu masih belum masuk, laporkan ke kami dengan menekan tombol email  di bawah ini. Kami akan membalas ke email yang terdaftar pada akun Bill kamu dalam waktu maksimal 2 (dua) hari kerja.
""";
     description.add(md7);

     String md8 = """
Untuk menikmati fitur transfer, pastikan akun kamu sudah terdaftar di Bill. Jika sudah, maka kamu dapat dengan mudah melakukan transfer saldo Bill ke temanmu tanpa biaya tambahan.

__Langkah-langkah yang bisa kamu lakukan untuk melakukan transfer saldo Bill:__
1. Scan kode QR penerima transfer Bill

![](resource:images/ss2.png)

2. Memasukan nominal yang akan di transfer kepada teman-mu, lalu tekan ‘transfer sekarang’

![](resource:images/ss10.png)

3. Kamu telah berhasil transfer ke sesama pengguna Bill !
""";
    description.add(md8);

    String md9 = """
1. Tunjukan QR kode pada merchant

![](resource:images/ss2.png)

2. Anda akan menerima konfirmasi Top up berhasil

![](resource:images/ss7.png)
""";
    description.add(md9);

    String md10 = """
Sebelum kamu melakukan pembayaran di Rekan Usaha Bill, mohon pastikan bahwa kamu telah memperhatikan hal-hal berikut:
- Aplikasi Bill kamu adalah versi terbaru
- Saldo Bill kamu cukup untuk melakukan pembayaran
- Kamu tersambung dengan jaringan internet yang stabil
- Ketika memasukkan PIN Bill, pastikan kode PIN yang kamu masukkan sudah benar. [](Klik di sini) untuk melihat cara mengatur PIN Bill kamu.
- Melakukan scan QR dengan benar dan pastikan kode QR dalam kondisi baik.
- Mengaktifkan izin kamera untuk aplikasi Bill. [](Klik di sini) untuk informasi lebih lengkap cara mudah melakukan Scan QR.

Jika tetap tidak dapat melakukan pembayaran di Rekan Usaha Bill, silakan menghubungi kami dengan menekan tombol email di bawah ini.
""";
    description.add(md10);

    String md11 = """
Penasaran sama transaksi Bill kamu selama ini? Kamu bisa melihat riwayat transaksi mu dengan cara:
1. Pada menu utama klik ‘Lihat transaksi’

![](resource:images/ss2.png)

2. Riwayat transaksi mu akan terlihat

![](resource:images/ss8.png)

__Adakah batas maksimal waktu transaksi yang tercatat pada halaman Riwayat Bill?__

Tidak ada batasan waktu riwayat transaksi yang tercatat di halaman Riwayat. Kamu bisa geser ke bawah (scroll down) untuk menampilkan keseluruhan riwayat transaksi kamu.

__Apakah saya bisa memfilter riwayat transaksi?__

Bisa, dengan meng-klik icon filter di kanan atas, lalu kamu bisa seting waktu dan seting uang keluar atau uang masuk yang ingin kamu tampillkan

![](resource:images/ss8.png) ![](resource:images/ss9.png)
""";
    description.add(md11);

    String md12 = """
Transaksi di toko atau restoran berhasil namun saldo Bill kamu terpotong dua kali? Kamu tidak perlu khawatir jika mengalami hal seperti ini, karena kami akan mengembalikan saldo Bill kamu dalam 2 (dua) hari kerja.

Jika kamu telah menunggu lebih dari 2 (dua) hari kerja tetapi saldo BIll kamu masih belum bertambah, silakan laporkan kepada kami dengan menekan tombol email  di bawah ini ya.
""";
    description.add(md12);

    String md13 = """
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
""";
    description.add(md13);

    String md14 = """
Kamu habis membatalkan pesanan namun saldo Bill kamu berkurang? Tenang, jangan panik, kamu bisa melakukan hal-hal dibawah ini:
- Pastikan kamu memiliki koneksi internet yang baik
- Coba tutup dan buka kembali aplikasi Bill kamu
- Log out dan log in kembali ke aplikasi Bill Silakan tunggu dalam waktu maksimal 1 (satu) jam

Kalau kamu sudah mengikuti langkah-langkah di atas namun saldo Bill kamu masih belum sesuai, silakan laporkan ke kami dengan menekan tombol email  di bawah ini. Tim kami akan segera merespon dan membalas laporan kamu ke email yang terdaftar pada akun Bill kamu dalam waktu maksimum 2 (dua) hari.
""";
    description.add(md14);

    String md15 = """
Kalau nomor handphone yang terdaftar di akun Bill-mu hilang atau sudah tidak aktif, kamu bisa menghubungi layanan provider agar kamu bisa mendapatkan nomor handphone kamu kembali. Kemudian kamu bisa masuk lagi deh ke akun Bill dengan nomor tersebut.

__Atau kalau kamu memutuskan untuk mengganti nomor handphone untuk akun Bill-mu__

Silakan hubungi kami dengan menekan tombol telepon di bawah. Kami akan membantu untuk mengganti nomor handphone di akun Bill kamu.
""";
    description.add(md15);
  }



  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (widget.tp == 'list') {
          Navigator.of(context).pushReplacement(
              new MaterialPageRoute(builder: (context) => new Saya()));
        } else {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
          appBar: widget.tp == 'list'
          ? SearchBar(
            searchHint: 'Cari bantuan',
            searchItem: SearchItem.action(
              builder: (_) => Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.06),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.07,
                  child: FittedBox(
                    child: Icon(Icons.search, color: Color(0xFF777E81), size: 30))),
              ),
              gravity: SearchItemGravity.end,
            ),
            loader: QuerySetLoader<int>(
              querySetCall: (String query) {
                List<int> cari = [];

                for(int a = 0; a < question.length; a++) {
                  if (question[a].toLowerCase().contains(query.toLowerCase())) {
                    cari.add(a);
                  }
                }
                // print(cari.toString());
                return cari;
                },
              itemBuilder: (int i) {
                // print('sini ' + o.toString());
                // return Container(
                //   width: 100,
                //   height: 100,
                //   color: Colors.red);
                return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (context) => new Bantuan(
                              tipe: 'detail', que: question[i], index: i)));
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFF4F7F8),
                            border: Border(
                                bottom: BorderSide(color: Colors.black12))),
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.05,
                            right:
                                MediaQuery.of(context).size.width * 0.08),
                        height: MediaQuery.of(context).size.height * 0.09,
                        child: Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Flexible(
                                child: Text(question[i],
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 14,
                                      color: Color(0xFF5A5B5C)))),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.03),
                              Icon(Icons.keyboard_arrow_right,
                                  color: Color(0xFF6C6565), size: 30)
                            ])));
                },
              loadOnEachChange: true,
              animateChanges: false,
            ),
            defaultBar: AppBar(
              automaticallyImplyLeading: true,
              title: Container(
                // color: Colors.red,
                width: MediaQuery.of(context).size.width * 0.2,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text('Bantuan',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF423838))))),
              leading: IconButton(
                  icon: Icon(Icons.arrow_back,
                      color: Color(0xFF777E81), size: 30),
                  onPressed: () {
                    if (widget.tp == 'list') {
                      Navigator.of(context).pushReplacement(
                          new MaterialPageRoute(
                              builder: (context) => new Saya()));
                    } else {
                      Navigator.of(context).pop();
                    }
                  }),
              backgroundColor: Color(0xFFF4F7F8),
              elevation: 0.0))
            : AppBar(
              automaticallyImplyLeading: true,
              title: Container(
                // color: Colors.red,
                width: MediaQuery.of(context).size.width * 0.2,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text('Bantuan',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF423838))))),
              leading: IconButton(
                  icon: Icon(Icons.arrow_back,
                      color: Color(0xFF777E81), size: 30),
                  onPressed: () {
                    if (widget.tp == 'list') {
                      Navigator.of(context).pushReplacement(
                          new MaterialPageRoute(
                              builder: (context) => new Saya()));
                    } else {
                      Navigator.of(context).pop();
                    }
                  }),
              backgroundColor: Color(0xFFF4F7F8),
              elevation: 0.0),
          backgroundColor: Color(0xFFF4F7F8),
          body: widget.tp == 'list'
              ? ScrollConfiguration(
                behavior: MyBehavior(),
                child: ListView.builder(
                  itemCount: question.length,
                  itemBuilder: (BuildContext context, int i) {
                    return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(new MaterialPageRoute(
                              builder: (context) => new Bantuan(
                                  tipe: 'detail', que: question[i], index: i)));
                        },
                        child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFF4F7F8),
                                border: Border(
                                    bottom: BorderSide(color: Colors.black12))),
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.05,
                                right:
                                    MediaQuery.of(context).size.width * 0.08),
                            height: MediaQuery.of(context).size.height * 0.09,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Flexible(
                                    child: Text(question[i],
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 14,
                                          color: Color(0xFF5A5B5C)))),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.03),
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.05,
                                    child: FittedBox(
                                      child: Icon(Icons.keyboard_arrow_right,
                                      color: Color(0xFF6C6565), size: 30)))
                                ])));
                  }))
              : widget.tp == 'detail'
                  ? Column(children: <Widget>[
                      Container(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.05),
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.03,
                              vertical:
                                  MediaQuery.of(context).size.height * 0.02),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.06,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                begin: Alignment.centerRight,
                                end: Alignment.centerLeft,
                                colors: [Color(0xFF36B8B6), Color(0xFF0485AC)],
                              )),
                          child: Text(widget.q,
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 14,
                                  color: Color(0xFFF4F7F8),
                                  fontWeight: FontWeight.w600))),
                      Expanded(
                        child: ScrollConfiguration(
                          behavior: MyBehavior(),
                          child: Markdown(data: description[widget.i],
                            styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
                              p: Theme.of(context).textTheme.body1.copyWith(
                                fontSize: 16.5, 
                                color: Color(0xFF5A5B5C),
                                fontFamily: 'Montserrat',
                                wordSpacing: 3),
                              blockSpacing: 20)))),
                      (widget.i == 4) || (widget.i == 7) || (widget.i == 10) || (widget.i == 12) || (widget.i == 13) || (widget.i == 14) || (widget.i == 15)
                      ? GestureDetector(
                        onTap: () {
                          launch("mailto:info@bill.co.id?subject=Bantuan");
                        },
                        child: Container(
                        margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color:Color(0xFF0B8CAD),
                            width: 1),
                          borderRadius:BorderRadius.circular(5)),
                        height: MediaQuery.of(context).size.height * 0.06,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                          Text('Laporkan',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Color(0xFF5A5B5C),
                              fontSize: 15)),
                          SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                          Icon(Icons.email, 
                            size: MediaQuery.of(context).size.width * 0.06,
                            color: Color(0xFF8B8B8B))])))
                      : Container()
                    ])
                  : Container()),
    );
  }
}
class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}