
// tela principal
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'MarcarPontoPage.dart';
import 'main.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ponto Legal'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.fromLTRB(0, 60, 0, 0),
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Início'),
              onTap: () {
                Navigator.pop(context);
              },
            ),           ListTile(
              leading: Icon(Icons.alarm),
              title: Text('Marcar Ponto'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MarcarPontoPage(),
                  ),

                );
              },
            ),
            ListTile(
              leading: Icon(Icons.monetization_on),
              title: Text('Recibo de Pagamento'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Configuração'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Conteúdo'),
      ),
    );
  }
}