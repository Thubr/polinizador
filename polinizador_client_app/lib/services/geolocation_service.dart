import 'package:geolocator/geolocator.dart';

class GeolocationService {
  static Future<Position> getCurrentLocation() async {
    return Geolocator.getCurrentPosition(timeLimit: const Duration(seconds: 10));
  }

  static double calculateDistanceTo(double startLat, double startLng, double endLat, double endLng) {
    return Geolocator.distanceBetween(startLat, startLng, endLat, endLng);
  }
}
