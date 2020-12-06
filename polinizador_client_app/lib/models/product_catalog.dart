import 'package:flutter/material.dart';
import 'package:polinizador_client_app/util/fixtures.dart';

import '../services/firebase_repository.dart';
import 'product.dart';

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
    return _items = [...Fixtures.products];
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
