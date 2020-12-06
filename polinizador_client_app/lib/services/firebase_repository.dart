import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/product.dart';

class FirebaseRepository {
  final _firestore = FirebaseFirestore.instance;

  void create(Product product) {
    try {
      _firestore.collection('products').add(product.toMap());
    } catch (e) {
      print('ERRO: $e');
      rethrow;
    }
  }

  Future<List<Product>> fetch() async {
    try {
      final result = await _firestore.collection('products').get();
      return result.docs.map((snapshot) => Product.fromMap(snapshot.data()));
    } catch (e) {
      print('ERRO: $e');
      rethrow;
    }
  }
}
