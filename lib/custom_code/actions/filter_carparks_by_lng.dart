// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<String>?> filterCarparksByLng(
  List<LatLng>? filteredLatList,
  double? minLng,
  double? maxLng,
  List<String>? carParkNo,
) async {
  // Add your function code here!
  if (filteredLatList == null ||
      carParkNo == null ||
      minLng == null ||
      maxLng == null) {
    return [];
  }

  final List<String> result = [];

  for (int i = 0; i < filteredLatList.length; i++) {
    final point = filteredLatList[i];
    final carpark = i < carParkNo.length ? carParkNo[i] : null;

    if (point.longitude >= minLng &&
        point.longitude <= maxLng &&
        carpark != null) {
      result.add('${point.latitude},${point.longitude},$carpark');
    }
  }

  return result;
}
