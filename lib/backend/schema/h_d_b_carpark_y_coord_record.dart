import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HDBCarparkYCoordRecord extends FirestoreRecord {
  HDBCarparkYCoordRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "y_coord" field.
  double? _yCoord;
  double get yCoord => _yCoord ?? 0.0;
  bool hasYCoord() => _yCoord != null;

  void _initializeFields() {
    _yCoord = castToType<double>(snapshotData['y_coord']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('HDB_Carpark_Y_Coord');

  static Stream<HDBCarparkYCoordRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HDBCarparkYCoordRecord.fromSnapshot(s));

  static Future<HDBCarparkYCoordRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => HDBCarparkYCoordRecord.fromSnapshot(s));

  static HDBCarparkYCoordRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HDBCarparkYCoordRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HDBCarparkYCoordRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HDBCarparkYCoordRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HDBCarparkYCoordRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HDBCarparkYCoordRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHDBCarparkYCoordRecordData({
  double? yCoord,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'y_coord': yCoord,
    }.withoutNulls,
  );

  return firestoreData;
}

class HDBCarparkYCoordRecordDocumentEquality
    implements Equality<HDBCarparkYCoordRecord> {
  const HDBCarparkYCoordRecordDocumentEquality();

  @override
  bool equals(HDBCarparkYCoordRecord? e1, HDBCarparkYCoordRecord? e2) {
    return e1?.yCoord == e2?.yCoord;
  }

  @override
  int hash(HDBCarparkYCoordRecord? e) => const ListEquality().hash([e?.yCoord]);

  @override
  bool isValidKey(Object? o) => o is HDBCarparkYCoordRecord;
}
