import 'dart:convert';

import 'package:http/http.dart' as http;

Future<List<dynamic>?> fetchData(String categorie) async {
  try {
    final response = await http.get(Uri.parse(
        'https://saurav.tech/NewsAPI/top-headlines/category/$categorie/in.json'));
    final json = jsonDecode(response.body);
    return json['articles'];
  } catch (e) {
    return null;
  }
}
