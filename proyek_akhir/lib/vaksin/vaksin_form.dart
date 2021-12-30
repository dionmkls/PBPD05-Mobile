// ignore_for_file: unnecessary_new

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LokasiForm extends StatefulWidget {
  @override
  _LokasiFormState createState() => _LokasiFormState();
}

class _LokasiFormState extends State<LokasiForm> {
  final _formKey = GlobalKey<FormState>();

  bool nilaiSwitchJak = false;
  bool nilaiSwitchBog = false;
  bool nilaiSwitchDep = false;
  bool nilaiSwitchTag = false;
  bool nilaiSwitchBek = false;

  String kota = "";
  String nama = "";
  String url = "";
  String alamat = "";
  String telp = "";
  String jenis = "";
  String syarat = "";

  Future<void> berhasil() async {
    const url = 'https://tk-pbp-d05.herokuapp.com/lokasi-vaksin/add';
    try {
      final response = await http.post(Uri.parse(url),
          body: jsonEncode({
            'kota': kota,
            'nama': nama,
            'url': url,
            'alamat': alamat,
            'telp': int.parse(telp),
            'jenis': jenis,
            'syarat': syarat,
          }));
      Map<String, dynamic> extractedData = jsonDecode(response.body);
      extractedData.forEach((key, value) {
        print(value); // "data berhasil ditambahkan"
      });
    } catch (p) {
      print(p);
    }
  }

  @override
  Widget build(BuildContext context) {
    // final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Penambahan Lokasi Vaksin"),
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
                      hintText: "RS Jakarta",
                      labelText: "Nama Lokasi",
                      icon: const Icon(Icons.location_city_rounded),
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0)),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Nama tidak boleh kosong';
                      }
                      return null;
                    },
                    onChanged: (value) => nama = value,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: new InputDecoration(
                      hintText: "https:// ...",
                      labelText: "URL",
                      icon: const Icon(Icons.link),
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0)),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'URL Maps tidak boleh kosong';
                      }
                      return null;
                    },
                    onChanged: (value) => url = value,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: new InputDecoration(
                      hintText: "Jl. Raya Margonda No. 123",
                      labelText: "Alamat Lengkap",
                      icon: const Icon(Icons.map),
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0)),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Alamat tidak boleh kosong';
                      }
                      return null;
                    },
                    onChanged: (value) => alamat = value,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: new InputDecoration(
                      hintText: "021111111",
                      labelText: "Nomor Telepon",
                      icon: const Icon(Icons.phone),
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0)),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Nomor telepon tidak boleh kosong';
                      }
                      return null;
                    },
                    onChanged: (value) => telp = value,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: new InputDecoration(
                      hintText: "contoh: sinovac",
                      labelText: "Jenis Vaksin",
                      icon: const Icon(Icons.medical_services),
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0)),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Jenis vaksin tidak boleh kosong';
                      }
                      return null;
                    },
                    onChanged: (value) => jenis = value,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: new InputDecoration(
                      hintText: "contoh: di atas umur 18",
                      labelText: "Syarat Peserta",
                      icon: const Icon(Icons.notification_important),
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0)),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Jika tidak ada syarat, ketik "-"';
                      }
                      return null;
                    },
                    onChanged: (value) => syarat = value,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                    "Lokasi vaksin ini berada di kota:\n    (pilih satu kota dibawah ini)",
                    style: TextStyle(
                      fontSize: 16,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                SwitchListTile(
                  title: Text('Jakarta'),
                  subtitle: Text('Lokasi vaksin berada di Jakarta'),
                  value: nilaiSwitchJak,
                  activeTrackColor: Colors.lightBlue[200],
                  activeColor: Colors.blueGrey,
                  onChanged: (value) {
                    setState(() {
                      nilaiSwitchJak = value;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('Bogor'),
                  subtitle: Text('Lokasi vaksin berada di Bogor'),
                  value: nilaiSwitchBog,
                  activeTrackColor: Colors.lightBlue[200],
                  activeColor: Colors.blueGrey,
                  onChanged: (value) {
                    setState(() {
                      nilaiSwitchBog = value;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('Depok'),
                  subtitle: Text('Lokasi vaksin berada di Depok'),
                  value: nilaiSwitchDep,
                  activeTrackColor: Colors.lightBlue[200],
                  activeColor: Colors.blueGrey,
                  onChanged: (value) {
                    setState(() {
                      nilaiSwitchDep = value;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('Tangerang'),
                  subtitle: Text('Lokasi vaksin berada di Tangerang'),
                  value: nilaiSwitchTag,
                  activeTrackColor: Colors.lightBlue[200],
                  activeColor: Colors.blueGrey,
                  onChanged: (value) {
                    setState(() {
                      nilaiSwitchTag = value;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('Bekasi'),
                  subtitle: Text('Lokasi vaksin berada di Bekasi'),
                  value: nilaiSwitchBek,
                  activeTrackColor: Colors.lightBlue[200],
                  activeColor: Colors.blueGrey,
                  onChanged: (value) {
                    setState(() {
                      nilaiSwitchBek = value;
                    });
                  },
                ),
                RaisedButton(
                  child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.blue,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {}

                    // validasi kalo blom pilih kota
                    if (nilaiSwitchJak == false &&
                        nilaiSwitchBog == false &&
                        nilaiSwitchDep == false &&
                        nilaiSwitchTag == false &&
                        nilaiSwitchBek == false) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Pilih salah satu kota!')),
                      );
                    }

                    // validasi kalo pilih lebih dari satu kota
                    List<String> pilihanKota = [];

                    if (nilaiSwitchJak) {
                      pilihanKota.add("Jakarta");
                      kota = "Jakarta";
                    }
                    if (nilaiSwitchBog) {
                      pilihanKota.add("Bogor");
                      kota = "Bogor";
                    }
                    if (nilaiSwitchDep) {
                      pilihanKota.add("Depok");
                      kota = "Depok";
                    }
                    if (nilaiSwitchTag) {
                      pilihanKota.add("Tangerang");
                      kota = "Tangerang";
                    }
                    if (nilaiSwitchBek) {
                      pilihanKota.add("Bekasi");
                      kota = "Bekasi";
                    }

                    if (pilihanKota.length > 1) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                  'Hanya boleh memilih satu kota!\nKota yang dipilih:'),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: pilihanKota
                                    .map((kota) => Text("- " + kota))
                                    .toList(),
                              ),
                            ],
                          ),
                        ),
                      );
                      return;
                    }

                    if (_formKey.currentState!.validate()) {
                      // Jika form valid, tampilkan sebuah snackbar
                      // dan simpan data dalam database/server
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Lokasi vaksin telah ditambahkan')),
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
