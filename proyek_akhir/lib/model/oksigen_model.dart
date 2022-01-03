import '../page/form_oksigen.dart';
import'package:flutter/cupertino.dart';
import'package:flutter/material.dart';
import'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


class Album {
  final String url;
  final String address;
  final String phone;
  final String domisili;


  Album({
    required this.url,
    required this.address,
    required this.phone,
    required this.domisili,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      url: json['url'],
      address: json['address'],
      phone: json['phone'],
      domisili: json['domisili'],
    );
  }
}