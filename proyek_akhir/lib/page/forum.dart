import 'package:flutter/material.dart';
import 'package:proyek_akhir/page/home_page.dart';
import 'dart:convert';
import '../model/forumCard.dart';
import 'package:http/http.dart' as http;

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
import 'faq.dart';
import 'forum.dart';

class Forum extends StatefulWidget {
  Forum({Key? key}) : super(key: key);

  @override
  State<Forum> createState() => _ForumState();
}

Future<ForumCard> fetchData() async {
  final response = await http.get(
      Uri.parse('https://tk-pbp-d05.herokuapp.com/forum/webservice-forum/'));

  if (response.statusCode == 200) {
    return ForumCard.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed');
  }
}

class _ForumState extends State<Forum> {
  final _formKey = GlobalKey<FormState>();

  String title = "";
  String from = "";
  String message = "";
  TextEditingController controllerFrom = new TextEditingController();
  TextEditingController controllerMessage = new TextEditingController();

  @override
  void initState() {
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PBP D-05'),
        backgroundColor: Colors.blue[300],
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
      body: Container(
        margin: EdgeInsets.only(top: 60, left: 16, right: 16),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  'assets/images/illustration.png',
                  width: 100,
                  height: 100,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Selamat Datang di',
                  style: TextStyle(
                    fontSize: 23,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(0, 0, 0, 100),
                    decoration: TextDecoration.none,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'FORUM!',
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(3, 68, 96, 100),
                    fontFamily: 'Inter',
                    decoration: TextDecoration.none,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Forum ini berisi cerita, saran, dan pengalaman dari berbagai kalangan untuk membantu dan menyemangati teman-teman dalam menghadapi pandemi COVID!',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w300,
                    color: Color.fromRGBO(0, 0, 0, 100),
                    fontFamily: 'Inter',
                    decoration: TextDecoration.none,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Title',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Title tidak boleh kosong';
                    }
                    return null;
                  },
                  onChanged: (value) => title = value,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: controllerFrom,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'From',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama pengirim tidak boleh kosong';
                    }
                    return null;
                  },
                  onChanged: (value) => from = value,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: controllerMessage,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Message',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Pesan tidak boleh kosong';
                    }
                    return null;
                  },
                  onChanged: (value) => message = value,
                ),
                SizedBox(
                  height: 20,
                ),
                ConstrainedBox(
                  constraints: BoxConstraints.tightFor(),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(
                        Color.fromRGBO(3, 68, 96, 100),
                      ),
                    ),
                    child: Text(
                      'ADD FORUM',
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 100),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Inter',
                        decoration: TextDecoration.none,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          content: new Container(
                            height: 100,
                            child: new Column(
                              children: <Widget>[
                                new Text("Forum berhasil ditambahkan"),
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('ok')),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget _forumcard(ForumCard? forumCard) {
  //   if (forumCard == null) return Card();
  //   return Card(
  //     margin: EdgeInsets.fromLTRB(16, 16, 16, 16),
  //     child: Padding(
  //       padding: const EdgeInsets.all(12),
  //       child : Column(
  //         crossAxisAlignment: CrossAxisAlignment.stretch,
  //         children: <Widget>[
  //           SizedBox(
  //             height: 35,
  //           ),
  //           Text( "${forumCard.title}",
  //             style: TextStyle(
  //               fontSize: 15,
  //               fontFamily: 'Inter',
  //               fontWeight: FontWeight.w400,
  //               color: Color.fromRGBO(0, 0, 0, 100),
  //               decoration: TextDecoration.none,
  //             ),
  //           ),
  //           SizedBox(
  //             height: 35,
  //           ),
  //           Text( "${forumCard.message}",
  //             style: TextStyle(
  //               fontSize: 12,
  //               fontFamily: 'Inter',
  //               fontWeight: FontWeight.w400,
  //               color: Color.fromRGBO(0, 0, 0, 100),
  //               decoration: TextDecoration.none,
  //             ),
  //           ),
  //           SizedBox(
  //             height: 35,
  //           ),
  //           Text( "-${forumCard.from}",
  //             style: TextStyle(
  //               fontSize: 7,
  //               fontFamily: 'Inter',
  //               fontWeight: FontWeight.w400,
  //               color: Color.fromRGBO(0, 0, 0, 100),
  //               decoration: TextDecoration.none,
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
