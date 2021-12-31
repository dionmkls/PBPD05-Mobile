import 'package:flutter/material.dart';
import 'package:proyek_akhir/page/all_covid_data_page.dart';
import 'package:proyek_akhir/page/beranda_form.dart';
import 'package:proyek_akhir/page/forum.dart';
import 'package:proyek_akhir/page/newvaksin.dart';
import 'package:proyek_akhir/page/vaksin_charts_page.dart';

import '../main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'form_oksigen.dart';
import 'apd_form.dart';
import 'apd_page.dart';
import 'package:proyek_akhir/page/home_page.dart';
import 'vaksin_form.dart';
import 'vaksin_index.dart';
import 'oksigen.dart';
import 'rs_form.dart';
import 'rs_page.dart';
import 'faq.dart';

class Beranda extends StatefulWidget {
  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  get client => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'App name',
        home: Builder(builder: (BuildContext context) {
          return Scaffold(
              appBar: AppBar(
                title: Text('''PBP D-05'''),
                // actions: <Widget>[
                //   IconButton(
                //     icon: const Icon(Icons.dark_mode),
                //     tooltip: 'dark mode',
                //     onPressed: _onItemTapped,
                //   ),
                // ],
              ),
              drawer: Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    DrawerHeader(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                      ),
                      child: Text(
                        'Navigation Menu',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.home),
                      title: Text('Beranda'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Beranda()),
                        );
                      },
                    ),
                    ExpansionTile(
                      title: Text("Vaksin"),
                      leading: FaIcon(FontAwesomeIcons.syringe),
                      children: <Widget>[
                        ListTile(
                          leading: FaIcon(FontAwesomeIcons.syringe),
                          title: Text('Lokasi'),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Vaksin()),
                            );
                          },
                        ),
                        ListTile(
                          leading: FaIcon(FontAwesomeIcons.syringe),
                          title: Text('Form'),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LokasiForm()),
                            );
                          },
                        ),
                      ],
                    ),
                    ExpansionTile(
                      title: Text("Oksigen"),
                      leading: FaIcon(FontAwesomeIcons.medkit),
                      children: <Widget>[
                        ListTile(
                          leading: FaIcon(FontAwesomeIcons.medkit),
                          title: Text('Lokasi'),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Oksigen()),
                            );
                          },
                        ),
                        ListTile(
                          leading: FaIcon(FontAwesomeIcons.medkit),
                          title: Text('Form'),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FormOksigen()),
                            );
                          },
                        ),
                      ],
                    ),
                    ExpansionTile(
                      title: Text("APD"),
                      leading: FaIcon(FontAwesomeIcons.tshirt),
                      children: <Widget>[
                        ListTile(
                          leading: FaIcon(FontAwesomeIcons.tshirt),
                          title: Text('Lokasi'),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyApdPageWidget()),
                            );
                          },
                        ),
                        ListTile(
                          leading: FaIcon(FontAwesomeIcons.tshirt),
                          title: Text('Form'),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ApdFormRoute()),
                            );
                          },
                        ),
                      ],
                    ),
                    ExpansionTile(
                      title: Text("Rumah Sakit"),
                      leading: FaIcon(FontAwesomeIcons.hospital),
                      children: <Widget>[
                        ListTile(
                          leading: FaIcon(FontAwesomeIcons.hospital),
                          title: Text('Lokasi'),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DaftarRS()),
                            );
                          },
                        ),
                        ListTile(
                          leading: FaIcon(FontAwesomeIcons.hospital),
                          title: Text('Form'),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => FormRS()),
                            );
                          },
                        ),
                      ],
                    ),
                    ListTile(
                      leading: Icon(Icons.forum),
                      title: Text('Forum'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Forum()),
                        );
                      },
                    ),
                    ListTile(
                      leading: FaIcon(FontAwesomeIcons.questionCircle),
                      title: Text('FAQ'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyApp()),
                        );
                      },
                    ),
                  ],
                ),
              ),
              body: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        "Apa itu COVID-19?",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            letterSpacing: 0.5,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 50, 20),
                        child: Text(
                          "COVID-19 adalah penyakit menular yang disebabkan oleh jenis coronavirus yang baru ditemukan. Virus baru dan penyakit yang disebabkannya ini tidak dikenal sebelum mulainya wabah di Wuhan, Tiongkok, bulan Desember 2019. COVID-19 ini sekarang menjadi sebuah pandemi yang terjadi di banyak negara di seluruh dunia.",
                          style: TextStyle(letterSpacing: 0.5, fontSize: 14),
                        ),
                      ),
                      const Text(
                        "Apa itu Vaksinasi COVID-19?",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            letterSpacing: 0.5,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(50, 20, 0, 20),
                        child: Text(
                          "Vaksinasi Covid-19 merupakan salah satu upaya pemerintah Indonesia dalam menangani masalah Covid-19. Vaksinasi Covid-19 bertujuan untuk menciptakan kekebalan kelompok (herd immunity) agar masyarakat menjadi lebih produktif dalam menjalankan aktivitas kesehariannya.",
                          textAlign: TextAlign.right,
                          style: TextStyle(letterSpacing: 0.5, fontSize: 14),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset('assets/images/ayo_vaksin.png'),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          primary: Colors.blue,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => BerandaForm() // FormCovid()
                              ));
                        },
                        child: const Text('Input data'),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          primary: Colors.blue,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const VaksinChartsPage()));
                        },
                        child: const Text('Statistik Vaksinasi Indonesia'),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          primary: Colors.blue,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const ChartPage(
                                    title: 'Chart Vaksinasi',
                                  )));
                        },
                        child: const Text('Chart Vaksinasi Indonesia'),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          primary: Colors.blue,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const CovDataPage(
                                    title: 'Data Covid',
                                  )));
                        },
                        child: const Text('Lihat Data Covid'),
                      )
                    ],
                  ),
                ),
              ));

          // @override
          // Widget build(BuildContext context) {
          //   return SingleChildScrollView(
          //     child: Container(
          //       padding: const EdgeInsets.all(30),
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.stretch,
          //         children: [
          //           const Text(
          //             "Apa itu COVID-19?",
          //             textAlign: TextAlign.left,
          //             style: TextStyle(
          //                 letterSpacing: 0.5,
          //                 fontSize: 16,
          //                 fontWeight: FontWeight.w700),
          //           ),
          //           const Padding(
          //             padding: EdgeInsets.fromLTRB(0, 20, 50, 20),
          //             child: Text(
          //               "COVID-19 adalah penyakit menular yang disebabkan oleh jenis coronavirus yang baru ditemukan. Virus baru dan penyakit yang disebabkannya ini tidak dikenal sebelum mulainya wabah di Wuhan, Tiongkok, bulan Desember 2019. COVID-19 ini sekarang menjadi sebuah pandemi yang terjadi di banyak negara di seluruh dunia.",
          //               style: TextStyle(letterSpacing: 0.5, fontSize: 14),
          //             ),
          //           ),
          //           const Text(
          //             "Apa itu Vaksinasi COVID-19?",
          //             textAlign: TextAlign.right,
          //             style: TextStyle(
          //                 letterSpacing: 0.5,
          //                 fontSize: 16,
          //                 fontWeight: FontWeight.w700),
          //           ),
          //           const Padding(
          //             padding: EdgeInsets.fromLTRB(50, 20, 0, 20),
          //             child: Text(
          //               "Vaksinasi Covid-19 merupakan salah satu upaya pemerintah Indonesia dalam menangani masalah Covid-19. Vaksinasi Covid-19 bertujuan untuk menciptakan kekebalan kelompok (herd immunity) agar masyarakat menjadi lebih produktif dalam menjalankan aktivitas kesehariannya.",
          //               textAlign: TextAlign.right,
          //               style: TextStyle(letterSpacing: 0.5, fontSize: 14),
          //             ),
          //           ),
          //           Padding(
          //             padding: const EdgeInsets.all(10),
          //             child: Image.asset('assets/images/ayo_vaksin.png'),
          //           ),

          //           TextButton(
          //             style: TextButton.styleFrom(
          //               primary: Colors.blue,
          //             ),
          //             onPressed: () {
          //               Navigator.of(context)
          //               .push(MaterialPageRoute(builder: (context) => BerandaForm() // FormCovid()
          //               )
          //               );
          //             },
          //             child: const Text('Input data'),
          //           ),

          //           TextButton(
          //             style: TextButton.styleFrom(
          //               primary: Colors.blue,
          //             ),
          //             onPressed: () {
          //               Navigator.of(context)
          //               .push(MaterialPageRoute(builder: (context) => const VaksinChartsPage()
          //               )
          //               );
          //             },
          //             child: const Text('Statistik Vaksinasi Indonesia'),
          //           ),

          //           TextButton(
          //             style: TextButton.styleFrom(
          //               primary: Colors.blue,
          //             ),
          //             onPressed: () {
          //               Navigator.of(context)
          //               .push(MaterialPageRoute(builder: (context) => const ChartPage(title: 'Chart Vaksinasi',)
          //               )
          //               );
          //             },
          //             child: const Text('Chart Vaksinasi Indonesia'),
          //           ),

          //           TextButton(
          //             style: TextButton.styleFrom(
          //               primary: Colors.blue,
          //             ),
          //             onPressed: () {
          //               Navigator.of(context)
          //               .push(MaterialPageRoute(builder: (context) => const CovDataPage(title: 'Data Covid',)
          //               )
          //               );
          //             },
          //             child: const Text('Lihat Data Covid'),
          //           )

          //         ],
          //       ),
          //     ),
          //   );
          // }
        }));
  }
}
