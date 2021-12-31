import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// import './rs_form.dart';
import '../model/rumah_sakit.dart';

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
        'https://tk-pbp-d05.herokuapp.com/rumah-sakit/flutter-rs?from=flutter&to=data';
    try {
      final response = await http.get(Uri.parse(url));
      Map<String, dynamic> data = jsonDecode(response.body);

      for (var i = 0; i < data.length; i++) {
        if (data[i]['lokasi'] == 'JA') {
          lokasiJA.add(
            RumahSakit(
              i,
              data[i]['nama'],
              data[i]['lokasi'],
              data[i]['alamat'],
              data[i]['url_gmaps'],
              data[i]['no_telp'],
              data[i]['tersedia'],
            )
          );
        }
      }
      for (var i = 0; i < data.length; i++) {
        if (data[i]['lokasi'] == 'BO') {
          lokasiBO.add(
            RumahSakit(
              i,
              data[i]['nama'],
              data[i]['lokasi'],
              data[i]['alamat'],
              data[i]['url_gmaps'],
              data[i]['no_telp'],
              data[i]['tersedia'],
            )
          );
        }
      }
      for (var i = 0; i < data.length; i++) {
        if (data[i]['lokasi'] == 'DE') {
          lokasiDE.add(
            RumahSakit(
              i,
              data[i]['nama'],
              data[i]['lokasi'],
              data[i]['alamat'],
              data[i]['url_gmaps'],
              data[i]['no_telp'],
              data[i]['tersedia'],
            )
          );
        }
      }
      for (var i = 0; i < data.length; i++) {
        if (data[i]['lokasi'] == 'TA') {
          lokasiTA.add(
            RumahSakit(
              data[i]['id'],
              data[i]['nama'],
              data[i]['lokasi'],
              data[i]['alamat'],
              data[i]['url_gmaps'],
              data[i]['no_telp'],
              data[i]['tersedia'],
            )
          );
        }
      }
      for (var i = 0; i < data.length; i++) {
        if (data[i]['lokasi'] == 'BEK') {
          lokasiBEK.add(
            RumahSakit(
              i,
              data[i]['nama'],
              data[i]['lokasi'],
              data[i]['alamat'],
              data[i]['url_gmaps'],
              data[i]['no_telp'],
              data[i]['tersedia'],
            )
          );
        }
      }
      for (var i = 0; i < data.length; i++) {
        if (data[i]['lokasi'] == 'L') {
          lokasiL.add(
            RumahSakit(
              i,
              data[i]['nama'],
              data[i]['lokasi'],
              data[i]['alamat'],
              data[i]['url_gmaps'],
              data[i]['no_telp'],
              data[i]['tersedia'],
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
    return Container(
      child: Center(
        child: Text(
          lokasi,
          style: TextStyle(
            fontSize: 18,
            color: Colors.blue[700],
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: new BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Text(
                  'Di bawah ini adalah daftar Rumah Sakit yang berada di Indonesia.'
                ),
              ),

              lokasiTitle('Jakarta'),
              Container(
                decoration: new BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                    children: lokasiJA.map((rs) => rumahSakitCard(context, rs)).toList(),
                  ),
              ),

              lokasiTitle('Bogor'),
              Container(
                decoration: new BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: lokasiBO.map((rs) => rumahSakitCard(context, rs)).toList(),
                ),
              ),

              lokasiTitle('Depok'),
              Container(
                decoration: new BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: lokasiDE.map((rs) => rumahSakitCard(context, rs)).toList(),
                ),
              ),

              lokasiTitle('Tangerang'),
              Container(
                decoration: new BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: lokasiTA.map((rs) => rumahSakitCard(context, rs)).toList(),
                ),
              ),

              lokasiTitle('Bekasi'),
              Container(
                decoration: new BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: lokasiBEK.map((rs) => rumahSakitCard(context, rs)).toList(),
                ),
              ),

              lokasiTitle('Luar Jabodetabek'),
              Container(
                decoration: new BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: lokasiL.map((rs) => rumahSakitCard(context, rs)).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_location_rounded),
        onPressed: () => {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FormRS())),
        },
      ),
    );
  }
}
