import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../services/geolocation_service.dart';
import '../util/extensions.dart';
import '../util/fixtures.dart';

class GoogleMapsScreen extends StatefulWidget {
  const GoogleMapsScreen({Key key}) : super(key: key);

  @override
  _GoogleMapsScreenState createState() => _GoogleMapsScreenState();
}

class _GoogleMapsScreenState extends State<GoogleMapsScreen> {
  GoogleMapController _controller;
  LatLng _currentLocation;
  bool allStores = false;

  Future<void> getCurrentLocation() async {
    final position = await GeolocationService.getCurrentLocation();
    return _currentLocation = position.toLatLng();
  }

  Set<Marker> getNearbyStores() {
    return Fixtures.stores
        .where((marker) =>
            GeolocationService.calculateDistanceTo(
                _currentLocation.latitude, _currentLocation.longitude, marker.position.latitude, marker.position.longitude) <
            1000)
        .toSet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lojas mais próximas'),
        actions: [
          IconButton(
            icon: Icon(allStores ? Icons.visibility_off : Icons.visibility),
            onPressed: () => setState(() => allStores = !allStores),
          ),
        ],
      ),
      body: FutureBuilder(
        future: getCurrentLocation(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) return _buildMap();
          return Container();
        },
      ),
    );
  }

  Widget _buildMap() {
    return GoogleMap(
      initialCameraPosition: CameraPosition(target: _currentLocation, zoom: 15.0),
      onMapCreated: (controller) => _controller = controller,
      mapType: MapType.normal,
      myLocationEnabled: true,
      markers: allStores ? Fixtures.stores : getNearbyStores(),
    );
  }
}
