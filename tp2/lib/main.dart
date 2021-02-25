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
            Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Exercice5a(),
                    ),
                  );
                },
                title: Text('Exercice 5.a'),
                subtitle: Text("Génération du plateau de tuiles"),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Exercice5b(),
                    ),
                  );
                },
                title: Text('Exercice 5.b'),
                subtitle: Text(
                    "Génération du plateau de tuiles à partir d'une image"),
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
            alignment: Alignment.centerLeft,
            widthFactor: 0.3,
            heightFactor: 0.3,
            child: Image.network(this.imageURL),
          ),
        ),
      ),
    );
  }

  Widget croppedImageTile2(int index, int taille) {
    int q = index ~/ taille;
    int r = index % taille;
    int n = taille - 1;

    return FittedBox(
      fit: BoxFit.fill,
      child: ClipRect(
        child: Container(
          child: Align(
            alignment: FractionalOffset(r / n, q / n),
            widthFactor: 1 / taille,
            heightFactor: 1 / taille,
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

class Exercice5a extends StatefulWidget {
  @override
  _Exercice5aState createState() => _Exercice5aState();
}

class _Exercice5aState extends State<Exercice5a> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Exercice 5a'),
        ),
        body: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, crossAxisSpacing: 5, mainAxisSpacing: 5),
            itemCount: 9,
            itemBuilder: (BuildContext ctx, index) {
              return Container(
                alignment: Alignment.center,
                child: Text("Case ${index}"),
                decoration: BoxDecoration(
                    color: Colors.amber[100 * int.parse('${index}')]),
              );
            }));
  }
}

class Exercice5b extends StatefulWidget {
  @override
  _Exercice5bState createState() => _Exercice5bState();
}

class _Exercice5bState extends State<Exercice5b> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Exercice 5b'),
        ),
        body: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, crossAxisSpacing: 4, mainAxisSpacing: 4),
            itemCount: 9,
            itemBuilder: (BuildContext ctx, index) {
              return Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    SizedBox(
                        width: (370 - 8) / 3,
                        height: (370 - 8) / 3,
                        child: Container(
                            margin: EdgeInsets.all(0.0),
                            child: this.createTileWidgetFrom2(tile, index, 3))),
                  ],
                ),
              );
            }));
  }

  Widget createTileWidgetFrom2(Tile tile, int index, int taille) {
    return InkWell(
      child: tile.croppedImageTile2(index, taille),
      onTap: () {
        print("tapped on tile");
      },
    );
  }
}
