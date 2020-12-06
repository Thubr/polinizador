import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {

  final String imageURL;
  final String title;
  final Widget description;


  ProductCard(this.title, {this.imageURL, this.description, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          print("Card '$title' pressed");
          },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.network(imageURL ?? "https://via.placeholder.com/150"),
            Text(title, style: TextStyle(color: Colors.black54),),
            description ?? SizedBox(width: 0, height: 0),
          ],
        ),
      )
    );
  }

}