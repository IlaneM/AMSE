import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:tp2/Exercice4.dart';

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
                        width: (375 - 8) / 3,
                        height: (375 - 8) / 3,
                        child: Container(
                            margin: EdgeInsets.all(0.0),
                            child:
                                this.createTileWidgetFrom2(tile2, index, 3))),
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

class Exercice5c extends StatefulWidget {
  @override
  _Exercice5cState createState() => _Exercice5cState();
}

class _Exercice5cState extends State<Exercice5c> {
  double size = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercice 5c'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: SizedBox(
              height: 400,
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: size.toInt(),
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 4),
                  itemCount: math.pow(size.toInt(), 2),
                  itemBuilder: (BuildContext ctx, index) {
                    return Container(
                      alignment: Alignment.center,
                      child: Column(children: [
                        SizedBox(
                          width: (375 - (size - 1) * 4) / size,
                          height: (375 - (size - 1) * 4) / size,
                          child: Container(
                            margin: EdgeInsets.all(0.0),
                            child: this.createTileWidgetFrom2(
                                tile2, index, size.toInt()),
                          ),
                        ),
                      ]),
                    );
                  }),
            ),
          ),
          Slider(
            min: 3.0,
            max: 9.0,
            activeColor: Colors.blue,
            inactiveColor: Colors.grey,
            divisions: 6,
            value: size,
            label: size.round().toString(),
            onChanged: (double newsize) {
              setState(() {
                size = newsize;
              });
            },
          ),
        ],
      ),
    );
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
