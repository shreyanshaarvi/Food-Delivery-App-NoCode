import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OderAssineeeRecord extends FirestoreRecord {
  OderAssineeeRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "riderRef" field.
  DocumentReference? _riderRef;
  DocumentReference? get riderRef => _riderRef;
  bool hasRiderRef() => _riderRef != null;

  // "accept" field.
  bool? _accept;
  bool get accept => _accept ?? false;
  bool hasAccept() => _accept != null;

  // "distance" field.
  String? _distance;
  String get distance => _distance ?? '';
  bool hasDistance() => _distance != null;

  void _initializeFields() {
    _riderRef = snapshotData['riderRef'] as DocumentReference?;
    _accept = snapshotData['accept'] as bool?;
    _distance = snapshotData['distance'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('oderAssineee');

  static Stream<OderAssineeeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OderAssineeeRecord.fromSnapshot(s));

  static Future<OderAssineeeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OderAssineeeRecord.fromSnapshot(s));

  static OderAssineeeRecord fromSnapshot(DocumentSnapshot snapshot) =>
      OderAssineeeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OderAssineeeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OderAssineeeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OderAssineeeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OderAssineeeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOderAssineeeRecordData({
  DocumentReference? riderRef,
  bool? accept,
  String? distance,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'riderRef': riderRef,
      'accept': accept,
      'distance': distance,
    }.withoutNulls,
  );

  return firestoreData;
}

class OderAssineeeRecordDocumentEquality
    implements Equality<OderAssineeeRecord> {
  const OderAssineeeRecordDocumentEquality();

  @override
  bool equals(OderAssineeeRecord? e1, OderAssineeeRecord? e2) {
    return e1?.riderRef == e2?.riderRef &&
        e1?.accept == e2?.accept &&
        e1?.distance == e2?.distance;
  }

  @override
  int hash(OderAssineeeRecord? e) =>
      const ListEquality().hash([e?.riderRef, e?.accept, e?.distance]);

  @override
  bool isValidKey(Object? o) => o is OderAssineeeRecord;
}
