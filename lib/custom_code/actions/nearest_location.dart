// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:geolocator/geolocator.dart';

Future<List<LatLng>> nearestLocation(
  double radius,
  List<LatLng> otherUsersLocation,
  LatLng currentUserLocation,
) async {
  List<LatLng> nearbyLocation = [];

  for (LatLng otherUser in otherUsersLocation!) {
    double distance = await Geolocator.distanceBetween(
        currentUserLocation.latitude,
        currentUserLocation.longitude,
        otherUser.latitude,
        otherUser.longitude);
// check if the distance is within the radius

//[1,3]
//
//earbyLocation = [1,3];

    if (distance <= radius) {
      // Add the other user location to the nearby user location list

      nearbyLocation.add(otherUser);
    }
  }

  return nearbyLocation;
}
