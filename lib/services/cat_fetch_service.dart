import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/cat.dart';

class CatFetchService {
  Future<Cat> getCat() async {
    const String url = 'https://api.thecatapi.com/v1/images/search?has_breeds=1&limit=1';
    final response = await http.get(
        Uri.parse(url),
        headers: {
          'x-api-key': 'live_GMcezuwephZNALCXZ31ICqTp9wgU4S6sIREcPvO93N88KqTc6GyMPDXRnGYmtBHj',
        },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return Cat.fromJson(data[0]);
    } else {
      throw Exception('Failed to fetch cat data, status code: ${response.statusCode}');
    }
  }
}
