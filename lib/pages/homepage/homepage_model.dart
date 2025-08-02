import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'homepage_widget.dart' show HomepageWidget;
import 'package:flutter/material.dart';

class HomepageModel extends FlutterFlowModel<HomepageWidget> {
  ///  Local state fields for this page.

  List<dynamic> carparkAvailabilityList = [];
  void addToCarparkAvailabilityList(dynamic item) =>
      carparkAvailabilityList.add(item);
  void removeFromCarparkAvailabilityList(dynamic item) =>
      carparkAvailabilityList.remove(item);
  void removeAtIndexFromCarparkAvailabilityList(int index) =>
      carparkAvailabilityList.removeAt(index);
  void insertAtIndexInCarparkAvailabilityList(int index, dynamic item) =>
      carparkAvailabilityList.insert(index, item);
  void updateCarparkAvailabilityListAtIndex(
          int index, Function(dynamic) updateFn) =>
      carparkAvailabilityList[index] = updateFn(carparkAvailabilityList[index]);

  List<String> carParkNoList = [];
  void addToCarParkNoList(String item) => carParkNoList.add(item);
  void removeFromCarParkNoList(String item) => carParkNoList.remove(item);
  void removeAtIndexFromCarParkNoList(int index) =>
      carParkNoList.removeAt(index);
  void insertAtIndexInCarParkNoList(int index, String item) =>
      carParkNoList.insert(index, item);
  void updateCarParkNoListAtIndex(int index, Function(String) updateFn) =>
      carParkNoList[index] = updateFn(carParkNoList[index]);

  List<dynamic> extractedCarparks = [];
  void addToExtractedCarparks(dynamic item) => extractedCarparks.add(item);
  void removeFromExtractedCarparks(dynamic item) =>
      extractedCarparks.remove(item);
  void removeAtIndexFromExtractedCarparks(int index) =>
      extractedCarparks.removeAt(index);
  void insertAtIndexInExtractedCarparks(int index, dynamic item) =>
      extractedCarparks.insert(index, item);
  void updateExtractedCarparksAtIndex(int index, Function(dynamic) updateFn) =>
      extractedCarparks[index] = updateFn(extractedCarparks[index]);

  String? selectedCarpark;

  List<dynamic> filteredAvailabilitylist = [];
  void addToFilteredAvailabilitylist(dynamic item) =>
      filteredAvailabilitylist.add(item);
  void removeFromFilteredAvailabilitylist(dynamic item) =>
      filteredAvailabilitylist.remove(item);
  void removeAtIndexFromFilteredAvailabilitylist(int index) =>
      filteredAvailabilitylist.removeAt(index);
  void insertAtIndexInFilteredAvailabilitylist(int index, dynamic item) =>
      filteredAvailabilitylist.insert(index, item);
  void updateFilteredAvailabilitylistAtIndex(
          int index, Function(dynamic) updateFn) =>
      filteredAvailabilitylist[index] =
          updateFn(filteredAvailabilitylist[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue = FFPlace();
  // Stores action output result for [Backend Call - API (NearbySearch)] action in IconButton widget.
  ApiCallResponse? latlng;
  // Stores action output result for [Custom Action - boundingBox] action in IconButton widget.
  List<double>? bound;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  List<CarParkInfoRecord>? filteredLatList;
  // Stores action output result for [Custom Action - filterCarparksByLng] action in IconButton widget.
  List<String>? filteredLatLngList;
  // Stores action output result for [Backend Call - API (Carpark Availability)] action in IconButton widget.
  ApiCallResponse? availabilityList;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
