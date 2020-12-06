import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';
import '../models/product_catalog.dart';
import 'generate_qr_code_screen.dart';
import 'google_maps_screen.dart';
import 'product_details_screen.dart';
import 'scanner_screen.dart';
import 'widgets/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductsCatalog>(context, listen: false);

    void _scanQRCode() {
      Navigator.of(context)
          .push<Product>(MaterialPageRoute(builder: (context) => const ScannerScreen()))
          .then((product) => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductDetailsScreen(product))));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Polinizador'),
        actions: [
          IconButton(
            icon: (Icon(Icons.add)),
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const GenerateQRCodeScreen())),
          ),
          IconButton(
            icon: Icon(Icons.qr_code),
            onPressed: _scanQRCode,
          ),
        ],
      ),
      body: FutureBuilder(
        future: products.fetchProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text('erro'),
            );
          } else {
            return const Body();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.location_on),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => const GoogleMapsScreen()));
        },
      ),
    );
  }
}
