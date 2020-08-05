import 'package:flutter/material.dart';

class AbaNavegacao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.indigo[900],
              ),
              child: Image.asset('assets/images/logo_app.png')),
          ListTile(
            title: Center(child: Text('Home')),
          ),
          Divider(
            height: 20,
            indent: 50,
            endIndent: 50,
          ),
          ListTile(
            title: Center(child: Text('Atividades')),
          ),
          Divider(
            height: 20,
            indent: 50,
            endIndent: 50,
          ),
          ListTile(
            title: Center(child: Text('Estatísticas')),
          ),
          Divider(
            height: 20,
            indent: 50,
            endIndent: 50,
          ),
          ListTile(
            title: Center(child: Text('Manuais')),
          ),
        ],
      ),
    );
  }
}
