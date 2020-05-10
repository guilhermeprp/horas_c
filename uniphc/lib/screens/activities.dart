import 'package:flutter/material.dart';

class MyActivities extends StatefulWidget {
  @override
  _MyActivitiesState createState() => _MyActivitiesState();
}

class _MyActivitiesState extends State<MyActivities> {
  final List<String> listaAtividades = <String>[
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

  @override
  Widget build(BuildContext context) {
    //appbar
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      appBar: AppBar(
        backgroundColor: Colors.indigo[600],
        centerTitle: true,
        title: Text('UNIP HC'),
      ),

      //lista
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemCount: listaAtividades.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(title: Text('${listaAtividades[index]}')),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),

      //botao calcular
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Calcular'),
        onPressed: () {
          ('Pressed');
        },
        backgroundColor: Colors.green,
      ),
    );
  }
}

// class Slide extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Slider(
//       value: 10,
//       onChanged: (double value) {},
//     );
//   }
// }
