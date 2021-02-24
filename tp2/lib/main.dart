import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TP2',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.white,
      ),
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('TP2'),
        ),
        body: ListView(
          children: <Widget>[
            Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Exercice1(),
                    ),
                  );
                },
                title: Text('Exercice 1'),
                subtitle: Text('Afficher une image'),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Exercice2(),
                    ),
                  );
                },
                title: Text('Exercice 2'),
                subtitle: Text('Transformer une image'),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DisplayTileWidget(),
                    ),
                  );
                },
                title: Text('Exercice 4'),
                subtitle: Text("Affichage d'une tuile"),
              ),
            ),
          ],
        ));
  }
}

Widget Exercice1() {
  return Scaffold(
    appBar: AppBar(
      title: Text('Exercice 1'),
    ),
    body:
        Center(child: Image(image: NetworkImage('https://picsum.photos/512'))),
  );
}

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

class Tile {
  String imageURL;
  Alignment alignment;

  Tile({this.imageURL, this.alignment});

  Widget croppedImageTile() {
    return FittedBox(
      fit: BoxFit.fill,
      child: ClipRect(
        child: Container(
          child: Align(
            alignment: this.alignment,
            widthFactor: 0.2,
            heightFactor: 0.2,
            child: Image.network(this.imageURL),
          ),
        ),
      ),
    );
  }
}

Tile tile =
    new Tile(imageURL: 'https://picsum.photos/512', alignment: Alignment(0, 0));

class DisplayTileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Affichage d'une tuile"),
        centerTitle: true,
      ),
      body: Center(
          child: Column(children: [
        SizedBox(
            width: 150.0,
            height: 150.0,
            child: Container(
                margin: EdgeInsets.all(20.0),
                child: this.createTileWidgetFrom(tile))),
        Container(
            height: 200,
            child:
                Image.network('https://picsum.photos/512', fit: BoxFit.cover))
      ])),
    );
  }

  Widget createTileWidgetFrom(Tile tile) {
    return InkWell(
      child: tile.croppedImageTile(),
      onTap: () {
        print("tapped on tile");
      },
    );
  }
}
