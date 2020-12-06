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
      color: PolinizadorColors.cardBackground,
      child: InkWell(
        onTap: () {
          print("Card '$title' pressed");
          },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Image.network(imageURL ?? "https://via.placeholder.com/150", width: 150, height: 150, fit: BoxFit.fitHeight,),
            Padding(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(title, style: TextStyle(color: PolinizadorColors.white60),),
                  description ?? SizedBox(width: 0, height: 0),
                ],
              ),
              padding: EdgeInsets.only(right: 20),
            )
          ],
        ),
      )
    );
  }

}