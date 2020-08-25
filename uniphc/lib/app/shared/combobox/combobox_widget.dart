import 'package:find_dropdown/find_dropdown.dart';
import 'package:flutter/material.dart';

class ComboboxWidget extends StatelessWidget {
  final List<Model> items;
  final Function(Model) onChanged;
  final Model itemSelecionado;

  const ComboboxWidget({
    Key key,
    @required this.items,
    @required this.onChanged,
    @required this.itemSelecionado,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(left: 50, right: 50, top: 5),
        child: FindDropdown<Model>(
          // Alterar tabela de items do dropdown
          items: items,
          onChanged: (Model item) => onChanged(item),
          selectedItem: itemSelecionado,
          loadingBuilder: (BuildContext context) {
            return CircularProgressIndicator();
          },
          validate: (Model item) {
            if (item == null)
              return "Required field";
            else
              return null;
          },

          dropdownBuilder: (_, model) {
            return Container(
              height: 49,
              alignment: Alignment.centerRight,
              decoration: BoxDecoration(
                color: Color(0xFF212121),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 0,
                    color: Color(0xFF212121),
                    spreadRadius: 2,
                    offset: Offset(0, 0),
                  ),
                ],
                border: Border.all(
                  width: 1,
                  color: Color(0xFF70ffff),
                ),
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.indigo[900],
                //     blurRadius: 50, // soften the shadow
                //     spreadRadius: 0, //extend the shadow
                //     offset: Offset(
                //       0, // Move to right 10  horizontally
                //       5, // Move to bottom 5 Vertically
                //     ),
                //   )
                // ],
              ),
              child: Container(
                child: ListTile(
                  leading: Text(
                    "Ciência da Computação",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class Model {
  final String id;
  final String curso;

  Model(this.id, this.curso);

  @override
  String toString() => curso.toString();

  @override
  operator ==(o) => o is Model && o.id == id;

  @override
  int get hashCode => id.hashCode ^ curso.hashCode;
}
