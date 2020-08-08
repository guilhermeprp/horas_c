import 'dart:ui' show ImageFilter;

import 'package:flutter/material.dart';

class AbaNavegacao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Color.fromRGBO(255, 255, 255, 0.1),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 30.0,
          sigmaY: 30.0,
        ),
        child: Container(
          child: Drawer(
            child: ListView(
              children: <Widget>[
                // Logo
                Container(
                  margin: EdgeInsets.only(top: 20),
                  height: 180,
                  width: 180,
                  child: Image.asset('assets/images/logo_app.png'),
                ),

                // Home
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: ListTile(
                    leading: Icon(Icons.home, color: Colors.white),
                    title: Text('Home',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w300)),
                    onTap: () {
                      Navigator.pushNamed(context, '/');
                    },
                  ),
                ),

                // Atividades
                ListTile(
                  leading: Icon(Icons.assignment, color: Colors.white),
                  title: Text('Atividades',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w300)),
                  onTap: () {
                    Navigator.pushNamed(context, '/Atividades');
                  },
                ),

                // Estatísticas
                ListTile(
                  leading: Icon(Icons.data_usage, color: Colors.white),
                  title: Text('Estatísticas',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w300)),
                ),

                // Manuais
                ListTile(
                  leading: Icon(Icons.picture_as_pdf, color: Colors.white),
                  title: Text('Manuais',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w300)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
