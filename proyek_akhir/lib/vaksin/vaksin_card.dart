import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'vaksin.dart';

class VaksinCard extends StatefulWidget {
  final LokasiVaksin lokasi; // data statis
  // ignore: use_key_in_widget_constructors
  const VaksinCard(this.lokasi);

  @override
  State<VaksinCard> createState() => _VaksinCardState();
}

class _VaksinCardState extends State<VaksinCard> {
  Future<void> deleteData() async {
    String url =
        'https://tk-pbp-d05.herokuapp.com/lokasi-vaksin/flutter-web-service?from=flutter&tujuan=delete&kota=' +
            widget.lokasi.kota +
            '&id=' +
            widget.lokasi.id.toString();
    try {
      final response = await http.get(Uri.parse(url));
      Map<String, dynamic> data = jsonDecode(response.body);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(data['nama'] +
                ' berhasil dihapus, mohon refresh (hot restart) halaman.')),
      );
      print('berhasil ke delete');
    } catch (p) {
      print(p);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(20, 16, 20, 0),
      color: Colors.grey[200],
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              widget.lokasi.nama,
              style: const TextStyle(
                fontSize: 17,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              'Alamat: ${widget.lokasi.alamat}',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[800],
                letterSpacing: 0.5,
              ),
            ),
            Text(
              'No. Telepon: ${widget.lokasi.nomor}',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[800],
                letterSpacing: 0.5,
              ),
            ),
            Text(
              'Jenis: ${widget.lokasi.jenis}',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[800],
                letterSpacing: 0.5,
              ),
            ),
            Text(
              'Syarat: ${widget.lokasi.syarat}',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[800],
                letterSpacing: 0.5,
              ),
            ),
            Text(
              'URL Maps: ${widget.lokasi.url}',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[800],
                letterSpacing: 0.5,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                deleteData();
              },
              child: const Text('Delete'),
              style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  onPrimary: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
