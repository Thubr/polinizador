import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

extension PositionX on Position {
  LatLng toLatLng() => LatLng(this.latitude, this.longitude);
}

extension LatLngX on LatLng {
  Position toPosition() => Position(latitude: this.latitude, longitude: this.longitude);
}
