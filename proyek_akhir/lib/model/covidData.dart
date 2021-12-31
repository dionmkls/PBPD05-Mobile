import 'dart:convert';

import 'package:http/http.dart' as http;

class CovidData {

  Future<List> getAllCovidData() async {
    String retrieveUrl = 'https://tk-pbp-d05.herokuapp.com/beranda/jsonAllCovData/';
    // String retrieveUrl = "http://127.0.0.1:8000/beranda/jsonAllCovData/";

    try {
      var response = await http.get(Uri.parse(retrieveUrl));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server Error');
      }
    } catch (e) {
      return Future.error(e);
    }
  }


  Future getVaksinData() async {
    String retrieveUrl = 'https://tk-pbp-d05.herokuapp.com/beranda/getVaksinData/';
    // String retrieveUrl = "http://127.0.0.1:8000/beranda/getVaksinData/";

    try {
      var response = await http.get(Uri.parse(retrieveUrl));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server Error');
      }
    } catch (e) {
      return Future.error(e);
    }
  }

}
