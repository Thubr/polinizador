import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../models/product.dart';
import '../models/store.dart';
import '../services/firebase_repository.dart';
import '../services/geolocation_service.dart';
import '../util/extensions.dart';

class InStorePickup extends StatefulWidget {
  final repository = FirebaseRepository();
  final Product product;

  InStorePickup(this.product, {Key key}) : super(key: key);

  @override
  _InStorePickupState createState() => _InStorePickupState();
}

class _InStorePickupState extends State<InStorePickup> {
  GoogleMapController _controller;
  LatLng _currentLocation;
  bool allStores = false;
  List<Store> stores;

  List<Store> filterByProduct() {
    return stores
        .where((element) => element.stock.entries.any((entry) {
              if (entry.value > 0 && entry.key == widget.product.id) return true;
              return false;
            }))
        .toList();
  }

  Future<void> getCurrentLocation() async {
    final position = await GeolocationService.getCurrentLocation();
    return _currentLocation = position.toLatLng();
  }

  Set<Marker> mapToMarker(List<Store> stores) {
    return stores
        .map((store) => Marker(
              markerId: MarkerId(store.id),
              infoWindow: InfoWindow(title: store.title),
              position: LatLng(store.latitude, store.longitude),
            ))
        .toSet();
  }

  Future<void> getAllStores() async => stores = await widget.repository.fetchStores();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Retirar na loja'),
        actions: [
          IconButton(
            icon: Icon(allStores ? Icons.visibility_off : Icons.visibility),
            onPressed: () => setState(() => allStores = !allStores),
          ),
        ],
      ),
      body: FutureBuilder(
        future: Future.wait([getCurrentLocation(), getAllStores()]),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done)
            return Column(
              children: [
                SizedBox(
                  height: 300,
                  child: FutureBuilder(
                    builder: (context, snapshot) {
                      return _buildMap();
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  allStores ? 'Todas as lojas' : 'Lojas que possuem seu produto em estoque',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Expanded(child: _buildStoresList()),
              ],
            );
          return const Center(child: CircularProgressIndicator());
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
      markers: mapToMarker(stores),
    );
  }

  Widget _buildStoresList() {
    List<Store> storesList;
    if (allStores)
      storesList = [...stores];
    else
      storesList = filterByProduct();
    return ListView.builder(
      itemBuilder: (context, index) {
        final store = storesList[index];
        return ListTile(
          key: ValueKey(store.latitude),
          title: Text(store.title),
          onTap: () async => await _controller.animateCamera(CameraUpdate.newLatLng(LatLng(store.latitude, store.longitude))),
          trailing: Text('${store.stock[widget.product.id]} em estoque'),
        );
      },
      itemCount: storesList.length,
    );
  }
}
