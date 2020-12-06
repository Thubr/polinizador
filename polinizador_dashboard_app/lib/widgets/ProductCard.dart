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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Image.network(imageURL ?? "https://via.placeholder.com/150"),
            Padding(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(title, style: TextStyle(color: Colors.black54),),
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