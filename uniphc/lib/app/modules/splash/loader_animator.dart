import 'package:flare_flutter/flare_actor.dart';
import "package:flutter/material.dart";

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: FlareActor(
          "assets/images/loading_logo.flr",
          animation: "Roda",
          antialias: true,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
