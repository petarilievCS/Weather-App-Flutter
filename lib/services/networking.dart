// ignore_for_file: avoid_print

import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final Uri url;

  NetworkHelper(this.url);

  // Gets data for given location
  Future getData() async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print("Error: ${response.statusCode}");
    }
  }
}
