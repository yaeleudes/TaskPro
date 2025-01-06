import 'package:flutter/material.dart';
import 'package:task_pro/models/user.dart';
import 'package:task_pro/services/user_service.dart';

class AuthenticationViewModel with ChangeNotifier {
  bool _loading = false;
  User? _user;
  bool resultat = false;

  bool get loading => _loading;
  User? get user => _user;

  Future<void> regiter(var body) async {
    _loading = true;
    notifyListeners();
    try {
      resultat = await UserService.register(body);
      notifyListeners();
    } catch (e) {
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> login() async {
    _loading = true;
    notifyListeners();
    try {} catch (e) {
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}
