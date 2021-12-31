import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

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
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.home),
            tooltip: 'Beranda',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is Beranda')));
            },
          ),
          IconButton(
            icon: const Icon(Icons.apps),
            tooltip: 'Fitur',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is Fitur')));
            },
          ),
          IconButton(
            icon: const Icon(Icons.speaker_notes),
            tooltip: 'Forum',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is Forum')));
            },
          ),
          IconButton(
            icon: const Icon(Icons.help),
            tooltip: 'FAQ',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is FAQ')));
            },
          ),
        ],
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