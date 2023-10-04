import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NearLocationRecord extends FirestoreRecord {
  NearLocationRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "location" field.
  List<LatLng>? _location;
  List<LatLng> get location => _location ?? const [];
  bool hasLocation() => _location != null;

  // "current" field.
  LatLng? _current;
  LatLng? get current => _current;
  bool hasCurrent() => _current != null;

  // "radius" field.
  double? _radius;
  double get radius => _radius ?? 0.0;
  bool hasRadius() => _radius != null;

  void _initializeFields() {
    _location = getDataList(snapshotData['location']);
    _current = snapshotData['current'] as LatLng?;
    _radius = castToType<double>(snapshotData['radius']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('nearLocation');

  static Stream<NearLocationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NearLocationRecord.fromSnapshot(s));

  static Future<NearLocationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NearLocationRecord.fromSnapshot(s));

  static NearLocationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NearLocationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NearLocationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NearLocationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NearLocationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NearLocationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNearLocationRecordData({
  LatLng? current,
  double? radius,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'current': current,
      'radius': radius,
    }.withoutNulls,
  );

  return firestoreData;
}

class NearLocationRecordDocumentEquality
    implements Equality<NearLocationRecord> {
  const NearLocationRecordDocumentEquality();

  @override
  bool equals(NearLocationRecord? e1, NearLocationRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.location, e2?.location) &&
        e1?.current == e2?.current &&
        e1?.radius == e2?.radius;
  }

  @override
  int hash(NearLocationRecord? e) =>
      const ListEquality().hash([e?.location, e?.current, e?.radius]);

  @override
  bool isValidKey(Object? o) => o is NearLocationRecord;
}
