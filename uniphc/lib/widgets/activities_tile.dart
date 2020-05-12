import 'package:flutter/material.dart';

class ActivitiesTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> _listaAtividades = <String>[
      'Curso específico da área - Presencial',
      'Curso específico da área - EAD',
      'Curso não específico da área - Presencial',
      'Curso não específico da área - EAD',
      'Peça Teatral',
      'Exposições Culturais',
      'Museu',
      'Livro correlato ou indicado',
      'Exposições Técnicas',
      'Feiras Técnicas'
    ];

    return SingleChildScrollView(
      // child: ConstrainedBox(
      //        constraints: BoxConstraints(
      //          minHeight: viewportConstraints.maxHeight,
      //        ),
      child: Card(
        child: Column(
          children: <Widget>[
            ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: _listaAtividades.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ListTile(
                        title: Text('${(_listaAtividades[index])}'),
                        subtitle: Text('data'),
                      ),
                      Slider(min: 0, max: 20, value: 10, onChanged: null),
                    ],
                  );
                }),
          ],
        ),
      ),
    );
  }
}
