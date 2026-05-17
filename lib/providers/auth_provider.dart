import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  String? _userEmail;
  bool _isAuthenticated = false;

  String? get userEmail => _userEmail;
  bool get isAuthenticated => _isAuthenticated;

  Future<void> login(String email, String password) async {
    _userEmail = email;
    _isAuthenticated = true;
    notifyListeners();
  }

  Future<void> logout() async {
    _userEmail = null;
    _isAuthenticated = false;
    notifyListeners();
  }
}
