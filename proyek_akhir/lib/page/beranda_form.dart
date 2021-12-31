import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class BerandaForm extends StatefulWidget {
  @override
  _BerandaFormState createState() => _BerandaFormState();
}

class _BerandaFormState extends State<BerandaForm> {
  final _formKey = GlobalKey<FormState>();

  String bulan = "";
  String tahun = "";
  String penambahanKasusPositif = "";
  String positifKumulatif = "";

  Future<void> berhasil() async {
    const url = 'https://tk-pbp-d05.herokuapp.com/beranda/createCovidData/';
    // const url = 'http://127.0.0.1:8000/beranda/createCovidData/';
    try {
      final response = await http.post(Uri.parse(url),
          body: jsonEncode({
            'bulan': bulan,
            'tahun': tahun,
            'penambahanKasusPositif': penambahanKasusPositif,
            'positifKumulatif': positifKumulatif,
          }));
      Map<String, dynamic> extractedData = jsonDecode(response.body);
      extractedData.forEach((key, value) {
        print(value);
      });
    } catch (p) {
      print(p);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Input Data Covid"),
        backgroundColor: Colors.blue[200],
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: new InputDecoration(
                      labelText: "Bulan",
                      icon: const Icon(Icons.calendar_today_outlined),
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0)),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Mohon di isi';
                      }
                      return null;
                    },
                    onChanged: (value) => bulan = value,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: new InputDecoration(
                      labelText: "Tahun",
                      icon: const Icon(Icons.calendar_today_outlined),
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0)),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Mohon di isi';
                      }
                      return null;
                    },
                    onChanged: (value) => tahun = value,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: new InputDecoration(
                      labelText: "Penambahan Kasus Positif",
                      icon: const Icon(Icons.person),
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0)),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Mohon di isi';
                      }
                      return null;
                    },
                    onChanged: (value) => penambahanKasusPositif = value,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: new InputDecoration(
                      labelText: "Kasus Positif Kumulatif",
                      icon: const Icon(Icons.people),
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0)),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Mohon di isi';
                      }
                      return null;
                    },
                    onChanged: (value) => positifKumulatif = value,
                  ),
                ),

                ElevatedButton(
                  child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {

                    if (_formKey.currentState!.validate()) {

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Data berhasil Ditambahkan!')),
                      );
                      berhasil();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
