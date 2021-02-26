import 'package:flutter/material.dart';
import 'dart:math' as math;

class Exercice2 extends StatefulWidget {
  @override
  _Exercice2State createState() => _Exercice2State();
}

class _Exercice2State extends State<Exercice2> {
  double rotationXValue = 0;
  double rotationZValue = 0;
  double scaleValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercice 2'),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Transform.rotate(
              angle: rotationXValue * math.pi / 160,
              child: Container(
                height: 450,
                width: 450,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(color: Colors.blue),
                child: Image(image: NetworkImage('https://picsum.photos/512')),
              ),
            ),
          ),
          Slider(
            min: 0.0,
            max: 100.0,
            activeColor: Colors.blue,
            inactiveColor: Colors.grey,
            value: rotationXValue,
            label: rotationXValue.round().toString(),
            onChanged: (double newXvalue) {
              setState(() {
                rotationXValue = newXvalue;
              });
            },
          ),
          Slider(
            min: 0.0,
            max: 100.0,
            activeColor: Colors.blue,
            inactiveColor: Colors.grey,
            value: rotationZValue,
            label: rotationZValue.round().toString(),
            onChanged: (double newZvalue) {
              setState(() {
                rotationZValue = newZvalue;
              });
            },
          ),
          Slider(
            min: 0.0,
            max: 100.0,
            activeColor: Colors.blue,
            inactiveColor: Colors.grey,
            value: scaleValue,
            label: scaleValue.round().toString(),
            onChanged: (double newScalevalue) {
              setState(() {
                scaleValue = newScalevalue;
              });
            },
          ),
        ],
      ),
    );
  }
}
