import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isAuthenticated = false;
  bool get isAuthenticated => _isAuthenticated;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;
  Future<void> login(String email, String password) async {
    _setLoading(true);
    _errorMessage = null;

    try {
      await Future.delayed(const Duration(seconds: 2));
      _isAuthenticated = true;
    } catch (e) {
      _errorMessage = "Something went wrong. Please try again.";
      _isAuthenticated = false;
    }

    _setLoading(false);
  }

  void logout() {
    _isAuthenticated = false;
    notifyListeners();
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
