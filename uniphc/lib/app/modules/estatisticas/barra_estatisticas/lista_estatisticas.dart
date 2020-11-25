import 'package:flutter/material.dart';
import 'package:uniphc/app/shared/divisor/divisor_widget.dart';
import 'package:uniphc/app/modules/estatisticas/barra_estatisticas/estatistica_default.dart';

class ListaEstatisticas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(25, 220, 25, 30),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black38,
                blurRadius: 20,
                spreadRadius: 0,
                offset: Offset(2, 1),
              ),
            ],
            color: Color(0xFF202125),
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          child: Column(
            children: [
              EstatisticaDefault(atividade: "Curso EAD não específico"),
              DivisorWidget(),
              Row(
                children: [
                  Container(
                    width: 245,
                    height: 100,
                    alignment: AlignmentDirectional(-1, 0),
                    padding: EdgeInsets.only(left: 25),
                    child: Text(
                      "Curso EAD específico",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: "ArialRounded",
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.transparent,
                          value: 1,
                          strokeWidth: 5,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Color(0xFF18d8f4),
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          "120",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        margin: EdgeInsets.fromLTRB(33, 17, 0, 0),
                      ),
                    ],
                  ),
                ],
              ),
              DivisorWidget(),
              EstatisticaDefault(atividade: "Curso presencial não específico"),
              DivisorWidget(),
              EstatisticaDefault(atividade: "Atividades Técnicas na área"),
              DivisorWidget(),
              EstatisticaDefault(
                  atividade: "Grupo de estudo, pesquisa ou desenvolvimento"),
              DivisorWidget(),
              EstatisticaDefault(atividade: "Visitas Técnicas"),
              DivisorWidget(),
              EstatisticaDefault(
                  atividade:
                      "Produções técnicas, culturais, bibliográficas e artísticas"),
              DivisorWidget(),
              EstatisticaDefault(atividade: "Programa Nivelamento"),
              DivisorWidget(),
              EstatisticaDefault(
                  atividade:
                      "Eventos específicos, promovidos pela coordenação"),
              DivisorWidget(),
              Row(
                children: [
                  Container(
                    width: 245,
                    height: 100,
                    alignment: AlignmentDirectional(-1, 0),
                    padding: EdgeInsets.only(left: 25),
                    child: Text(
                      "Palestras na área ou correlatos",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: "ArialRounded",
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.transparent,
                          value: 1,
                          strokeWidth: 5,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Color(0xFF18d8f4),
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          "60",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        margin: EdgeInsets.fromLTRB(37, 17, 0, 0),
                      ),
                    ],
                  ),
                ],
              ),
              DivisorWidget(),
              EstatisticaDefault(atividade: "Artigo Científicos"),
              DivisorWidget(),
              EstatisticaDefault(atividade: "Eventos na área"),
              DivisorWidget(),
              EstatisticaDefault(atividade: "Livro correlato ou indicado"),
              DivisorWidget(),
              EstatisticaDefault(atividade: "Exposições Culturais"),
              DivisorWidget(),
              EstatisticaDefault(atividade: "Exposição técnicas"),
              DivisorWidget(),
              EstatisticaDefault(atividade: "Filme ou documentário"),
              DivisorWidget(),
              EstatisticaDefault(
                  atividade: "Artigo de Jornal ou Revista na área"),
              DivisorWidget(),
              EstatisticaDefault(atividade: "Feiras Técnicas"),
              DivisorWidget(),
              EstatisticaDefault(atividade: "Museu"),
            ],
          ),
        ),
      ],
    );
  }
}
