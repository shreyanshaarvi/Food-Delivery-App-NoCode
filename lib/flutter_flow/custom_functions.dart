import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

String? removeOtherWord(String? latlng) {
  // remove word like "LatLng" ," (" , ":" , "lat:"  , "lng:"  , from the text
  latlng = latlng?.replaceAll('LatLng', '');
  latlng = latlng?.replaceAll('(', '');
  latlng = latlng?.replaceAll(')', '');
  latlng = latlng?.replaceAll(':', '');
  latlng = latlng?.replaceAll('lat', '');
  latlng = latlng?.replaceAll('Ing', '');
  latlng = latlng?.replaceAll('lng', '');
  latlng = latlng?.replaceAll(' ', '');
  return latlng;
}

double? revomeMfromtextinAPI(String? distance) {
  // convert string to double by removing word from the string
  if (distance == null) return null;
  final regex = RegExp(r'[^\d\.]+');
  final result = distance.replaceAll(regex, '');
  return double.tryParse(result);
}

bool? checkforkm(String? distance) {
  // check whether the word given has km word or not
  if (distance == null) {
    return null;
  }
  return distance.contains('km');
}

double? kmtom(double? distance) {
  // km to m
  if (distance == null) {
    return null;
  }
  return distance * 1000;
}
