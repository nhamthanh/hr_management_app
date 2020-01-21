import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  const Home({this.title = ""});

  final String title;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(title);
  }

}