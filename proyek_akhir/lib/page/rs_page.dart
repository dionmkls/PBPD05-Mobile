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

Future<RumahSakit> fetchRS() async {
  final response = await http.get(
    Uri.parse('/'),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response, then parse the JSON.
    return RumahSakit.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response, then throw an exception.
    throw Exception('Failed to load rumah sakit');
  }
}

Future<RumahSakit> deleteRS(String id) async {
  final http.Response response = await http.delete(
    Uri.parse('/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON. After deleting,
    // you'll get an empty JSON `{}` response.
    // Don't return `null`, otherwise `snapshot.hasData`
    // will always return false on `FutureBuilder`.
    return RumahSakit.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a "200 OK response",
    // then throw an exception.
    throw Exception('Failed to delete rumah sakit.');
  }
}

class DaftarRS extends StatefulWidget {
  const DaftarRS({Key? key}) : super(key: key);

  @override
  _DaftarRSState createState() => _DaftarRSState();
}

class _DaftarRSState extends State<DaftarRS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          // Navigator.push(context, FormRS()),
        },
      ),
    );
  }
}
