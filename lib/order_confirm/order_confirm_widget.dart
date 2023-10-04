import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'order_confirm_model.dart';
export 'order_confirm_model.dart';

class OrderConfirmWidget extends StatefulWidget {
  const OrderConfirmWidget({Key? key}) : super(key: key);

  @override
  _OrderConfirmWidgetState createState() => _OrderConfirmWidgetState();
}

class _OrderConfirmWidgetState extends State<OrderConfirmWidget> {
  late OrderConfirmModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OrderConfirmModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Page Title',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.00, 0.00),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
                  child: FFButtonWidget(
                    onPressed: _model.isColpmpleted
                        ? null
                        : () async {
                            _model.returnat =
                                await queryResturnatNameRecordOnce(
                              singleRecord: true,
                            ).then((s) => s.firstOrNull);
                            // rider
                            _model.rider = await queryRiderRecordOnce();
                            while (_model.isColpmpleted == false) {
                              setState(() {
                                _model.numberOfRun = _model.numberOfRun + 1;
                              });
                              await Future.delayed(
                                  const Duration(milliseconds: 2000));
                              if (_model.rider!.length >= _model.numberOfRun) {
                                // api call
                                _model.apiResultyak =
                                    await DistanceMatrixCall.call(
                                  riderLocation: functions.removeOtherWord(
                                      _model
                                          .rider?[_model.index]?.riderslocation
                                          ?.toString()),
                                  restuant: functions.removeOtherWord(
                                      _model.returnat?.location?.toString()),
                                );
                                if ((_model.apiResultyak?.succeeded ?? true)) {
                                  _model.riderDistance =
                                      functions.revomeMfromtextinAPI(
                                          DistanceMatrixCall.distance(
                                    (_model.apiResultyak?.jsonBody ?? ''),
                                  ).toString());
                                  await Future.delayed(
                                      const Duration(milliseconds: 2000));
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        _model.riderDistance.toString(),
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                    ),
                                  );
                                  if (_model.riderDistance! < _model.range) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'True',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );

                                    var oderAssineeeRecordReference =
                                        OderAssineeeRecord.collection.doc();
                                    await oderAssineeeRecordReference
                                        .set(createOderAssineeeRecordData(
                                      riderRef: _model.rider
                                          ?.where((e) =>
                                              _model.rider?[_model.index]
                                                  ?.isDelivering ==
                                              false)
                                          .toList()?[_model.index]
                                          ?.reference,
                                      accept: false,
                                      distance: DistanceMatrixCall.distance(
                                        (_model.apiResultyak?.jsonBody ?? ''),
                                      ).toString(),
                                    ));
                                    _model.docOrder =
                                        OderAssineeeRecord.getDocumentFromData(
                                            createOderAssineeeRecordData(
                                              riderRef: _model.rider
                                                  ?.where((e) =>
                                                      _model
                                                          .rider?[_model.index]
                                                          ?.isDelivering ==
                                                      false)
                                                  .toList()?[_model.index]
                                                  ?.reference,
                                              accept: false,
                                              distance:
                                                  DistanceMatrixCall.distance(
                                                (_model.apiResultyak
                                                        ?.jsonBody ??
                                                    ''),
                                              ).toString(),
                                            ),
                                            oderAssineeeRecordReference);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'index at${_model.index.toString()}',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );
                                    setState(() {
                                      _model.index = _model.index + 1;
                                    });
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'False',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );
                                    setState(() {
                                      _model.outorange = _model.outorange + 1;
                                    });
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'False',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );
                                    if (_model.outorange < 10) {
                                      setState(() {
                                        _model.range = _model.range + 1.0;
                                        _model.index = _model.index + 1;
                                      });
                                    } else {
                                      setState(() {
                                        _model.index = _model.index + 1;
                                      });
                                    }
                                  }
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Fail API',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                    ),
                                  );
                                }
                              }
                            }
                            _model.orderAsinee =
                                await queryOderAssineeeRecordOnce(
                              singleRecord: true,
                            ).then((s) => s.firstOrNull);

                            context.pushNamed(
                              'DeliveryBoyAccepting',
                              queryParameters: {
                                'orderAsinee': serializeParam(
                                  _model.orderAsinee?.reference,
                                  ParamType.DocumentReference,
                                ),
                              }.withoutNulls,
                            );

                            setState(() {});
                          },
                    text: 'Process',
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Readex Pro',
                                color: Colors.white,
                              ),
                      elevation: 3.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                      disabledColor: FlutterFlowTheme.of(context).accent2,
                      disabledTextColor:
                          FlutterFlowTheme.of(context).primaryBackground,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
