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

Future<List<double>?> boundingBox(
  LatLng center,
  double radiusKm,
) async {
  // Add your function code here!
  // Constants
  const double earthRadius = 6371.0; // in kilometers
  const double pi = 3.141592653589793;

  // Null check (optional)
  if (center == null || radiusKm <= 0) return null;

  // Get lat/lng in degrees
  final double latDeg = center.latitude;
  final double lngDeg = center.longitude;

  // Convert latitude to radians
  final double latRad = latDeg * pi / 180;

  // Approximate cosine of latitude using Taylor expansion
  final double cosLat = 1 - (latRad * latRad) / 2;

  // Calculate change in degrees (in radians)
  final double deltaLat = radiusKm / earthRadius;
  final double deltaLng = radiusKm / (earthRadius * cosLat);

  // Convert bounding box limits back to degrees
  final double minLat = latRad - deltaLat;
  final double maxLat = latRad + deltaLat;
  final double minLng = (lngDeg * pi / 180) - deltaLng;
  final double maxLng = (lngDeg * pi / 180) + deltaLng;

  // Return values converted back to degrees
  return [
    minLat * 180 / pi, // min latitude
    maxLat * 180 / pi, // max latitude
    minLng * 180 / pi, // min longitude
    maxLng * 180 / pi, // max longitude
  ];
}
