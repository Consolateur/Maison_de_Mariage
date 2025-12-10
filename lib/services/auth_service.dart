import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

const API = String.fromEnvironment('API_BASE', defaultValue: 'http://10.0.2.2:4000/api');

class AuthService extends ChangeNotifier {
  final _storage = const FlutterSecureStorage();
  String? _token;
  bool get isLoggedIn => _token != null;

  Future<void> loadToken() async {
    _token = await _storage.read(key: 'token');
    notifyListeners();
  }

  Future<String?> getToken() async => _token;

  Future<bool> login(String emailOrPhone, String password) async {
    final res = await http.post(Uri.parse('\$API/auth/login'),
      headers: {'Content-Type':'application/json'},
      body: jsonEncode({'email_or_phone': emailOrPhone, 'password': password}));
    if (res.statusCode == 200) {
      final data = jsonDecode(res.body);
      _token = data['token'];
      await _storage.write(key: 'token', value: _token);
      notifyListeners();
      return true;
    }
    return false;
  }

  Future<void> logout() async {
    _token = null;
    await _storage.delete(key: 'token');
    notifyListeners();
  }

  Future<bool> register(Map<String,dynamic> payload) async {
    final res = await http.post(Uri.parse('\$API/auth/register'),
      headers: {'Content-Type':'application/json'},
      body: jsonEncode(payload));
    return res.statusCode == 201 || res.statusCode == 200;
  }
}
