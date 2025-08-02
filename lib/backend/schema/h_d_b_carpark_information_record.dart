import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HDBCarparkInformationRecord extends FirestoreRecord {
  HDBCarparkInformationRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "car_park_no" field.
  String? _carParkNo;
  String get carParkNo => _carParkNo ?? '';
  bool hasCarParkNo() => _carParkNo != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "x_coord" field.
  double? _xCoord;
  double get xCoord => _xCoord ?? 0.0;
  bool hasXCoord() => _xCoord != null;

  // "y_coord" field.
  double? _yCoord;
  double get yCoord => _yCoord ?? 0.0;
  bool hasYCoord() => _yCoord != null;

  // "car_park_type" field.
  String? _carParkType;
  String get carParkType => _carParkType ?? '';
  bool hasCarParkType() => _carParkType != null;

  // "type_of_parking_system" field.
  String? _typeOfParkingSystem;
  String get typeOfParkingSystem => _typeOfParkingSystem ?? '';
  bool hasTypeOfParkingSystem() => _typeOfParkingSystem != null;

  // "short_term_parking" field.
  String? _shortTermParking;
  String get shortTermParking => _shortTermParking ?? '';
  bool hasShortTermParking() => _shortTermParking != null;

  // "free_parking" field.
  String? _freeParking;
  String get freeParking => _freeParking ?? '';
  bool hasFreeParking() => _freeParking != null;

  // "night_parking" field.
  String? _nightParking;
  String get nightParking => _nightParking ?? '';
  bool hasNightParking() => _nightParking != null;

  // "car_park_decks" field.
  int? _carParkDecks;
  int get carParkDecks => _carParkDecks ?? 0;
  bool hasCarParkDecks() => _carParkDecks != null;

  // "gantry_height" field.
  double? _gantryHeight;
  double get gantryHeight => _gantryHeight ?? 0.0;
  bool hasGantryHeight() => _gantryHeight != null;

  // "car_park_basement" field.
  String? _carParkBasement;
  String get carParkBasement => _carParkBasement ?? '';
  bool hasCarParkBasement() => _carParkBasement != null;

  // "conv_lat" field.
  double? _convLat;
  double get convLat => _convLat ?? 0.0;
  bool hasConvLat() => _convLat != null;

  // "conv_lng" field.
  double? _convLng;
  double get convLng => _convLng ?? 0.0;
  bool hasConvLng() => _convLng != null;

  void _initializeFields() {
    _carParkNo = snapshotData['car_park_no'] as String?;
    _address = snapshotData['address'] as String?;
    _xCoord = castToType<double>(snapshotData['x_coord']);
    _yCoord = castToType<double>(snapshotData['y_coord']);
    _carParkType = snapshotData['car_park_type'] as String?;
    _typeOfParkingSystem = snapshotData['type_of_parking_system'] as String?;
    _shortTermParking = snapshotData['short_term_parking'] as String?;
    _freeParking = snapshotData['free_parking'] as String?;
    _nightParking = snapshotData['night_parking'] as String?;
    _carParkDecks = castToType<int>(snapshotData['car_park_decks']);
    _gantryHeight = castToType<double>(snapshotData['gantry_height']);
    _carParkBasement = snapshotData['car_park_basement'] as String?;
    _convLat = castToType<double>(snapshotData['conv_lat']);
    _convLng = castToType<double>(snapshotData['conv_lng']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('HDBCarparkInformation');

  static Stream<HDBCarparkInformationRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => HDBCarparkInformationRecord.fromSnapshot(s));

  static Future<HDBCarparkInformationRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => HDBCarparkInformationRecord.fromSnapshot(s));

  static HDBCarparkInformationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HDBCarparkInformationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HDBCarparkInformationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HDBCarparkInformationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HDBCarparkInformationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HDBCarparkInformationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHDBCarparkInformationRecordData({
  String? carParkNo,
  String? address,
  double? xCoord,
  double? yCoord,
  String? carParkType,
  String? typeOfParkingSystem,
  String? shortTermParking,
  String? freeParking,
  String? nightParking,
  int? carParkDecks,
  double? gantryHeight,
  String? carParkBasement,
  double? convLat,
  double? convLng,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'car_park_no': carParkNo,
      'address': address,
      'x_coord': xCoord,
      'y_coord': yCoord,
      'car_park_type': carParkType,
      'type_of_parking_system': typeOfParkingSystem,
      'short_term_parking': shortTermParking,
      'free_parking': freeParking,
      'night_parking': nightParking,
      'car_park_decks': carParkDecks,
      'gantry_height': gantryHeight,
      'car_park_basement': carParkBasement,
      'conv_lat': convLat,
      'conv_lng': convLng,
    }.withoutNulls,
  );

  return firestoreData;
}

class HDBCarparkInformationRecordDocumentEquality
    implements Equality<HDBCarparkInformationRecord> {
  const HDBCarparkInformationRecordDocumentEquality();

  @override
  bool equals(
      HDBCarparkInformationRecord? e1, HDBCarparkInformationRecord? e2) {
    return e1?.carParkNo == e2?.carParkNo &&
        e1?.address == e2?.address &&
        e1?.xCoord == e2?.xCoord &&
        e1?.yCoord == e2?.yCoord &&
        e1?.carParkType == e2?.carParkType &&
        e1?.typeOfParkingSystem == e2?.typeOfParkingSystem &&
        e1?.shortTermParking == e2?.shortTermParking &&
        e1?.freeParking == e2?.freeParking &&
        e1?.nightParking == e2?.nightParking &&
        e1?.carParkDecks == e2?.carParkDecks &&
        e1?.gantryHeight == e2?.gantryHeight &&
        e1?.carParkBasement == e2?.carParkBasement &&
        e1?.convLat == e2?.convLat &&
        e1?.convLng == e2?.convLng;
  }

  @override
  int hash(HDBCarparkInformationRecord? e) => const ListEquality().hash([
        e?.carParkNo,
        e?.address,
        e?.xCoord,
        e?.yCoord,
        e?.carParkType,
        e?.typeOfParkingSystem,
        e?.shortTermParking,
        e?.freeParking,
        e?.nightParking,
        e?.carParkDecks,
        e?.gantryHeight,
        e?.carParkBasement,
        e?.convLat,
        e?.convLng
      ]);

  @override
  bool isValidKey(Object? o) => o is HDBCarparkInformationRecord;
}
