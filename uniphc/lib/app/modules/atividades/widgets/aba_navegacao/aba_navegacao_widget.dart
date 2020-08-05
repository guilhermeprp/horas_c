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
                color: Colors.indigo[700],
              ),
              child: Image.asset('assets/images/logo_app.png')),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: ListTile(
              title:
                  Center(child: Text('Home', style: TextStyle(fontSize: 18))),
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
            ),
          ),
          Divider(
            height: 20,
            indent: 50,
            endIndent: 50,
          ),
          ListTile(
            title: Center(
                child: Text('Atividades', style: TextStyle(fontSize: 18))),
            onTap: () {
              Navigator.pushNamed(context, '/Atividades');
            },
          ),
          Divider(
            height: 20,
            indent: 50,
            endIndent: 50,
          ),
          ListTile(
            title: Center(
                child: Text('Estatísticas', style: TextStyle(fontSize: 18))),
          ),
          Divider(
            height: 20,
            indent: 50,
            endIndent: 50,
          ),
          ListTile(
            title:
                Center(child: Text('Manuais', style: TextStyle(fontSize: 18))),
          ),
        ],
      ),
    );
  }
}
