import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:polinizador_dashboard_app/theme.dart';
import 'package:polinizador_dashboard_app/utils/adaptive.dart';
import 'package:polinizador_dashboard_app/widgets/ProductCard.dart';

import '../data.dart';

class HighlightsView extends StatefulWidget {
  HighlightsView({Key key}) : super(key: key);

  @override
  _HighlightsViewState createState() => _HighlightsViewState();
}

class _HighlightsViewState extends State<HighlightsView> {
  @override
  Widget build(BuildContext context) {
    final alerts = DummyDataService.getAlerts(context);

    return Scaffold(
      appBar: AppBar(
        title:
            Text("Em destaque", style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold, fontFamily: GoogleFonts.poppins().fontFamily)),
      ),
      body: isDisplayDesktop(context)
          ? SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 7,
                      child: Semantics(
                        sortKey: const OrdinalSortKey(1, name: "highlights"),
                        child: const _OverviewGrid(spacing: 24),
                      ),
                    ),
                    const SizedBox(width: 24),
                    Flexible(
                      flex: 3,
                      child: Container(
                        width: 400,
                        child: Semantics(
                          sortKey: const OrdinalSortKey(2, name: "highlights"),
                          child: FocusTraversalGroup(
                            child: _AlertsView(alerts: alerts),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Column(
                  children: [
                    _AlertsView(alerts: alerts.sublist(0, 1)),
                    const SizedBox(height: 12),
                    const _OverviewGrid(spacing: 12),
                  ],
                ),
              ),
            ),
    );
  }
}

class _OverviewGrid extends StatelessWidget {
  const _OverviewGrid({Key key, @required this.spacing}) : super(key: key);

  final double spacing;

  List<Widget> _buildCardSoldList() {
    List<Widget> soldProductList = [
      ProductCard("Fritadeira elétrica",
          imageURL:
              "https://novomundo.vteximg.com.br/arquivos/ids/2210968-500-500/fritadeira-sem-oleo-air-fryer-maxis-1270w-32l-pretoprata-af-33-220v-61410-0.jpg?v=637215249872830000",
          description: Text(
            "200 unidades vendidas!",
            style: TextStyle(color: Colors.black),
          )),
      ProductCard("Samsung Laptop",
          imageURL:
              "https://a-static.mlcdn.com.br/618x463/notebook-samsung-book-x30-intel-core-i5-8gb-1tb-156-windows-10/magazineluiza/225395400/1686bb5ef5ac278b8948e4573c88bfc0.jpg",
          description: Text(
            "80 unidades vendidades!",
            style: TextStyle(color: Colors.black),
          ))
    ];
    return soldProductList
        .map((item) => Container(
              child: Container(
                  margin: EdgeInsets.all(5.0), child: ClipRRect(borderRadius: BorderRadius.all(Radius.circular(5.0)), child: item)),
            ))
        .toList();
  }

  List<Widget> _buildCardSeenList() {
    List<Widget> seenProductList = [
      ProductCard("Fritadeira elétrica",
          imageURL:
              "https://novomundo.vteximg.com.br/arquivos/ids/2210968-500-500/fritadeira-sem-oleo-air-fryer-maxis-1270w-32l-pretoprata-af-33-220v-61410-0.jpg?v=637215249872830000",
          description: Text(
            "1000 pessoas visualizaram!",
            style: TextStyle(color: Colors.black),
          )),
      ProductCard("Samsung Laptop",
          imageURL:
              "https://a-static.mlcdn.com.br/618x463/notebook-samsung-book-x30-intel-core-i5-8gb-1tb-156-windows-10/magazineluiza/225395400/1686bb5ef5ac278b8948e4573c88bfc0.jpg",
          description: Text(
            "650 pessoas visualizaram!",
            style: TextStyle(color: Colors.black),
          ))
    ];
    return seenProductList
        .map((item) => Container(
              child: Container(
                  margin: EdgeInsets.all(5.0), child: ClipRRect(borderRadius: BorderRadius.all(Radius.circular(5.0)), child: item)),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      // Only display multiple columns when the constraints allow it and we
      // have a regular text scale factor.
      final minWidthForTwoColumns = 600;
      final hasMultipleColumns = isDisplayDesktop(context) && constraints.maxWidth > minWidthForTwoColumns;
      final boxWidth = hasMultipleColumns ? constraints.maxWidth / 2 - spacing / 2 : double.infinity;

      return Wrap(
        runSpacing: spacing,
        children: [
          Container(
            width: boxWidth,
            child: Card(
                color: Colors.white,
                child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                  FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Container(
                      alignment: Alignment.center,
                      width: 600,
                      height: 50,
                      color: PolinizadorColors.inputBackground,
                      child: Text("Mais vendidos",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white), textAlign: TextAlign.center),
                    ),
                  ),
                  CarouselSlider(
                      options: CarouselOptions(
                        enableInfiniteScroll: true,
                        height: 250,
                      ),
                      items: _buildCardSoldList()),
                ])),
          ),
          if (hasMultipleColumns) SizedBox(width: spacing),
          Container(
              width: boxWidth,
              child: Card(
                  color: Colors.white,
                  child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Container(
                        alignment: Alignment.center,
                        width: 600,
                        height: 50,
                        color: PolinizadorColors.inputBackground,
                        child: Text("Mais visualizados",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white), textAlign: TextAlign.center),
                      ),
                    ),
                    CarouselSlider(
                        options: CarouselOptions(
                          enableInfiniteScroll: true,
                          height: 250,
                        ),
                        items: _buildCardSeenList()),
                  ]))),
          Container(
              width: boxWidth,
              child: Card(
                  color: Colors.white,
                  child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Container(
                        alignment: Alignment.center,
                        width: 600,
                        height: 50,
                        color: PolinizadorColors.inputBackground,
                        child: Text("Resumo",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white), textAlign: TextAlign.center),
                      ),
                    ),
                    SizedBox(height: spacing),
                    Image.network(
                        "https://natanaeloliveira.com/hosted/images/5a/7963b0756d11e89d5061af0ee36563/Screen-Shot-2018-06-21-at-12.56.11-PM.png")
                  ]))),
        ],
      );
    });
  }
}

class _AlertsView extends StatelessWidget {
  const _AlertsView({Key key, this.alerts}) : super(key: key);

  final List<AlertData> alerts;

  @override
  Widget build(BuildContext context) {
    final isDesktop = isDisplayDesktop(context);

    return Container(
      padding: const EdgeInsetsDirectional.only(start: 16, top: 4, bottom: 4),
      color: PolinizadorColors.buttonColor,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: isDesktop ? const EdgeInsets.symmetric(vertical: 16) : null,
            child: MergeSemantics(
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text(
                    "Alertas",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  if (!isDesktop)
                    TextButton(
                      style: TextButton.styleFrom(primary: Colors.white),
                      onPressed: () {},
                      child: Text("Ver tudo"),
                    ),
                ],
              ),
            ),
          ),
          for (AlertData alert in alerts) ...[
            Container(color: PolinizadorColors.primaryBackground, height: 1),
            _Alert(alert: alert),
          ]
        ],
      ),
    );
  }
}

class _Alert extends StatelessWidget {
  const _Alert({
    Key key,
    @required this.alert,
  }) : super(key: key);

  final AlertData alert;

  @override
  Widget build(BuildContext context) {
    return MergeSemantics(
      child: Container(
        padding: isDisplayDesktop(context) ? const EdgeInsets.symmetric(vertical: 8) : null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(alert.message, style: const TextStyle(fontSize: 16)),
            ),
            SizedBox(
              width: 100,
              child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(alert.iconData, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
