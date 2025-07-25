import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CarParkInfoRecord extends FirestoreRecord {
  CarParkInfoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "car_park_basement" field.
  String? _carParkBasement;
  String get carParkBasement => _carParkBasement ?? '';
  bool hasCarParkBasement() => _carParkBasement != null;

  // "car_park_decks" field.
  int? _carParkDecks;
  int get carParkDecks => _carParkDecks ?? 0;
  bool hasCarParkDecks() => _carParkDecks != null;

  // "car_park_no" field.
  String? _carParkNo;
  String get carParkNo => _carParkNo ?? '';
  bool hasCarParkNo() => _carParkNo != null;

  // "car_park_type" field.
  String? _carParkType;
  String get carParkType => _carParkType ?? '';
  bool hasCarParkType() => _carParkType != null;

  // "free_parking" field.
  String? _freeParking;
  String get freeParking => _freeParking ?? '';
  bool hasFreeParking() => _freeParking != null;

  // "gantry_height" field.
  double? _gantryHeight;
  double get gantryHeight => _gantryHeight ?? 0.0;
  bool hasGantryHeight() => _gantryHeight != null;

  // "lat" field.
  double? _lat;
  double get lat => _lat ?? 0.0;
  bool hasLat() => _lat != null;

  // "lng" field.
  double? _lng;
  double get lng => _lng ?? 0.0;
  bool hasLng() => _lng != null;

  // "night_parking" field.
  String? _nightParking;
  String get nightParking => _nightParking ?? '';
  bool hasNightParking() => _nightParking != null;

  // "short_term_parking" field.
  String? _shortTermParking;
  String get shortTermParking => _shortTermParking ?? '';
  bool hasShortTermParking() => _shortTermParking != null;

  // "type_of_parking_system" field.
  String? _typeOfParkingSystem;
  String get typeOfParkingSystem => _typeOfParkingSystem ?? '';
  bool hasTypeOfParkingSystem() => _typeOfParkingSystem != null;

  // "x_coord" field.
  double? _xCoord;
  double get xCoord => _xCoord ?? 0.0;
  bool hasXCoord() => _xCoord != null;

  // "y_coord" field.
  double? _yCoord;
  double get yCoord => _yCoord ?? 0.0;
  bool hasYCoord() => _yCoord != null;

  void _initializeFields() {
    _address = snapshotData['address'] as String?;
    _carParkBasement = snapshotData['car_park_basement'] as String?;
    _carParkDecks = castToType<int>(snapshotData['car_park_decks']);
    _carParkNo = snapshotData['car_park_no'] as String?;
    _carParkType = snapshotData['car_park_type'] as String?;
    _freeParking = snapshotData['free_parking'] as String?;
    _gantryHeight = castToType<double>(snapshotData['gantry_height']);
    _lat = castToType<double>(snapshotData['lat']);
    _lng = castToType<double>(snapshotData['lng']);
    _nightParking = snapshotData['night_parking'] as String?;
    _shortTermParking = snapshotData['short_term_parking'] as String?;
    _typeOfParkingSystem = snapshotData['type_of_parking_system'] as String?;
    _xCoord = castToType<double>(snapshotData['x_coord']);
    _yCoord = castToType<double>(snapshotData['y_coord']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('CarParkInfo');

  static Stream<CarParkInfoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CarParkInfoRecord.fromSnapshot(s));

  static Future<CarParkInfoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CarParkInfoRecord.fromSnapshot(s));

  static CarParkInfoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CarParkInfoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CarParkInfoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CarParkInfoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CarParkInfoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CarParkInfoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCarParkInfoRecordData({
  String? address,
  String? carParkBasement,
  int? carParkDecks,
  String? carParkNo,
  String? carParkType,
  String? freeParking,
  double? gantryHeight,
  double? lat,
  double? lng,
  String? nightParking,
  String? shortTermParking,
  String? typeOfParkingSystem,
  double? xCoord,
  double? yCoord,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'address': address,
      'car_park_basement': carParkBasement,
      'car_park_decks': carParkDecks,
      'car_park_no': carParkNo,
      'car_park_type': carParkType,
      'free_parking': freeParking,
      'gantry_height': gantryHeight,
      'lat': lat,
      'lng': lng,
      'night_parking': nightParking,
      'short_term_parking': shortTermParking,
      'type_of_parking_system': typeOfParkingSystem,
      'x_coord': xCoord,
      'y_coord': yCoord,
    }.withoutNulls,
  );

  return firestoreData;
}

class CarParkInfoRecordDocumentEquality implements Equality<CarParkInfoRecord> {
  const CarParkInfoRecordDocumentEquality();

  @override
  bool equals(CarParkInfoRecord? e1, CarParkInfoRecord? e2) {
    return e1?.address == e2?.address &&
        e1?.carParkBasement == e2?.carParkBasement &&
        e1?.carParkDecks == e2?.carParkDecks &&
        e1?.carParkNo == e2?.carParkNo &&
        e1?.carParkType == e2?.carParkType &&
        e1?.freeParking == e2?.freeParking &&
        e1?.gantryHeight == e2?.gantryHeight &&
        e1?.lat == e2?.lat &&
        e1?.lng == e2?.lng &&
        e1?.nightParking == e2?.nightParking &&
        e1?.shortTermParking == e2?.shortTermParking &&
        e1?.typeOfParkingSystem == e2?.typeOfParkingSystem &&
        e1?.xCoord == e2?.xCoord &&
        e1?.yCoord == e2?.yCoord;
  }

  @override
  int hash(CarParkInfoRecord? e) => const ListEquality().hash([
        e?.address,
        e?.carParkBasement,
        e?.carParkDecks,
        e?.carParkNo,
        e?.carParkType,
        e?.freeParking,
        e?.gantryHeight,
        e?.lat,
        e?.lng,
        e?.nightParking,
        e?.shortTermParking,
        e?.typeOfParkingSystem,
        e?.xCoord,
        e?.yCoord
      ]);

  @override
  bool isValidKey(Object? o) => o is CarParkInfoRecord;
}
