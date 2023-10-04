import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RiderRecord extends FirestoreRecord {
  RiderRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "Riderslocation" field.
  LatLng? _riderslocation;
  LatLng? get riderslocation => _riderslocation;
  bool hasRiderslocation() => _riderslocation != null;

  // "distanceFromResturant" field.
  double? _distanceFromResturant;
  double get distanceFromResturant => _distanceFromResturant ?? 0.0;
  bool hasDistanceFromResturant() => _distanceFromResturant != null;

  // "is_Accepted" field.
  bool? _isAccepted;
  bool get isAccepted => _isAccepted ?? false;
  bool hasIsAccepted() => _isAccepted != null;

  // "orderAssinee" field.
  DocumentReference? _orderAssinee;
  DocumentReference? get orderAssinee => _orderAssinee;
  bool hasOrderAssinee() => _orderAssinee != null;

  // "is_delivering" field.
  bool? _isDelivering;
  bool get isDelivering => _isDelivering ?? false;
  bool hasIsDelivering() => _isDelivering != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _riderslocation = snapshotData['Riderslocation'] as LatLng?;
    _distanceFromResturant =
        castToType<double>(snapshotData['distanceFromResturant']);
    _isAccepted = snapshotData['is_Accepted'] as bool?;
    _orderAssinee = snapshotData['orderAssinee'] as DocumentReference?;
    _isDelivering = snapshotData['is_delivering'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('rider');

  static Stream<RiderRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RiderRecord.fromSnapshot(s));

  static Future<RiderRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RiderRecord.fromSnapshot(s));

  static RiderRecord fromSnapshot(DocumentSnapshot snapshot) => RiderRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RiderRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RiderRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RiderRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RiderRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRiderRecordData({
  String? name,
  LatLng? riderslocation,
  double? distanceFromResturant,
  bool? isAccepted,
  DocumentReference? orderAssinee,
  bool? isDelivering,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'Riderslocation': riderslocation,
      'distanceFromResturant': distanceFromResturant,
      'is_Accepted': isAccepted,
      'orderAssinee': orderAssinee,
      'is_delivering': isDelivering,
    }.withoutNulls,
  );

  return firestoreData;
}

class RiderRecordDocumentEquality implements Equality<RiderRecord> {
  const RiderRecordDocumentEquality();

  @override
  bool equals(RiderRecord? e1, RiderRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.riderslocation == e2?.riderslocation &&
        e1?.distanceFromResturant == e2?.distanceFromResturant &&
        e1?.isAccepted == e2?.isAccepted &&
        e1?.orderAssinee == e2?.orderAssinee &&
        e1?.isDelivering == e2?.isDelivering;
  }

  @override
  int hash(RiderRecord? e) => const ListEquality().hash([
        e?.name,
        e?.riderslocation,
        e?.distanceFromResturant,
        e?.isAccepted,
        e?.orderAssinee,
        e?.isDelivering
      ]);

  @override
  bool isValidKey(Object? o) => o is RiderRecord;
}
