// ignore_for_file: avoid_print

import 'package:geolocator/geolocator.dart';

const String apiKey = '4dc0e5b7731beacfa5467e395435ae36';

class Location {
  double longitude = 0.0;
  double latitude = 0.0;

  getCurrentLocation() async {
    // Request permission to check the location
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    // Get user's location
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      longitude = position.longitude;
      latitude = position.latitude;
    } catch (e) {
      print(e);
    }
  }
}
