import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl;

  ApiService({required this.baseUrl});

  Future<Map<String, dynamic>> fetchHomeData() async {
    final response = await http.get(Uri.parse('$baseUrl/feed'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Error loading home data');
    }
  }

  Future<Map<String, dynamic>> fetchDoctorDetails() async {
    final response = await http.get(Uri.parse('$baseUrl/feed/details'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Error loading doctor details');
    }
  }
}
