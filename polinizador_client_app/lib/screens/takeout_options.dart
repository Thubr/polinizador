import 'package:flutter/material.dart';
import 'package:polinizador_client_app/models/product.dart';
import 'package:polinizador_client_app/screens/in_store_pickup.dart';

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
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 10),
            Expanded(
              child: Card(
                elevation: 10,
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
            const SizedBox(width: 10),
            Expanded(
              child: Card(
                elevation: 10,
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
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
