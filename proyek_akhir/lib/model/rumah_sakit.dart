import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../page/rs_form.dart';

class RumahSakit {
  final int id;
  final String nama;
  final String lokasi;
  final String alamat;
  final String urlGmaps;
  final String noTelp;
  final String tersedia;

  const RumahSakit(
    this.id,
    this.nama,
    this.lokasi,
    this.alamat,
    this.urlGmaps,
    this.noTelp,
    this.tersedia,
  );
}

Future<void> deleteRS(BuildContext context, int id) async {
  String url = 'https://tk-pbp-d05.herokuapp.com/rumah-sakit/flutter-rs?from=flutter&to=delete&id=${id.toString()}';
  try {
    final response = await http.get(Uri.parse(url));
    Map<String, dynamic> data = jsonDecode(response.body);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(data['nama'] +
            ' berhasil dihapus.')),
      );
    print('berhasil dihapus');
  } catch (e) {
    print(e);
  }
}

Widget rumahSakitCard(BuildContext context ,RumahSakit? rsData) {
  if (rsData == null) return Container();
  return Card(
    margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical:10.0),
    color: Colors.blue[200],
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            rsData.nama,
            style: TextStyle(
              fontSize: 20,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            'Alamat: ${rsData.alamat}',
            style: TextStyle(
              fontSize: 14,
              color: Colors.blue[800],
              letterSpacing: 0.7,
            ),
          ),
          Text(
            'Url Gmaps: ${rsData.urlGmaps}',
            style: TextStyle(
              fontSize: 14,
              color: Colors.blue[800],
              letterSpacing: 0.7,
            ),
          ),
          Text(
            'No. Telp: ${rsData.noTelp}',
            style: TextStyle(
              fontSize: 14,
              color: Colors.blue[800],
              letterSpacing: 0.7,
            ),
          ),
          Text(
            'Tersedia: ${rsData.tersedia}',
            style: TextStyle(
              fontSize: 14,
              color: Colors.blue[800],
              letterSpacing: 0.7,
            ),
          ),
          Container(
            color: Colors.red,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FormRSEdit(rsData.id)));
              },
              child: Text('Edit'),
            ),
          ),
          Container(
            color: Colors.red,
            child: ElevatedButton(
              onPressed: () {
                deleteRS(context, rsData.id);
              },
              child: Text('Hapus'),
            ),
          ),
        ],
      ),
    ),
  );
}

List<DropdownMenuItem<String>> get dropdownItemsLokasi{
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("Jakarta"),value: "JA"),
    DropdownMenuItem(child: Text("Bogor"),value: "BO"),
    DropdownMenuItem(child: Text("Depok"),value: "DE"),
    DropdownMenuItem(child: Text("Tangerang"),value: "TA"),
    DropdownMenuItem(child: Text("Bekasi"),value: "BEK"),
    DropdownMenuItem(child: Text("Luar Jabodetabek"),value: "L"),
  ];
  return menuItems;
}
List<DropdownMenuItem<String>> get dropdownItemsTersedia{
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("ICU"),value: "I"),
    DropdownMenuItem(child: Text("Kamar"),value: "K"),
    DropdownMenuItem(child: Text("ICU dan Kamar"),value: "IK"),
  ];
  return menuItems;
}