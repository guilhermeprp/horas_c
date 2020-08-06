import 'package:flutter/material.dart';

class DivisorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Colors.grey[300],
      height: 20,
      indent: 50,
      endIndent: 50,
    );
  }
}
