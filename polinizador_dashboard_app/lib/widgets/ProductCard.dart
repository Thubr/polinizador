import 'package:flutter/material.dart';
import 'package:polinizador_dashboard_app/theme.dart';

class ProductCard extends StatelessWidget {
  final String imageURL;
  final String title;
  final Widget description;

  ProductCard(this.title, {this.imageURL, this.description, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Colors.white,
      child: InkWell(
        onTap: () {
          print("Card '$title' pressed");
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Image.network(imageURL ?? "https://via.placeholder.com/150", width: 150, height: 150, fit: BoxFit.fitHeight),
            Padding(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(color: Colors.black, fontSize: 22)),
                  description ?? SizedBox(width: 0, height: 0),
                ],
              ),
              padding: const EdgeInsets.only(right: 20),
            )
          ],
        ),
      ),
    );
  }
}
