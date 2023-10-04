import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'order_confirm_widget.dart' show OrderConfirmWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OrderConfirmModel extends FlutterFlowModel<OrderConfirmWidget> {
  ///  Local state fields for this page.

  Color? colour;

  List<LatLng> outputlatlng = [];
  void addToOutputlatlng(LatLng item) => outputlatlng.add(item);
  void removeFromOutputlatlng(LatLng item) => outputlatlng.remove(item);
  void removeAtIndexFromOutputlatlng(int index) => outputlatlng.removeAt(index);
  void insertAtIndexInOutputlatlng(int index, LatLng item) =>
      outputlatlng.insert(index, item);
  void updateOutputlatlngAtIndex(int index, Function(LatLng) updateFn) =>
      outputlatlng[index] = updateFn(outputlatlng[index]);

  List<DocumentReference> refNew = [];
  void addToRefNew(DocumentReference item) => refNew.add(item);
  void removeFromRefNew(DocumentReference item) => refNew.remove(item);
  void removeAtIndexFromRefNew(int index) => refNew.removeAt(index);
  void insertAtIndexInRefNew(int index, DocumentReference item) =>
      refNew.insert(index, item);
  void updateRefNewAtIndex(int index, Function(DocumentReference) updateFn) =>
      refNew[index] = updateFn(refNew[index]);

  int index = 0;

  int? rideramount = 0;

  bool isColpmpleted = false;

  double range = 2.0;

  double? riderDistance;

  List<DocumentReference> riderNearby = [];
  void addToRiderNearby(DocumentReference item) => riderNearby.add(item);
  void removeFromRiderNearby(DocumentReference item) =>
      riderNearby.remove(item);
  void removeAtIndexFromRiderNearby(int index) => riderNearby.removeAt(index);
  void insertAtIndexInRiderNearby(int index, DocumentReference item) =>
      riderNearby.insert(index, item);
  void updateRiderNearbyAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      riderNearby[index] = updateFn(riderNearby[index]);

  bool? iloopWorking;

  int outorange = 0;

  int numberOfRun = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ResturnatNameRecord? returnat;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<RiderRecord>? rider;
  // Stores action output result for [Backend Call - API (DistanceMatrix )] action in Button widget.
  ApiCallResponse? apiResultyak;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  OderAssineeeRecord? docOrder;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  OderAssineeeRecord? orderAsinee;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
