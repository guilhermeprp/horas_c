import 'dart:ui' show ImageFilter;

import 'package:flutter/material.dart';

class AbaNavegacao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context)
          .copyWith(canvasColor: Color.fromRGBO(0, 30, 90, 0.2)),
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
                  margin: EdgeInsets.only(top: 30),
                  height: MediaQuery.of(context).size.height * 0.27,
                  child: Image.asset('assets/images/logo_app.png'),
                ),

                // Home
                Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.home, color: Colors.white),
                        title: Text(
                          'Home',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w300),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, '/Home');
                        },
                      ),

                      // Atividades
                      ListTile(
                        leading: Icon(Icons.assignment, color: Colors.white),
                        title: Text(
                          'Atividades',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w300),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, '/Atividades');
                        },
                      ),

                      // Estatísticas
                      ListTile(
                        leading: Icon(Icons.data_usage, color: Colors.white),
                        title: Text(
                          'Estatísticas',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w300),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, '/Estatisticas');
                        },
                      ),

                      // Manuais
                      ListTile(
                        leading:
                            Icon(Icons.picture_as_pdf, color: Colors.white),
                        title: Text(
                          'Manuais',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
