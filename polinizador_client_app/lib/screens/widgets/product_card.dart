import 'dart:ui';

import 'package:flutter/material.dart';

import '../../models/product.dart';
import '../product_details_screen.dart';

class ProductTile extends StatelessWidget {
  final Product product;

  const ProductTile(this.product, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.name),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(product.imageUrl),
      ),
      trailing: Text(
        'R\$ ${product.price}',
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
      contentPadding: const EdgeInsets.all(0),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ProductDetailsScreen(product),
        ));
      },
    );
  }
}
