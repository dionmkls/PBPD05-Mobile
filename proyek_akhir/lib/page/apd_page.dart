import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:proyek_akhir/model/apd_card.dart';
import 'package:proyek_akhir/page/apd_form.dart';

class MyApdPageWidget extends StatefulWidget {
  const MyApdPageWidget({ Key? key }) : super(key: key);

  @override
  _MyApdPageWidgetState createState() => _MyApdPageWidgetState();
}

Future<List<ApdCard>> fetchApdCard() async {
  final response = await http
      .get(Uri.parse('https://tk-pbp-d05.herokuapp.com/apd/json/'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    List<dynamic> data = jsonDecode(response.body);
    if (data.length == 0) return <ApdCard>[ApdCard(id: 1, jenis: "Apd Kosong", url: "#", harga: 0, gambar: "#")];
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
      text: const TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: 'Alat Pelindung Diri (APD) adalah kelengkapan yang wajib digunakan '
            'Alat Pelindung Diri (APD) adalah kelengkapan yang wajib digunakan '
            'itu sendiri dan orang di sekelilingnya. (',
          ),
          TextSpan(
            text: 'id.wikipedia.org',
          ),
          TextSpan(text: ')')
        ]
      ),
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
                child: Text("${apdCard.jenis}", style: TextStyle(fontSize: 18), )
              ),
                SizedBox(height: 8,),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Apd berjenis ${apdCard.jenis} "
                    "dengan harga Rp.${apdCard.harga}",
                    style: TextStyle(fontSize: 12),
                  )
                ),
                SizedBox(height: 8,),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "dapat di pesan di:",
                    style: TextStyle(fontSize: 12),
                  )
                ),
                SizedBox(height: 4,),
                Align(
                  alignment: Alignment.topLeft,
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('${apdCard.url}'))
                      );
                    },
                    child: Text("DISINI")
                  )
                )
              ],
            ),
        ),
        const SizedBox(height: 16,),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('AppBar Demo'),
        title: const Text('PBP D05'),
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
      // body: const MyTable(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            textSectionJudul,
            textSection1,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.all(32),
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyApdPageWidget()),
                      );
                    },
                    child: const Text('Refresh APD', textAlign: TextAlign.center,),
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
                    child: const Text('Tambah APD', textAlign: TextAlign.center,),
                  ),
                ),
              ]
            ),
            Container(
              padding: const EdgeInsets.only(left: 32, right: 32,),
              color: Colors.blue,
              child: Column(
                children: [
                  const SizedBox(height: 16,),
                  FutureBuilder<List<ApdCard>>(
                    future: futureApdCard,
                    builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return apdCardSection(snapshot.data);
                    } else if (snapshot.hasError) {
                      return Container(
                        child: Column(
                          children: [
                            apdCardSection(<ApdCard>[(ApdCard(id: 0, jenis: 'Contoh Apd', url: '#', harga: 10, gambar: '#'))]),
                            Text('${snapshot.error}'),
                            const SizedBox(height: 16,),
                          ]
                        )
                      );
                    }

                    // By default, show a loading spinner.
                    return const CircularProgressIndicator();
                    },
                  )
                ]
              )
            ),
          ],
        ),

      ),
    );
  }
}