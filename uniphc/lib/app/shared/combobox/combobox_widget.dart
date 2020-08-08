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
        margin: EdgeInsets.only(top: 60),
        padding: EdgeInsets.only(left: 30, right: 30, top: 15),
        child: FindDropdown<Model>(
          // Alterar tabela de items do dropdown
          items: items,
          onChanged: (Model item) => onChanged(item),
          selectedItem: itemSelecionado,
          validate: (Model item) {
            if (item == null)
              return "Required field";
            else
              return null;
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
