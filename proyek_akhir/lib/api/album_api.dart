import 'dart:async';
import 'package:http/http.dart' as http;

class AlbumApi {
    static Future getAlbum() {
        Uri uri = Uri.parse("https://tk-pbp-d05.herokuapp.com/tempat-oksigen/json");
        return http.get(uri);
  }
}