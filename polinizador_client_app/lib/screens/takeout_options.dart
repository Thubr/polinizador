import 'package:flutter/material.dart';

import '../models/product.dart';
import 'in_store_pickup.dart';

class TakeoutOptions extends StatelessWidget {
  final Product product;

  const TakeoutOptions(this.product, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Escolha a forma de entrega'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Card(
                elevation: 6,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                margin: const EdgeInsets.all(20),
                child: GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => InStorePickup(product))),
                  child: SizedBox(
                    height: size.height / 4,
                    child: Center(
                      child: Text(
                        'Desejo retirar na loja',
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 100),
            Expanded(
              child: Card(
                elevation: 6,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                margin: const EdgeInsets.all(20),
                child: SizedBox(
                  height: size.height / 4,
                  child: Center(
                    child: Text(
                      'Desejo que entregue no meu endereço',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
