import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import './detail_rs.dart';
import './add_rs.dart';
import '../models/rumah_sakit.dart';
import '../dummy_data.dart';

class DaftarRS extends StatefulWidget {
  const DaftarRS({Key? key}) : super(key: key);
  static const ROUTE_NAME = '/daftar-rumah-sakit';

  final List<RumahSakit> daftarRSTersedia;

  @override
  _DaftarRSState createState() => _DaftarRSState();
}

class _DaftarRSState extends State<DaftarRS> {
  List<RumahSakit> dummyRumahSakit = Dummy_;
  var _loadedInitData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      displayedRS = widget.daftarRSTersedia.where((rs) {
        return rs.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Hello World!"),
    );
  }
}