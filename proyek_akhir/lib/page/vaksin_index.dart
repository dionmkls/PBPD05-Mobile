import 'dart:collection';

import 'package:flutter/material.dart';
import 'dart:convert';
import '../model/vaksin.dart';
import '../model/vaksin_card.dart';
import 'vaksin_form.dart';
import 'package:http/http.dart' as http;

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

  Future<void> deleteData(String kota, int id) async {
    String url =
        'https://tk-pbp-d05.herokuapp.com/lokasi-vaksin/flutter-web-service?from=flutter&tujuan=delete&kota=' +
            kota +
            '&id=' +
            id.toString();
    try {
      final response = await http.get(Uri.parse(url));
      Map<String, dynamic> data = jsonDecode(response.body);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(data['nama'] + ' berhasil dihapus')),
      );

      clearData();
      getData();
    } catch (p) {
      print(p);
    }
  }

  void clearData() {
    locationsJak.clear();
    locationsBog.clear();
    locationsDep.clear();
    locationsTag.clear();
    locationsBek.clear();
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
        actions: <Widget>[
          IconButton(
            // buat masuk ke halaman form
            icon: const Icon(Icons.navigate_next),
            tooltip: 'Go to the next page',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return Scaffold(
                    body: LokasiForm(),
                  );
                },
              ));
            },
          ),
        ],
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
