

class Album {
    String url;
    String alamat;
    String telepon;
    String domisili;


    Album.fromJson(Map json) :
        url = json['fields']['url'],
        alamat = json['fields']['alamat'],
        telepon = json['fields']['telepon'],
        domisili = json['fields']['domisili'];
    
    Map toJson(){
        return {
            'url': url,
            'alamat': alamat,
            'telepon': telepon,
            'domisili': domisili
        };
    }
}