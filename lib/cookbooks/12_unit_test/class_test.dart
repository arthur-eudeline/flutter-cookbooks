import 'dart:convert';

import 'package:http/http.dart' as http;

class ClassTest {
  int value = 0;

  void increment() => value++;

  void decrement() => value--;
  
  Future<Map<String, dynamic>> getIp() async {
    try {
      http.Response response = await http.get("https://api.ipify.org?format=json");
      return jsonDecode(response.body);
    } on Exception catch (error) {
      throw error;
    }
  }
}