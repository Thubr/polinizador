import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product_catalog.dart';
import 'widgets/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductsCatalog>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Polinizador'),
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
    );
  }
}
