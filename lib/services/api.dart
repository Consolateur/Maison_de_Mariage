import 'dart:convert';
import 'package:http/http.dart' as http;
import 'auth_service.dart';

const String API_BASE = String.fromEnvironment('API_BASE', defaultValue: 'http://10.0.2.2:4000/api');

class Api {
  final AuthService auth;
  Api(this.auth);

  Future<http.Response> get(String path) async {
    final headers = await _headers();
    return http.get(Uri.parse('\$API_BASE\$path'), headers: headers);
  }
  Future<http.Response> post(String path, Map body) async {
    final headers = await _headers();
    return http.post(Uri.parse('\$API_BASE\$path'), headers: headers, body: jsonEncode(body));
  }
  Future<Map<String,String>> _headers() async {
    final token = await auth.getToken();
    final headers = {'Content-Type':'application/json'};
    if (token != null) headers['Authorization'] = 'Bearer \$token';
    return headers;
  }
}
