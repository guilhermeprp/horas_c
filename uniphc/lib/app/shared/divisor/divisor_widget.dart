import 'package:flutter/material.dart';

class DivisorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2),
      child: Divider(
        color: Colors.grey[300],
        height: 20,
      ),
    );
  }
}
