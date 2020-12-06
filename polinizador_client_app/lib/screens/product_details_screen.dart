import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_simple_rating_bar/flutter_simple_rating_bar.dart';
import 'package:polinizador_client_app/screens/takeout_options.dart';

import '../models/product.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  ProductDetailsScreen(this.product, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SizedBox(
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              height: MediaQuery.of(context).size.height * .4,
            ),
            const Spacer(),
            Text(
              'R\$ ${product.price}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),
            ),
            const SizedBox(height: 10),
            Text(product.description),
            const SizedBox(height: 30),
            RatingBar(
              rating: 3,
              icon: Icon(Icons.star, size: 40, color: Colors.grey),
              starCount: 5,
              spacing: 5.0,
              size: 40,
              isIndicator: false,
              allowHalfRating: true,
              onRatingCallback: (double value, ValueNotifier<bool> isIndicator) {
                isIndicator.value = true;
              },
              color: Colors.amber,
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16),
              height: 50,
              width: double.infinity,
              child: RaisedButton(
                child: Text(
                  'COMPRAR',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                color: Theme.of(context).accentColor,
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => TakeoutOptions(product))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
