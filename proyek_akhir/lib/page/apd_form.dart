import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:proyek_akhir/page/home_page.dart';
import 'form_oksigen.dart';
import 'oksigen.dart';
import 'apd_page.dart';
import 'vaksin_form.dart';
import 'vaksin_index.dart';
import 'rs_form.dart';
import 'rs_page.dart';
import 'faq.dart';

Future<String> kirimApd(Map<String, dynamic> mapPost) async {
  String url = 'https://tk-pbp-d05.herokuapp.com/apd/add-apd-flutter/';
  Map<String, String> headers = new Map<String, String>();
  headers['Accept'] = 'application/json';
  headers['Content-type'] = 'application/json';

  http.Response response = await http.post(
    Uri.parse(url),
    headers: headers,
    body: jsonEncode(mapPost),
  );

  return response.statusCode.toString();
}

class ApdFormRoute extends StatelessWidget {
  ApdFormRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('AppBar Demo'),
        title: Text('PBP D05'),
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
                // TODO
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
      body: ApdFormRouteInner(),
    );
  }
}

class ApdFormRouteInner extends StatefulWidget {
  const ApdFormRouteInner({ Key? key }) : super(key: key);

  @override
  State<ApdFormRouteInner> createState() => _ApdFormRouteInnerState();
}

class _ApdFormRouteInnerState extends State<ApdFormRouteInner> {
  final _formKey = GlobalKey<FormState>();

  late String jenis;
  late String url;
  late int? harga;
  late String gambar; 

  Widget textSectionJudul = Container(
    padding: EdgeInsets.all(32),
    child: Text(
      'Form Menambahkan Penyedia APD',
      softWrap: true,
      style: TextStyle(fontSize: 24),
      textAlign: TextAlign.left,
    ),
  );

  Widget textSection1 = Container(
    padding: EdgeInsets.only(left: 32, right: 32, bottom: 16),
    child: Text(
      'Jika Anda mengetahui situs penyedia APD, ataupun '
      'ingin berbagi link, silahkan isi form ini',
      softWrap: true,
      style: TextStyle(fontSize: 18),
      textAlign: TextAlign.left,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(child: Form(
        key: _formKey,
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: textSectionJudul,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: textSection1,
            ),
            Container(
              color: Colors.blue,
              padding: const EdgeInsets.only(left: 32, right: 32, top: 16, bottom: 16),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: new InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Format: Jenis_APD Penyedia_APD",
                        labelText: "Jenis APD",
                        icon: Icon(Icons.people),
                        border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0)),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Jenis APD tidak boleh kosong';
                        }
                        jenis = value;
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: new InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "https://google.com",
                        labelText: "URL lokasi penyedia APD",
                        icon: Icon(Icons.room),
                        border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0)),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'URL tidak boleh kosong';
                        }
                        url = value;
                        return null;
                    } ,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: new InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Format: Angka saja tanpa titik",
                        labelText: "Harga APD",
                        icon: Icon(Icons.paid),
                        border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0)),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Harga APD tidak boleh kosong';
                        }
                        harga = int.tryParse(value);
                        if (harga == null) {
                          return 'Harga APD haruslah angka';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: new InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Format: Isi # Jika kosong",
                        labelText: "Gambar APD dalam bentuk URL",
                        icon: Icon(Icons.info),
                        border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0)),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          gambar = '#';
                        } else {
                          gambar = value;
                        }
                        
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding( 
                padding: const EdgeInsets.all(32),
                child: ElevatedButton(
                  child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      var mapPost = new Map<String, dynamic>();
                      mapPost['jenis'] = jenis;
                      mapPost['url'] = url;
                      mapPost['harga'] = harga;
                      mapPost['gambar'] = gambar;
                      String statusCode = await kirimApd(mapPost);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Status Code: ${statusCode.toString()}, silahkan pencet refresh Apd'))
                      );
                      Navigator.pop(context);
                    }
                  },
                ),
              )
            )
          ]
        )
      )),
    );
  }
}