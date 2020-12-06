import 'dart:ui';

import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  const ProductDetailsScreen(this.product, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              height: MediaQuery.of(context).size.height * .4,
            ),
            Text(
              'R\$ ${product.price}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16),
              height: 50,
              child: RaisedButton(
                child: Text(
                  'COMPRAR',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                color: Theme.of(context).accentColor,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
