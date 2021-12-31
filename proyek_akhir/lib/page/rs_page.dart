import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// import './rs_form.dart';
import '../model/rumah_sakit.dart';

import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'form_oksigen.dart';
import 'oksigen.dart';
import 'forum.dart';
import 'apd_form.dart';
import 'apd_page.dart';
import 'vaksin_form.dart';
import 'vaksin_index.dart';
import 'rs_form.dart';
import 'rs_page.dart';
import 'faq.dart';
import 'home_page.dart';

class DaftarRS extends StatefulWidget {
  const DaftarRS({Key? key}) : super(key: key);

  @override
  _DaftarRSState createState() => _DaftarRSState();
}


class _DaftarRSState extends State<DaftarRS> {
  List<RumahSakit> lokasiJA = [];
  List<RumahSakit> lokasiBO = [];
  List<RumahSakit> lokasiDE = [];
  List<RumahSakit> lokasiTA = [];
  List<RumahSakit> lokasiBEK = [];
  List<RumahSakit> lokasiL = [];

  Future<void> getRSData() async {
    const url =
        'https://tk-pbp-d05.herokuapp.com/rumah-sakit/json/';
    try {
      final response = await http.get(Uri.parse(url));
      Map<String, dynamic> data = jsonDecode(response.body);

      for (var i = 0; i < data.length; i++) {
        if (data[i]['fields']['lokasi'] == 'JA') {
          lokasiJA.add(
            RumahSakit(
              data[i]['pk'],
              data[i]['fields']['nama'],
              data[i]['fields']['lokasi'],
              data[i]['fields']['alamat'],
              data[i]['fields']['url_gmaps'],
              data[i]['fields']['no_telp'],
              data[i]['fields']['tersedia'],
            )
          );
        }
      }
      for (var i = 0; i < data.length; i++) {
        if (data[i]['fields']['lokasi'] == 'BO') {
          lokasiBO.add(
            RumahSakit(
              data[i]['pk'],
              data[i]['fields']['nama'],
              data[i]['fields']['lokasi'],
              data[i]['fields']['alamat'],
              data[i]['fields']['url_gmaps'],
              data[i]['fields']['no_telp'],
              data[i]['fields']['tersedia'],
            )
          );
        }
      }
      for (var i = 0; i < data.length; i++) {
        if (data[i]['fields']['lokasi'] == 'DE') {
          lokasiDE.add(
            RumahSakit(
              data[i]['pk'],
              data[i]['fields']['nama'],
              data[i]['fields']['lokasi'],
              data[i]['fields']['alamat'],
              data[i]['fields']['url_gmaps'],
              data[i]['fields']['no_telp'],
              data[i]['fields']['tersedia'],
            )
          );
        }
      }
      for (var i = 0; i < data.length; i++) {
        if (data[i]['fields']['lokasi'] == 'TA') {
          lokasiTA.add(
            RumahSakit(
              data[i]['pk'],
              data[i]['fields']['nama'],
              data[i]['fields']['lokasi'],
              data[i]['fields']['alamat'],
              data[i]['fields']['url_gmaps'],
              data[i]['fields']['no_telp'],
              data[i]['fields']['tersedia'],
            )
          );
        }
      }
      for (var i = 0; i < data.length; i++) {
        if (data[i]['fields']['lokasi'] == 'BEK') {
          lokasiBEK.add(
            RumahSakit(
              data[i]['pk'],
              data[i]['fields']['nama'],
              data[i]['fields']['lokasi'],
              data[i]['fields']['alamat'],
              data[i]['fields']['url_gmaps'],
              data[i]['fields']['no_telp'],
              data[i]['fields']['tersedia'],
            )
          );
        }
      }
      for (var i = 0; i < data.length; i++) {
        if (data[i]['fields']['lokasi'] == 'L') {
          lokasiL.add(
            RumahSakit(
              data[i]['pk'],
              data[i]['fields']['nama'],
              data[i]['fields']['lokasi'],
              data[i]['fields']['alamat'],
              data[i]['fields']['url_gmaps'],
              data[i]['fields']['no_telp'],
              data[i]['fields']['tersedia'],
            )
          );
        }
      }

      setState(() {
        lokasiJA = lokasiJA;
        lokasiBO = lokasiBO;
        lokasiDE = lokasiDE;
        lokasiTA = lokasiTA;
        lokasiBEK = lokasiBEK;
        lokasiL = lokasiL;
      });
      print('Berhasil get data');
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRSData();
  }

  Widget lokasiTitle(String lokasi) {
    return Center(
      child: Text(
        lokasi,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          letterSpacing: 2,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Rumah Sakit'),
      ),
      drawer: makeNavbar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20,20,20,0),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(8.0),
                child: const Text(
                  'Di bawah ini adalah daftar Rumah Sakit yang berada di Indonesia.',
                  style: TextStyle(
                    fontSize: 16,
                    letterSpacing: 1,
                  ),
                ),
              ),

              lokasiTitle('Jakarta'),
              Column(
                children: 
                  // lokasiJA.map((rs) => rumahSakitCard(context, rs)).toList(),
                  [
                    rumahSakitCard(context, const RumahSakit(1, 'Tes Jakarta 1', 'JA', 'alamat Jakarta 1', 'https://jakarta1', '021-xxx', 'IK')),
                    rumahSakitCard(context, const RumahSakit(1, 'Tes Jakarta 2', 'JA', 'alamat Jakarta 2', 'https://jakarta2', '021-xxx', 'IK')),
                    rumahSakitCard(context, const RumahSakit(1, 'Tes Jakarta 3', 'JA', 'alamat Jakarta 3', 'https://jakarta3', '021-xxx', 'IK')),
                  ],
              ),

              lokasiTitle('Bogor'),
              Column(
                children: 
                  // lokasiBO.map((rs) => rumahSakitCard(context, rs)).toList(),
                  [
                    rumahSakitCard(context, const RumahSakit(1, 'Tes Bogor 1', 'BO', 'alamat Bogor 1', 'https://bogor1', '021-xxx', 'IK')),
                  ],
              ),

              lokasiTitle('Depok'),
              Column(
                children: 
                  // lokasiDE.map((rs) => rumahSakitCard(context, rs)).toList(),
                  [
                    rumahSakitCard(context, const RumahSakit(1, 'Tes Depok 1', 'DE', 'alamat Depok 1', 'https://depok1', '021-xxx', 'IK')),
                  ],
              ),

              lokasiTitle('Tangerang'),
              Column(
                children: 
                  // lokasiTA.map((rs) => rumahSakitCard(context, rs)).toList(),
                  [
                    rumahSakitCard(context, const RumahSakit(1, 'Tes Tangerang 1', 'TA', 'alamat Tangerang 1', 'https://tangerang1', '021-xxx', 'IK')),
                  ],
              ),

              lokasiTitle('Bekasi'),
              Column(
                children: 
                  // lokasiBEK.map((rs) => rumahSakitCard(context, rs)).toList(),
                  [
                    rumahSakitCard(context, const RumahSakit(1, 'Tes Bekasi 1', 'BEK', 'alamat Bekasi 1', 'https://bekasi1', '021-xxx', 'IK')),
                  ],
              ),

              lokasiTitle('Luar Jabodetabek'),
              Column(
                children: 
                  // lokasiL.map((rs) => rumahSakitCard(context, rs)).toList(),
                  [
                    rumahSakitCard(context, const RumahSakit(1, 'Tes L 1', 'L', 'alamat L 1', 'https://l1', '021-xxx', 'IK')),
                  ],
              ),

              // FloatingActionButton(
              //   child: const Icon(Icons.refresh),
              //   onPressed: () => {
              //     Navigator.pop(context),
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (context) => const DaftarRS())),
              //   },
              // ),
              FloatingActionButton(
                child: Icon(Icons.add_location_rounded),
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FormRS())),
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget makeNavbar(BuildContext context) {
  return Drawer(
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
                  MaterialPageRoute(builder: (context) => LokasiForm()),
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
                  MaterialPageRoute(builder: (context) => Oksigen()),
                );
              },
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.medkit),
              title: Text('Form'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FormOksigen()),
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
                  MaterialPageRoute(builder: (context) => ApdFormRoute()),
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
                  MaterialPageRoute(builder: (context) => DaftarRS()),
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
  );
}
