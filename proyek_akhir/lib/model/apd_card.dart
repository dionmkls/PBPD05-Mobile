import 'package:flutter/material.dart';

class ApdCard {
  final int id;
  final String jenis;
  final String url;
  final int harga;
  final String gambar;

  ApdCard({
    required this.id,
    required this.jenis,
    required this.url,
    required this.harga,
    required this.gambar
  });

  factory ApdCard.fromJson(Map<String, dynamic> json) {
    return ApdCard(
      id: json['pk'],
      jenis: json['fields']['jenis'],
      url: json['fields']['lokasi'],
      harga: json['fields']['harga'],
      gambar: json['fields']['img_source'],
    );
  }
}