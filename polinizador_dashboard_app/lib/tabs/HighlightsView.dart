import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:polinizador_dashboard_app/widgets/ProductCard.dart';

class HighlightsView extends StatefulWidget {
  HighlightsView({Key key}) : super(key: key);

  @override
  _HighlightsViewState createState() => _HighlightsViewState();
}

class _HighlightsViewState extends State<HighlightsView> {

  List<Widget> _buildCardList() {
    List<String> productList = [
      "AirFryer - vendido 100 vezes",
      "Laptop Samsung - vendido 80 vezes",
    ];
    return productList.map((item) => Container(
      child: Container(
        margin: EdgeInsets.all(5.0),
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: Stack(
              children: <Widget>[
                Image.network("https://via.placeholder.com/150", width: 200),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    child: Text(
                      '$item',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            )
        ),
      ),
    )).toList();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Em destaque", style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            CarouselSlider(
              options: CarouselOptions(
                enableInfiniteScroll: true,
                height: 200,

              ),
              items: _buildCardList().map((item) => Container(
                child: Center(
                    child: item
                ),
                color: Colors.transparent,
              )).toList(),
            )
          ],
        ),
      ),
    );
  }
}