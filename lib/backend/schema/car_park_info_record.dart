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

  // "CarParkBasement" field.
  bool? _carParkBasement;
  bool get carParkBasement => _carParkBasement ?? false;
  bool hasCarParkBasement() => _carParkBasement != null;

  // "CarParkDecks" field.
  int? _carParkDecks;
  int get carParkDecks => _carParkDecks ?? 0;
  bool hasCarParkDecks() => _carParkDecks != null;

  // "CarParkID" field.
  int? _carParkID;
  int get carParkID => _carParkID ?? 0;
  bool hasCarParkID() => _carParkID != null;

  // "Field" field.
  String? _field;
  String get field => _field ?? '';
  bool hasField() => _field != null;

  // "GantryHeight" field.
  double? _gantryHeight;
  double get gantryHeight => _gantryHeight ?? 0.0;
  bool hasGantryHeight() => _gantryHeight != null;

  // "NightParking" field.
  bool? _nightParking;
  bool get nightParking => _nightParking ?? false;
  bool hasNightParking() => _nightParking != null;

  // "ShortTermParking" field.
  bool? _shortTermParking;
  bool get shortTermParking => _shortTermParking ?? false;
  bool hasShortTermParking() => _shortTermParking != null;

  // "Type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "TypeOfParkingSystem" field.
  String? _typeOfParkingSystem;
  String get typeOfParkingSystem => _typeOfParkingSystem ?? '';
  bool hasTypeOfParkingSystem() => _typeOfParkingSystem != null;

  void _initializeFields() {
    _carParkBasement = snapshotData['CarParkBasement'] as bool?;
    _carParkDecks = castToType<int>(snapshotData['CarParkDecks']);
    _carParkID = castToType<int>(snapshotData['CarParkID']);
    _field = snapshotData['Field'] as String?;
    _gantryHeight = castToType<double>(snapshotData['GantryHeight']);
    _nightParking = snapshotData['NightParking'] as bool?;
    _shortTermParking = snapshotData['ShortTermParking'] as bool?;
    _type = snapshotData['Type'] as String?;
    _typeOfParkingSystem = snapshotData['TypeOfParkingSystem'] as String?;
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
  bool? carParkBasement,
  int? carParkDecks,
  int? carParkID,
  String? field,
  double? gantryHeight,
  bool? nightParking,
  bool? shortTermParking,
  String? type,
  String? typeOfParkingSystem,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'CarParkBasement': carParkBasement,
      'CarParkDecks': carParkDecks,
      'CarParkID': carParkID,
      'Field': field,
      'GantryHeight': gantryHeight,
      'NightParking': nightParking,
      'ShortTermParking': shortTermParking,
      'Type': type,
      'TypeOfParkingSystem': typeOfParkingSystem,
    }.withoutNulls,
  );

  return firestoreData;
}

class CarParkInfoRecordDocumentEquality implements Equality<CarParkInfoRecord> {
  const CarParkInfoRecordDocumentEquality();

  @override
  bool equals(CarParkInfoRecord? e1, CarParkInfoRecord? e2) {
    return e1?.carParkBasement == e2?.carParkBasement &&
        e1?.carParkDecks == e2?.carParkDecks &&
        e1?.carParkID == e2?.carParkID &&
        e1?.field == e2?.field &&
        e1?.gantryHeight == e2?.gantryHeight &&
        e1?.nightParking == e2?.nightParking &&
        e1?.shortTermParking == e2?.shortTermParking &&
        e1?.type == e2?.type &&
        e1?.typeOfParkingSystem == e2?.typeOfParkingSystem;
  }

  @override
  int hash(CarParkInfoRecord? e) => const ListEquality().hash([
        e?.carParkBasement,
        e?.carParkDecks,
        e?.carParkID,
        e?.field,
        e?.gantryHeight,
        e?.nightParking,
        e?.shortTermParking,
        e?.type,
        e?.typeOfParkingSystem
      ]);

  @override
  bool isValidKey(Object? o) => o is CarParkInfoRecord;
}
