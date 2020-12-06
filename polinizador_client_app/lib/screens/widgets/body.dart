import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/product_catalog.dart';
import 'product_card.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Catálogo'),
          Expanded(
            child: Consumer<ProductsCatalog>(
              builder: (context, products, child) {
                return ListView.separated(
                  itemBuilder: (context, index) {
                    final product = products.items[index];
                    return ProductTile(product);
                  },
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: products.items.length,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
