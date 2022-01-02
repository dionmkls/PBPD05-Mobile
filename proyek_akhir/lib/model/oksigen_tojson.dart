

class JSON{
  final String url;
  final String alamat;
  final String telepon;
  final String domisili;

  JSON({
      required this.url,
      required this.alamat,
      required this.telepon,
      required this.domisili,
    });

  factory JSON.fromJson(Map<String, dynamic> json) {
    return JSON(
      url: json['fields']['url'],
      alamat: json['fields']['alamat'],
      telepon: json['fields']['telepon'],
      domisili: json['fields']['domisili'],
    );
  }

  Map<String, dynamic> toJson() => {
      'url': url,
      'alamat': alamat,
      'telepon': telepon,
      'domisili': domisili,
  };
}