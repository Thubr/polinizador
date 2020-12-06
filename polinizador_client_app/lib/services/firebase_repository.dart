import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/product.dart';
import '../models/store.dart';

class FirebaseRepository {
  final _firestore = FirebaseFirestore.instance;

  void create(Product product) {
    try {
      _firestore.collection('produtos').add(product.toJson());
    } catch (e) {
      print('ERRO: $e');
      rethrow;
    }
  }

  Future<List<Product>> fetchProducts() async {
    try {
      final result = await _firestore.collection('produtos').get();
      return result.docs.map((snapshot) => Product.fromJson(snapshot.data())).toList();
    } catch (e) {
      print('ERRO: $e');
      rethrow;
    }
  }

  Future<List<Store>> fetchStores() async {
    try {
      final result = await _firestore.collection('lojas').get();
      return result.docs.map((snapshot) {
        final data = snapshot.data();
        return Store.fromJson(data);
      }).toList();
    } catch (e) {
      print('ERRO: $e');
      rethrow;
    }
  }
}
