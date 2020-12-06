import 'package:google_maps_flutter/google_maps_flutter.dart';

class Fixtures {
  static final stores = {
    Marker(
      markerId: MarkerId('A'),
      position: LatLng(-23.552372, -46.632810),
      infoWindow: InfoWindow(title: 'Loja A'),
    ),
    Marker(
      markerId: MarkerId('B'),
      position: LatLng(-23.547615, -46.634756),
      infoWindow: InfoWindow(title: 'Loja B'),
    ),
    Marker(
      markerId: MarkerId('C'),
      position: LatLng(-23.552179, -46.647751),
      infoWindow: InfoWindow(title: 'Loja C'),
    ),
    Marker(
      markerId: MarkerId('D'),
      position: LatLng(-23.584935, -46.688341),
      infoWindow: InfoWindow(title: 'Loja D'),
    ),
  };
}
