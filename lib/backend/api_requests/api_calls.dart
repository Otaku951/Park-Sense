import 'dart:convert';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class CarparkAvailabilityCall {
  static Future<ApiCallResponse> call({
    String? dateTime = '2025-07-07T18:00:00',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Carpark Availability',
      apiUrl: 'https://api.data.gov.sg/v1/transport/carpark-availability',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'date_time': dateTime,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? items(dynamic response) => getJsonField(
        response,
        r'''$.items''',
        true,
      ) as List?;
  static List? carparkdata(dynamic response) => getJsonField(
        response,
        r'''$.items[:].carpark_data''',
        true,
      ) as List?;
  static List? carparkinfo(dynamic response) => getJsonField(
        response,
        r'''$.items[:].carpark_data[:].carpark_info''',
        true,
      ) as List?;
  static List<String>? totallots(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].carpark_data[:].carpark_info[:].total_lots''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? lottype(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].carpark_data[:].carpark_info[:].lot_type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? lotsavailable(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].carpark_data[:].carpark_info[:].lots_available''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? carparknumber(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].carpark_data[:].carpark_number''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? updatedatetime(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].carpark_data[:].update_datetime''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class NearbySearchCall {
  static Future<ApiCallResponse> call({
    String? latLng = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'NearbySearch',
      apiUrl: 'https://maps.googleapis.com/maps/api/place/nearbysearch/json',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'key': "AIzaSyAdetFIwbNcGq1VhOcs3ENIY-IYTr7zFFY",
        'radius': "1000",
        'location': latLng,
        'type': "parking",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? location(dynamic response) => getJsonField(
        response,
        r'''$.results[:].geometry.location''',
        true,
      ) as List?;
  static List<double>? lat(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].geometry.location.lat''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  static List<double>? lng(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].geometry.location.lng''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  static List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? vicinity(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].vicinity''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
