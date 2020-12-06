import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_simple_rating_bar/flutter_simple_rating_bar.dart';

import '../models/product.dart';
import 'takeout_options.dart';

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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                child: Image.network(
                  product.imageUrl,
                  fit: BoxFit.fitHeight,
                  width: double.infinity,
                ),
                height: MediaQuery.of(context).size.height * .4,
              ),
              const SizedBox(height: 10),
              Text(
                'R\$ ${product.price}',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
              const SizedBox(height: 20),
              Text('DESCRIÇÃO', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
              Text(product.description, style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
              const SizedBox(height: 20),
              Text('AVALIAÇÕES', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
              Center(
                child: RatingBar(
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
              ),
              const SizedBox(height: 20),
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
      ),
    );
  }
}
