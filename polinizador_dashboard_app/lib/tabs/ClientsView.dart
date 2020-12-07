import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ClientsView extends StatefulWidget {
  ClientsView({Key key}) : super(key: key);

  @override
  _ClientsViewState createState() => _ClientsViewState();
}

class _ClientsViewState extends State<ClientsView> {
  
  List<Widget> _buildClientList() {
    return [
      InkWell(
          child: ListTile(leading: Icon(Icons.person), title: Text("Ciclano Lopes"), trailing: Icon(Icons.check_circle),),
          onTap: () {
            print("tapped 1");
          }
      ),
      InkWell(
        child: ListTile(leading: Icon(Icons.person), title: Text("Ciclano Oliveira"), trailing: Icon(Icons.check_circle),),
        onTap: () {
          print("tapped 2");
        }
      ),
      InkWell(
          child: ListTile(leading: Icon(Icons.person), title: Text("Fulano da Silva"), subtitle: Text("Problemas durante a compra!"), trailing: Icon(Icons.warning),),
          onTap: () {
            print("tapped 3");
          }
      ),
      InkWell(
        child: ListTile(leading: Icon(Icons.person), title: Text("Fulana dos Santos"), trailing: Icon(Icons.check_circle),),
        onTap: () {
          print("tapped 4");
        }
      ),
    ];
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Atendimento ao cliente", style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold, fontFamily: GoogleFonts.poppins().fontFamily)),
      ),
      body:
      Container(
        height: 200,
        width: 500,
        child: Card(
          child: ListView(
            children: _buildClientList(),
            shrinkWrap: true,
          )
        )
      )
    );
  }
}