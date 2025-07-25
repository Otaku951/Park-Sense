import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/supabase/supabase.dart';
import '/auth/firebase_auth/auth_util.dart';

LatLng? createLatLng(
  double? lat,
  double? lng,
) {
  if (lat == null || lng == null) return null;
  return LatLng(lat, lng);
}

String? latLngToString(LatLng? inputLocation) {
  if (inputLocation == null) {
    return null;
  }
  return '${inputLocation.latitude},${inputLocation.longitude}';
}

List<LatLng>? listDoubleToLatLng(
  List<double>? latitude,
  List<double>? longtitude,
) {
  if (latitude == null ||
      longtitude == null ||
      latitude.length != longtitude.length) {
    return null;
  }

  List<LatLng> latLngList = [];

  for (int i = 0; i < latitude.length; i++) {
    latLngList.add(LatLng(latitude[i], longtitude[i]));
  }

  return latLngList;
}

List<String>? extractCarParkNoFromStringList(List<String>? dataList) {
  final List<String> carParkList = [];

  if (dataList == null) return [];

  for (final item in dataList) {
    final parts = item.split(',');

    if (parts.length >= 3) {
      carParkList.add(parts[2]);
    }
  }

  return carParkList;
}

List<dynamic> extractCarparkData(List<dynamic>? rawList) {
  if (rawList == null || rawList.isEmpty) return [];

  final firstItem = rawList.first;
  if (firstItem is Map<String, dynamic>) {
    final items = firstItem['items'];
    if (items is List && items.isNotEmpty) {
      final carparkData = items[0]['carpark_data'];
      if (carparkData is List) return carparkData;
    }
  }

  return [];
}

String? getCarparkNoFromLatLng(
  List<String>? filteredLatLngList,
  LatLng? center,
) {
  if (filteredLatLngList == null || center == null) {
    return null;
  }

  for (final item in filteredLatLngList) {
    final parts = item.split(',');
    if (parts.length != 3) continue;

    final lat = double.tryParse(parts[0]);
    final lng = double.tryParse(parts[1]);
    final carpark = parts[2];

    if (lat != null && lng != null) {
      // Use small tolerance to avoid floating point mismatch
      if ((lat - center.latitude).abs() < 0.0001 &&
          (lng - center.longitude).abs() < 0.0001) {
        return carpark;
      }
    }
  }

  return null;
}

List<LatLng>? extractLatLngFromStringList(List<String>? dataList) {
  final List<LatLng> latLngList = [];

  if (dataList == null) return [];

  for (final item in dataList) {
    final parts = item.split(',');

    if (parts.length >= 2) {
      final lat = double.tryParse(parts[0]);
      final lng = double.tryParse(parts[1]);

      if (lat != null && lng != null) {
        latLngList.add(LatLng(lat, lng));
      }
    }
  }

  return latLngList;
}
