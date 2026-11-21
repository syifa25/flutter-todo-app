import 'package:flutter/material.dart';
import 'package:pertemuan6/services/auth/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthNotifier with ChangeNotifier{
  final AuthService _authService = AuthService();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void _setLoading (bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<bool> signUp(
    String email,
    String password
  ) async{
    _setLoading(true);
    try {
      User? user = await _authService.signUp(email, password);

      return user != null;
    } finally {
      _setLoading(false);
    }
  } 

  Future<bool> signIn(
    String email,
    String password
  ) async{
    _setLoading(true);
    try {
      User? user = await _authService.signIn(email, password);

      return user != null;
    } finally {
      _setLoading(false);
    }
  } 

  Future<void> signOut() async {
    await _authService.signOut();
  }
}