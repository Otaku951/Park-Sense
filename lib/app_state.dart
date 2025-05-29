import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  /// remember user information
  bool _isRememberMeChecked = false;
  bool get isRememberMeChecked => _isRememberMeChecked;
  set isRememberMeChecked(bool value) {
    _isRememberMeChecked = value;
  }

  /// login information
  String _savedEmail = '';
  String get savedEmail => _savedEmail;
  set savedEmail(String value) {
    _savedEmail = value;
  }

  /// user information
  String _savePassword = '';
  String get savePassword => _savePassword;
  set savePassword(String value) {
    _savePassword = value;
  }
}
