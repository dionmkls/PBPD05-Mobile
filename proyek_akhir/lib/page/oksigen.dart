import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:proyek_akhir/page/forum.dart';

import 'form_oksigen.dart';
import 'apd_form.dart';
import 'apd_page.dart';
import 'package:proyek_akhir/page/home_page.dart';
import 'package:proyek_akhir/api/album_api.dart';
import 'vaksin_form.dart';
import 'vaksin_index.dart';
import 'rs_form.dart';
import 'rs_page.dart';
import 'faq.dart';
import '../model/oksigen_model.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Size screenSize(BuildContext context) {
  return MediaQuery.of(context).size;
}

double screenWidth(BuildContext context,
    {double dividedBy = 1, double reducedBy = 0.0}) {
  return (screenSize(context).width - reducedBy) / dividedBy;
}

double screenHeight(BuildContext context,
    {double dividedBy = 1, double reducedBy = 0.0}) {
  return (screenSize(context).height - reducedBy) / dividedBy;
}

double screenHeightExcludingToolbar(BuildContext context,
    {double dividedBy = 1}) {
  return screenHeight(context, dividedBy: dividedBy, reducedBy: kToolbarHeight);
}

void main() {
  runApp(Oksigen());
}

class Oksigen extends StatelessWidget {
  const Oksigen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyStatefulWidget());
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key? key}) : super(key: key);
  @override
  MyState createState() => MyState();
}

class MyState extends State<MyStatefulWidget> {
  int light = 1;
  late Future<Album> futureAlbum;
  //Album album = Album(url: "Kosong", address: "Kosong", phone: "Kosong", domisili: "Kosong");
  Brightness _brightness = Brightness.light;
  static const warnagradien = LinearGradient(colors: <Color>[Color(0xff71b7e6), Color(0xff9b59b6)]);
  //final myController = TextEditingController();
  List<Album> albumList = [];
  final children = <Widget>[];

  void getAlbumfromApi() async {
    AlbumApi.getAlbum().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        albumList = list.map((model) => Album.fromJson(model)).toList();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getAlbumfromApi();
  }


  void _onItemTapped() {
    setState(() {
      light ^= 1;
      if (light == 0) {
        _brightness = Brightness.dark;
      } else {
        _brightness = Brightness.light;
      }
    });
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Peringatan!"),
          content: new Text(
              "Penyuntingan data hanya boleh dilakukan oleh administrator"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new TextButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: _brightness,
        primaryColor: Colors.lightBlue[800],
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('''PBP D-05'''),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.dark_mode),
              tooltip: 'dark mode',
              onPressed: _onItemTapped,
            ),
          ],
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
                    child: Center(
                        child: Column(
                            children: <Widget>[
                                Container(
                                    child: Text(
                                        "Jakarta",
                                        style: GoogleFonts.balooBhaina(
                                            fontSize: 25,
                                        )
                                    ),
                                ),
                                for (var item in albumList)
                                    if (item.domisili == "Jakarta")
                                        Card(
                                            clipBehavior: Clip.antiAlias,
                                            child: Column(
                                                children: [
                                                    Image.asset('assets/posisi.png'),
                                                    ListTile(
                                                        leading: FaIcon(FontAwesomeIcons.globe),
                                                        title: Text(item.url),
                                                    ),    
                                                    ListTile(
                                                        leading: Icon(Icons.home),
                                                        title: Text(item.alamat),
                                                    ),  
                                                    ListTile(
                                                        leading: Icon(Icons.phone),
                                                        title: Text(item.telepon),
                                                    ),                                                      
                                                ],
                                            ),
                                        ),
                            

                                Container(
                                    child: Text(
                                        "Bogor",
                                        style: GoogleFonts.balooBhaina(
                                            fontSize: 25,
                                        )
                                    ),
                                ),
                                for (var item in albumList)
                                    if (item.domisili == "Bogor")
                                        Card(
                                            clipBehavior: Clip.antiAlias,
                                            child: Column(
                                                children: [
                                                    Image.asset('assets/posisi.png'),
                                                    ListTile(
                                                        leading: FaIcon(FontAwesomeIcons.globe),
                                                        title: Text(item.url),
                                                    ),    
                                                    ListTile(
                                                        leading: Icon(Icons.home),
                                                        title: Text(item.alamat),
                                                    ),  
                                                    ListTile(
                                                        leading: Icon(Icons.phone),
                                                        title: Text(item.telepon),
                                                    ),                                                      
                                                ],
                                            ),
                                        ),

                                
                                Container(
                                    child: Text(
                                        "Depok",
                                        style: GoogleFonts.balooBhaina(
                                            fontSize: 25,
                                        )
                                    ),
                                ),
                                for (var item in albumList)
                                    if (item.domisili == "Depok")
                                        Card(
                                            clipBehavior: Clip.antiAlias,
                                            child: Column(
                                                children: [
                                                    Image.asset('assets/posisi.png'),
                                                    ListTile(
                                                        leading: FaIcon(FontAwesomeIcons.globe),
                                                        title: Text(item.url),
                                                    ),    
                                                    ListTile(
                                                        leading: Icon(Icons.home),
                                                        title: Text(item.alamat),
                                                    ),  
                                                    ListTile(
                                                        leading: Icon(Icons.phone),
                                                        title: Text(item.telepon),
                                                    ),                                                      
                                                ],
                                            ),
                                        ),

                                
                                Container(
                                    child: Text(
                                        "Tangerang",
                                        style: GoogleFonts.balooBhaina(
                                            fontSize: 25,
                                        )
                                    ),
                                ),
                                for (var item in albumList)
                                    if (item.domisili == "Tangerang")
                                        Card(
                                            clipBehavior: Clip.antiAlias,
                                            child: Column(
                                                children: [
                                                    Image.asset('assets/posisi.png'),
                                                    ListTile(
                                                        leading: FaIcon(FontAwesomeIcons.globe),
                                                        title: Text(item.url),
                                                    ),    
                                                    ListTile(
                                                        leading: Icon(Icons.home),
                                                        title: Text(item.alamat),
                                                    ),  
                                                    ListTile(
                                                        leading: Icon(Icons.phone),
                                                        title: Text(item.telepon),
                                                    ),                                                      
                                                ],
                                            ),
                                        ),


                                Container(
                                    child: Text(
                                        "Bekasi",
                                        style: GoogleFonts.balooBhaina(
                                            fontSize: 25,
                                        )
                                    ),
                                ),
                                for (var item in albumList)
                                    if (item.domisili == "Bekasi")
                                        Card(
                                            clipBehavior: Clip.antiAlias,
                                            child: Column(
                                                children: [
                                                    Image.asset('assets/posisi.png'),
                                                    ListTile(
                                                        leading: FaIcon(FontAwesomeIcons.globe),
                                                        title: Text(item.url),
                                                    ),    
                                                    ListTile(
                                                        leading: Icon(Icons.home),
                                                        title: Text(item.alamat),
                                                    ),  
                                                    ListTile(
                                                        leading: Icon(Icons.phone),
                                                        title: Text(item.telepon),
                                                    ),                                                      
                                                ],
                                            ),
                                        ),
                            ],
                        ),
                    ),
        ),
        floatingActionButton: new FloatingActionButton(
            elevation: 10.0,
            child: new Icon(Icons.chat),
            backgroundColor: Color(0xFF162A49),
            onPressed: () {
              // TODO
        }),
      ),
    );
  }
}
