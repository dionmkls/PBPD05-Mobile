import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:proyek_akhir/page/forum.dart';
import 'dart:convert';
import '../model/vaksin.dart';
import '../model/vaksin_card.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'form_oksigen.dart';
import 'oksigen.dart';
import 'apd_form.dart';
import 'apd_page.dart';
import 'vaksin_form.dart';
import 'vaksin_index.dart';
import 'rs_form.dart';
import 'rs_page.dart';
import 'faq.dart';
import 'home_page.dart';

class Vaksin extends StatefulWidget {
  Vaksin({Key? key}) : super(key: key);

  @override
  State<Vaksin> createState() => _VaksinState();
}

class _VaksinState extends State<Vaksin> {
  List<LokasiVaksin> locationsJak = [];
  List<LokasiVaksin> locationsBog = [];
  List<LokasiVaksin> locationsDep = [];
  List<LokasiVaksin> locationsTag = [];
  List<LokasiVaksin> locationsBek = [];

  Future<void> getData() async {
    const url =
        'https://tk-pbp-d05.herokuapp.com/lokasi-vaksin/flutter-web-service?from=flutter&tujuan=data';
    try {
      final response = await http.get(Uri.parse(url));
      Map<String, dynamic> data = jsonDecode(response.body);

      var Jak = data['Jak'];
      var Bog = data['Bog'];
      var Dep = data['Dep'];
      var Tag = data['Tag'];
      var Bek = data['Bek'];

      for (var i = 0; i < Jak.length; i++) {
        locationsJak.add(LokasiVaksin(
            'Jakarta',
            Jak[i]['nama'],
            Jak[i]['alamat'],
            Jak[i]['nomorTelp'],
            Jak[i]['jenis'],
            Jak[i]['syaratPeserta'],
            Jak[i]['url'],
            Jak[i]['id']));
      }
      for (var i = 0; i < Bog.length; i++) {
        locationsBog.add(LokasiVaksin(
            'Bogor',
            Bog[i]['nama'],
            Bog[i]['alamat'],
            Bog[i]['nomorTelp'],
            Bog[i]['jenis'],
            Bog[i]['syaratPeserta'],
            Bog[i]['url'],
            Bog[i]['id']));
      }
      for (var i = 0; i < Dep.length; i++) {
        locationsDep.add(LokasiVaksin(
            'Depok',
            Dep[i]['nama'],
            Dep[i]['alamat'],
            Dep[i]['nomorTelp'],
            Dep[i]['jenis'],
            Dep[i]['syaratPeserta'],
            Dep[i]['url'],
            Dep[i]['id']));
      }
      for (var i = 0; i < Tag.length; i++) {
        locationsTag.add(LokasiVaksin(
            'Tangerang',
            Tag[i]['nama'],
            Tag[i]['alamat'],
            Tag[i]['nomorTelp'],
            Tag[i]['jenis'],
            Tag[i]['syaratPeserta'],
            Tag[i]['url'],
            Tag[i]['id']));
      }
      for (var i = 0; i < Bek.length; i++) {
        locationsBek.add(LokasiVaksin(
            'Bekasi',
            Bek[i]['nama'],
            Bek[i]['alamat'],
            Bek[i]['nomorTelp'],
            Bek[i]['jenis'],
            Bek[i]['syaratPeserta'],
            Bek[i]['url'],
            Bek[i]['id']));
      }

      setState(() {
        locationsJak = locationsJak;
        locationsBog = locationsBog;
        locationsDep = locationsDep;
        locationsTag = locationsTag;
        locationsBek = locationsBek;
      });
    } catch (p) {
      print(p);
    }
  }

  @override
  void initState() {
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PBP D-05'),
        backgroundColor: Colors.blue[200],
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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(20),
                child: const Text(
                  'Vaksin',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: const Text(
                  'Dibawah ini adalah lokasi vaksin di Jabodetabek. Dibawah ini adalah lokasi vaksin di Jabodetabek. Dibawah ini adalah lokasi vaksin di Jabodetabek. Dibawah ini adalah lokasi vaksin di Jabodetabek. Dibawah ini adalah lokasi vaksin di Jabodetabek. ',
                  style: TextStyle(
                    letterSpacing: 1,
                    fontSize: 12,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Vaksin()),
                    );
                  },
                  child: const Text('Refresh'),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      onPrimary: Colors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      )),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
                child: const Center(
                    child: Text(
                  'Jakarta',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 2,
                  ),
                )),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children:
                    locationsJak.map((lokasi) => VaksinCard(lokasi)).toList(),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: const Center(
                    child: Text(
                  'Bogor',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 2,
                  ),
                )),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children:
                    locationsBog.map((lokasi) => VaksinCard(lokasi)).toList(),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: const Center(
                    child: Text(
                  'Depok',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 2,
                  ),
                )),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children:
                    locationsDep.map((lokasi) => VaksinCard(lokasi)).toList(),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: const Center(
                    child: Text(
                  'Tangerang',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 2,
                  ),
                )),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children:
                    locationsTag.map((lokasi) => VaksinCard(lokasi)).toList(),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: const Center(
                    child: Text(
                  'Bekasi',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 2,
                  ),
                )),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children:
                    locationsBek.map((lokasi) => VaksinCard(lokasi)).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
