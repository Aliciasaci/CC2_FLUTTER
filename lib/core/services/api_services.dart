import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/tag.dart';

class ApiService {
  final String baseUrl = "https://dummyjson.com/products";

  Future<List<Tag>> fetchData() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['products'];
      return jsonResponse.map((product) => Tag.fromJson(product)).toList();
    } else {
      throw Exception('Failed to load tags');
    }
  }
}
