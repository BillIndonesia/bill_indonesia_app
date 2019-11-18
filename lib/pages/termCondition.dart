import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class TermCondition extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TermConditionPage();
  }
}

class TermConditionPage extends StatefulWidget {
  @override
  TermConditionPageState createState() => new TermConditionPageState();
}

class TermConditionPageState extends State<TermConditionPage> {
  String _markdownData = """
Dalam menggunakan layanan Bill, Pengguna setuju dan mengikatkan diri untuk mematuhi __“Syarat dan Ketentuan Pengguna Bill”__ sebagai berikut:

## KETENTUAN UMUM

1. Bill merupakan layanan berbasis mobile yang dapat digunakan oleh Pengguna melalui perangkat telekomunikasi.
2. Seluruh Pengguna dengan Nomor Ponsel (Handphone) dari operator manapun baik pascabayar atau prabayar dapat menjadi Pengguna Bill.
3. Untuk mengakses layanan Bill, Pengguna harus mengunduh dan melakukan instalasi aplikasi Bill di Telepon Genggam Pengguna dan kemudian melakukan aktivasi melalui aplikasi Bill yang terdapat didalam Aplikasi Bill.
4. Setiap Nomor Ponsel (Handphone) hanya dapat digunakan untuk 1 (satu) rekening Bill.
5. Pengguna dapat melakukan Transaksi apapun apabila saldo uang elektronik yang terdapat dalam rekening Bill tersebut mencukupi.
6. Batas maksimum Transaksi dalam 1 (satu) bulan kalender adalah Rp20.000.000 (dua puluh juta rupiah).
7. Hal-hal berikut harus dipenuhi untuk dapat menggunakan Layanan Bill:
    - Nomor Ponsel (Handphone) harus dalam keadaan aktif (tidak terblokir)
    - Jaringan data dan pulsa yang mencukupi (bagi pelanggan prabayar) atau batas kredit yang mencukupi (bagi pelanggan pascabayar).
8. Pengguna dan PIN:
   - PIN dapat diganti oleh Pengguna melalui aplikasi Bill.
   - Untuk mengatur ulang PIN maka Pengguna akan dipandu oleh Layanan Pelanggan (Customer Service) Bill.
   - Pengguna wajib menjaga kerahasiaan PIN dan bertanggung jawab sepenuhnya atas kerahasiaan PIN.
   - Kecuali ditentukan lain, PIN dapat diubah dengan metode atau sarana otentikasi lainnya yang disediakan oleh Bill atau oleh pihak lain yang bekerjasama dengan Bill dimana metode atau sarana otentikasi tersebut telah mendapat persetujuan dari Bill.

## PERNYATAAN DAN JAMINAN

1. Pengguna menyatakan dan menjamin bahwa berdasarkan hukum dan peraturan perundang-undangan yang berlaku Pengguna merupakan pihak yang dapat, cakap atau diperbolehkan menggunakan layanan yang disediakan oleh Bill;
2. Pengguna menyatakan dan menjamin bahwa dana yang dipergunakan dalam rangka layanan transaksi bukanlah dana yang berasal dari tindak pidana yang dilarang berdasarkan peraturan perundang-undangan yang berlaku di Republik Indonesia, pembukaan rekening tidak dimaksudkan dan/atau ditujukan dalam rangka upaya melakukan tindak pidana pencucian uang sesuai dengan ketentuan peraturan perundang-undangan yang berlaku di Republik Indonesia, transaksi tidak dilakukan untuk maksud mengelabui, mengaburkan, atau menghindari pelaporan kepada Pusat Pelaporan Dan Analisa Transaksi Keuangan (PPATK) berdasarkan ketentuan peraturan perundang-undangan yang berlaku di Republik Indonesia dan Pengguna bertanggung jawab sepenuhnya serta melepaskan Bill dari segala tuntutan, klaim, atau ganti rugi dalam bentuk apapun apabila Pengguna ternyata melakukan tindak pidana pencucian uang berdasarkan ketentuan peraturan perundang-undangan yang berlaku di Republik Indonesia;
3. Pengguna dengan ini menyatakan dan menjamin bahwa pihaknya akan bertanggung jawab sepenuhnya atas semua layanan Bill yang diakses menggunakan nomor ID pengguna miliknya;
4. Pengguna dengan ini menyatakan dan menjamin bahwa data dan informasi yang di daftarkan atau diberikan adalah benar, akurat dan lengkap dan tidak menyesatkan dalam bentuk apapun;
5. Pengguna tidak akan memberikan hak, wewenang dan/atau kuasa dalam bentuk apapun dan dalam kondisi apapun kepada orang atau pihak lain untuk menggunakan data, akun dan/atau PIN dan Pengguna karena alasan apapun dan dalam kondisi apapun tidak akan dan dilarang untuk mengalihkan rekening kepada orang atau pihak manapun;
6. Pengguna menyatakan dan menjamin tidak akan dengan alasan apapun meminta kembali setiap dan seluruh data/ dokumen yang telah disampaikan kepada Bill dan karenanya Bill berhak menggunakan data dan informasi tersebut sehubungan dengan layanan Transaksi atau terkait urusan administrasi rekening Pengguna pada Bill atau promosi dan program-program marketing Bill;
7. Pengguna menyatakan dan menjamin akan memperbaharui dan memberitahukan kepada Bill apabila ada perubahan data yang terkait dengan Pengguna;
8. Dengan melaksanakan transaksi melalui aplikasi Bill maka Pengguna memahami bahwa seluruh komunikasi dan instruksi dari Pengguna yang diterima oleh Bill akan diperlakukan sebagai bukti otentik meskipun tidak dibuat dalam bentuk dokumen tertulis atau diterbitkan dalam bentuk dokumen yang ditandatangani;
9. Pengguna menyatakan dan menjamin untuk membebaskan dan melepaskan Bill dari segala gugatan, tuntutan dan/atau ganti kerugian dari pihaknya maupun dari pihak manapun sehubungan dengan kelalaian Pengguna dalam memenuhi ketentuan mengenai pernyataan dan jaminan ini.


""";
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          Navigator.of(context).pop();
        },
        child: Scaffold(
            appBar: AppBar(
                automaticallyImplyLeading: true,
                title: Text('Syarat dan Ketentuan',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF423838))),
                leading: IconButton(
                    icon: Icon(Icons.arrow_back,
                        color: Color(0xFF777E81), size: 30),
                    onPressed: () {
                      Navigator.pop(context, false);
                    }),
                backgroundColor: Color(0xFFF4F7F8),
                elevation: 0.0),
            backgroundColor: Color(0xFFF4F7F8),
            body: ScrollConfiguration(
              behavior: MyBehavior(),
              child: Markdown(data: _markdownData,
              styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
                p: Theme.of(context).textTheme.body1.copyWith(
                  fontSize: 16.5, 
                  color: Color(0xFF5A5B5C),
                  fontFamily: 'Montserrat',
                  wordSpacing: 3),
                blockSpacing: 20)))));
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
