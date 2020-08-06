import 'package:find_dropdown/find_dropdown.dart';
import 'package:flutter/material.dart';

class ComboboxWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 60),
        padding: EdgeInsets.only(left: 30, right: 30, top: 15),
        child: FindDropdown(
          // Alterar tabela de items do dropdown
          items: [
            "Análise de Sistemas",
            "Ciência da Computação",
            "Enfermagem",
            "Jornalismo"
          ],
          onChanged: (String item) => print(item),
          selectedItem: "Ciência da Computação",
          validate: (String item) {
            if (item == null)
              return "Required field";
            // else if (item == "Brasil")
            //   return "Invalid item";
            else
              return null; //return null to "no error"
          },
        ),
      ),
    );
  }
}
