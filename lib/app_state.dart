import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _parkingHistoryList =
          prefs.getStringList('ff_parkingHistoryList')?.map((x) {
                try {
                  return jsonDecode(x);
                } catch (e) {
                  print("Can't decode persisted json. Error: $e.");
                  return {};
                }
              }).toList() ??
              _parkingHistoryList;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

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

  List<dynamic> _parkingHistoryList = [];
  List<dynamic> get parkingHistoryList => _parkingHistoryList;
  set parkingHistoryList(List<dynamic> value) {
    _parkingHistoryList = value;
    prefs.setStringList(
        'ff_parkingHistoryList', value.map((x) => jsonEncode(x)).toList());
  }

  void addToParkingHistoryList(dynamic value) {
    parkingHistoryList.add(value);
    prefs.setStringList('ff_parkingHistoryList',
        _parkingHistoryList.map((x) => jsonEncode(x)).toList());
  }

  void removeFromParkingHistoryList(dynamic value) {
    parkingHistoryList.remove(value);
    prefs.setStringList('ff_parkingHistoryList',
        _parkingHistoryList.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromParkingHistoryList(int index) {
    parkingHistoryList.removeAt(index);
    prefs.setStringList('ff_parkingHistoryList',
        _parkingHistoryList.map((x) => jsonEncode(x)).toList());
  }

  void updateParkingHistoryListAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    parkingHistoryList[index] = updateFn(_parkingHistoryList[index]);
    prefs.setStringList('ff_parkingHistoryList',
        _parkingHistoryList.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInParkingHistoryList(int index, dynamic value) {
    parkingHistoryList.insert(index, value);
    prefs.setStringList('ff_parkingHistoryList',
        _parkingHistoryList.map((x) => jsonEncode(x)).toList());
  }

  String _faqSearchText = '';
  String get faqSearchText => _faqSearchText;
  set faqSearchText(String value) {
    _faqSearchText = value;
  }

  String _SelectedCarPark = 'A1';
  String get SelectedCarPark => _SelectedCarPark;
  set SelectedCarPark(String value) {
    _SelectedCarPark = value;
  }

  String _feedbackText = '';
  String get feedbackText => _feedbackText;
  set feedbackText(String value) {
    _feedbackText = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
