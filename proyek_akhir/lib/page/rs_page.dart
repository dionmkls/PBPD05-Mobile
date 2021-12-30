import 'package:flutter/material.dart';
import 'dart:convert';

import 'rs_form.dart';

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
          children: [

          ],
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