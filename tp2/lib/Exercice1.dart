import 'package:flutter/material.dart';

Widget Exercice1() {
  return Scaffold(
    appBar: AppBar(
      title: Text('Exercice 1'),
    ),
    body:
        Center(child: Image(image: NetworkImage('https://picsum.photos/512'))),
  );
}
