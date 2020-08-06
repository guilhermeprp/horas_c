import 'package:flutter/material.dart';
import 'package:uniphc/app/shared/divisor/divisor_widget.dart';

class AbaNavegacao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 20),
            height: 180,
            width: 180,
            child: Image.asset('assets/images/logo_listview.png'),
          ),
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
          DivisorWidget(),
          ListTile(
            title: Center(
                child: Text('Atividades', style: TextStyle(fontSize: 18))),
            onTap: () {
              Navigator.pushNamed(context, '/Atividades');
            },
          ),
          DivisorWidget(),
          ListTile(
            title: Center(
                child: Text('Estatísticas', style: TextStyle(fontSize: 18))),
          ),
          DivisorWidget(),
          ListTile(
            title:
                Center(child: Text('Manuais', style: TextStyle(fontSize: 18))),
          ),
        ],
      ),
    );
  }
}
