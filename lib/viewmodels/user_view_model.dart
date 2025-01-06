import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/auth_service.dart';
import '../utils/local_storage.dart';

class UserViewModel extends ChangeNotifier {
  User? _user;
  bool _isLoading = false;

  User? get user => _user;
  bool get isLoading => _isLoading;

  Future<Map<String, dynamic>> register(Map<String, dynamic> body) async {
    _isLoading = true;
    notifyListeners();

    try {
      var resultat = await AuthService.register(body);
      return resultat;
    } catch (e) {
      // Handle error
      return {
          'status' : false,
          'message': "Une erreur s'est produite"
        };
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<Map<String, dynamic>> login(Map<String, dynamic> body) async {
    _isLoading = true;
    notifyListeners();

    try {
      var result = await AuthService.login(body);
      // _user = await AuthService.login(body);
      return result;
    } catch (e) {
      // Handle error
      return {
          'status' : false,
          'message': "Une erreur s'est produite"
        };
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    await LocalStorage.clear();
    _user = null;
    notifyListeners();
  }
}
