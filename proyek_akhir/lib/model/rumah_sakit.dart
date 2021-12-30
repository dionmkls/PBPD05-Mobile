class RumahSakit {
  final int id;
  final String nama;
  final String lokasi;
  final String alamat;
  final String urlGmaps;
  final String noTelp;
  final String tersedia;

  const RumahSakit({
    required this.id,
    required this.nama,
    required this.lokasi,
    required this.alamat,
    required this.urlGmaps,
    required this.noTelp,
    required this.tersedia,
  });

  factory RumahSakit.fromJson(Map<String, dynamic> json) {
    return RumahSakit(
      id: json['id'],
      nama: json['nama'],
      lokasi: json['lokasi'],
      alamat: json['alamat'],
      urlGmaps: json['urlGmaps'],
      noTelp: json['noTelp'],
      tersedia: json['tersedia'],
    );
  }
}