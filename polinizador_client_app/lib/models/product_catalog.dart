import 'package:flutter/material.dart';

import '../services/firebase_repository.dart';
import 'product.dart';

final list = [
  Product(
    id: '1',
    name: 'Airfryer',
    description: 'Lorem ipsum',
    price: 1100.99,
    imageUrl: 'https://cdn.awsli.com.br/600x700/525/525768/produto/38110721/e31fbbfcea.jpg',
  ),
  Product(
    id: '2',
    name: 'Tẽnis',
    description: 'lorem ipsum',
    price: 299.99,
    imageUrl: 'https://imgcentauro-a.akamaihd.net/500x500/M02ZFU02/tenis-feminino-preto-torani-com-glitter-img.jpg',
  ),
];

class ProductsCatalog with ChangeNotifier {
  final FirebaseRepository _repository;

  ProductsCatalog(this._repository);

  List<Product> _items = [];
  List<Product> get items => [..._items];

  Future<void> fetchProducts() async {
    // try {
    //   final products = await _repository.fetch();
    //   return _items = [...products];
    // } catch (e) {
    //   return Exception();
    // }
    return _items = [...list];
  }

  void addProduct(Product product) {
    _items.add(product);
    notifyListeners();
  }

  void removeProduct(Product product) {
    _items.remove(product);
    notifyListeners();
  }
}
