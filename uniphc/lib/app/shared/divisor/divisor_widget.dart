import 'package:flutter/material.dart';

class DivisorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2),
      child: Divider(
        color: Color(0xFF16171b),
        height: 20,
      ),
    );
  }
}
