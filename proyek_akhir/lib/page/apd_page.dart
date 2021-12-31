import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:proyek_akhir/model/apd_card.dart';
import 'package:proyek_akhir/page/apd_form.dart';
import 'package:proyek_akhir/page/forum.dart';
import 'package:proyek_akhir/page/home_page.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'form_oksigen.dart';
import 'oksigen.dart';
import 'vaksin_form.dart';
import 'vaksin_index.dart';
import 'rs_form.dart';
import 'rs_page.dart';
import 'faq.dart';

class MyApdPageWidget extends StatefulWidget {
  const MyApdPageWidget({Key? key}) : super(key: key);

  @override
  _MyApdPageWidgetState createState() => _MyApdPageWidgetState();
}

Future<List<ApdCard>> fetchApdCard() async {
  final response =
      await http.get(Uri.parse('https://tk-pbp-d05.herokuapp.com/apd/json/'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    List<dynamic> data = jsonDecode(response.body);
    if (data.length == 0)
      return <ApdCard>[
        ApdCard(id: 1, jenis: "Apd Kosong", url: "#", harga: 0, gambar: "#")
      ];
    late List<ApdCard> lstApdCard = <ApdCard>[];
    for (int i = 0; i < data.length; i++) {
      lstApdCard.add(ApdCard.fromJson(data[i]));
    }
    return lstApdCard;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load card');
  }
}

class _MyApdPageWidgetState extends State<MyApdPageWidget> {
  late Future<List<ApdCard>> futureApdCard;

  @override
  void initState() {
    super.initState();
    futureApdCard = fetchApdCard();
  }

  Widget textSectionJudul = Container(
    padding: const EdgeInsets.all(32),
    child: const Text(
      'Laman APD',
      softWrap: true,
      style: TextStyle(fontSize: 24),
      textAlign: TextAlign.left,
    ),
  );

  Widget textSection1 = Container(
    padding: const EdgeInsets.only(left: 32, right: 32),
    child: RichText(
      text: const TextSpan(children: <TextSpan>[
        TextSpan(
          text:
              'Alat Pelindung Diri (APD) adalah kelengkapan yang wajib digunakan '
              'Alat Pelindung Diri (APD) adalah kelengkapan yang wajib digunakan '
              'itu sendiri dan orang di sekelilingnya. (',
        ),
        TextSpan(
          text: 'id.wikipedia.org',
        ),
        TextSpan(text: ')')
      ]),
    ),
  );

  Widget apdCardSection(List<ApdCard>? lstApdCard) {
    if (lstApdCard == null) return Container();
    final children = <Widget>[];
    for (int i = 0; i < lstApdCard.length; i++) {
      children.add(apdCardSectionEach(lstApdCard[i]));
    }
    return Column(
      children: children,
    );
  }

  Widget apdCardSectionEach(ApdCard? apdCard) {
    if (apdCard == null) return Container();
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(),
          ),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "${apdCard.jenis}",
                    style: TextStyle(fontSize: 18),
                  )),
              SizedBox(
                height: 8,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Apd berjenis ${apdCard.jenis} "
                    "dengan harga Rp.${apdCard.harga}",
                    style: TextStyle(fontSize: 12),
                  )),
              SizedBox(
                height: 8,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "dapat di pesan di:",
                    style: TextStyle(fontSize: 12),
                  )),
              SizedBox(
                height: 4,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('${apdCard.url}')));
                      },
                      child: Text("DISINI")))
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('AppBar Demo'),
        title: const Text('PBP D05'),
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
        child: Column(
          children: [
            textSectionJudul,
            textSection1,
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Container(
                padding: const EdgeInsets.all(32),
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyApdPageWidget()),
                    );
                  },
                  child: const Text(
                    'Refresh APD',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(32),
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ApdFormRoute()),
                    );
                  },
                  child: const Text(
                    'Tambah APD',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ]),
            Container(
                padding: const EdgeInsets.only(
                  left: 32,
                  right: 32,
                ),
                color: Colors.blue,
                child: Column(children: [
                  const SizedBox(
                    height: 16,
                  ),
                  FutureBuilder<List<ApdCard>>(
                    future: futureApdCard,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return apdCardSection(snapshot.data);
                      } else if (snapshot.hasError) {
                        return Container(
                            child: Column(children: [
                          apdCardSection(<ApdCard>[
                            (ApdCard(
                                id: 0,
                                jenis: 'Contoh Apd',
                                url: '#',
                                harga: 10,
                                gambar: '#'))
                          ]),
                          Text('${snapshot.error}'),
                          const SizedBox(
                            height: 16,
                          ),
                        ]));
                      }

                      // By default, show a loading spinner.
                      return const CircularProgressIndicator();
                    },
                  )
                ])),
          ],
        ),
      ),
    );
  }
}
