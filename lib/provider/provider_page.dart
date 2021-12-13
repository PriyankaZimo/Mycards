import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:instagram/DataModel/login_page_model.dart';

class ProviderPage extends ChangeNotifier {
  LoginModel? loginModel;
  bool loading = false;
  Future<void> apiTest(String email, String pass) async {
    loading = true;
    notifyListeners();
    var url = Uri.parse('https://theratap.com:1337/api/v1/user/login');
    var response = await http.post(url, body: {'email': email, 'password': pass});
    loginModel = LoginModel.fromJson(jsonDecode(response.body));
    loading=false;
    notifyListeners();
  }
}
