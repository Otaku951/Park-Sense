import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HDBCarparkXCoordRecord extends FirestoreRecord {
  HDBCarparkXCoordRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "x_coord" field.
  double? _xCoord;
  double get xCoord => _xCoord ?? 0.0;
  bool hasXCoord() => _xCoord != null;

  void _initializeFields() {
    _xCoord = castToType<double>(snapshotData['x_coord']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('HDB_Carpark_X_Coord');

  static Stream<HDBCarparkXCoordRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HDBCarparkXCoordRecord.fromSnapshot(s));

  static Future<HDBCarparkXCoordRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => HDBCarparkXCoordRecord.fromSnapshot(s));

  static HDBCarparkXCoordRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HDBCarparkXCoordRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HDBCarparkXCoordRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HDBCarparkXCoordRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HDBCarparkXCoordRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HDBCarparkXCoordRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHDBCarparkXCoordRecordData({
  double? xCoord,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'x_coord': xCoord,
    }.withoutNulls,
  );

  return firestoreData;
}

class HDBCarparkXCoordRecordDocumentEquality
    implements Equality<HDBCarparkXCoordRecord> {
  const HDBCarparkXCoordRecordDocumentEquality();

  @override
  bool equals(HDBCarparkXCoordRecord? e1, HDBCarparkXCoordRecord? e2) {
    return e1?.xCoord == e2?.xCoord;
  }

  @override
  int hash(HDBCarparkXCoordRecord? e) => const ListEquality().hash([e?.xCoord]);

  @override
  bool isValidKey(Object? o) => o is HDBCarparkXCoordRecord;
}
