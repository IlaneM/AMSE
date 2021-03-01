import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:tp2/Exercice4.dart';

math.Random random = new math.Random();

class Tile2 {
  Color color;

  Tile2(this.color);
  Tile2.randomColor() {
    this.color = Color.fromARGB(
        255, random.nextInt(255), random.nextInt(255), random.nextInt(255));
  }
}

// ==============
// Widgets
// ==============

class TileWidget extends StatelessWidget {
  final Tile2 tile;

  TileWidget(this.tile);

  @override
  Widget build(BuildContext context) {
    return this.coloredBox();
  }

  Widget coloredBox() {
    return Container(
        color: tile.color,
        child: Padding(
          padding: EdgeInsets.all(70.0),
        ));
  }
}

void main() => runApp(new MaterialApp(home: PositionedTiles()));

class PositionedTiles extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PositionedTilesState();
}

class PositionedTilesState extends State<PositionedTiles> {
  List<Widget> tiles =
      List<Widget>.generate(2, (index) => TileWidget(Tile2.randomColor()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Moving Tiles'),
        centerTitle: true,
      ),
      body: Row(children: tiles),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.sentiment_very_satisfied), onPressed: swapTiles),
    );
  }

  swapTiles() {
    setState(() {
      tiles.insert(1, tiles.removeAt(0));
    });
  }
}

class Exercice6b extends StatefulWidget {
  @override
  _Exercice6bState createState() => _Exercice6bState();
}

class _Exercice6bState extends State<Exercice6b> {
  double size = 3;

  List<Widget> listetile() {
    List<Widget> tiles = [];
    List<Widget> tilesTap = [];
    for (var i = 0; i < math.pow(size.toInt(), 2); i++) {
      tiles.add(createTileWidgetFrom2(tile, i, size.toInt(), tiles));
    }
    for (var i = 0; i < math.pow(size.toInt(), 2); i++) {
      tilesTap.add(
        InkWell(
            child: tiles[i],
            onTap: () {
              swapTiles(tilesTap);
            }),
      );
    }
    return tilesTap;
  }

  @override
  Widget build(BuildContext context) {
    var tuiles = listetile();
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercice 6b'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: SizedBox(
                height: 400,
                child: GridView.count(
                  primary: false,
                  padding: const EdgeInsets.all(0),
                  crossAxisCount: size.toInt(),
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                  children: tuiles,
                )),
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

  Widget createTileWidgetFrom2(
    Tile tile,
    int index,
    int taille,
    List<Widget> tiles,
  ) {
    Widget tuile;
    tuile = tile.croppedImageTile2(index, taille);
    return InkWell(
      child: tuile,
      onTap: () {},
    );
  }

  swapTiles(
    List<Widget> tiles,
  ) {
    setState(() {
      tiles.insert(1, tiles.removeAt(0));
    });
  }
}

/*GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: size.toInt(),
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 4),
                  itemCount: math.pow(size.toInt(), 2),
                  itemBuilder: (BuildContext ctx, index) {
                    return GestureDetector(
                      child: Container(
                        alignment: Alignment.center,
                        child: Column(children: [
                          SizedBox(
                            width: (375 - (size - 1) * 4) / size,
                            height: (375 - (size - 1) * 4) / size,
                            child: Container(
                              margin: EdgeInsets.all(0.0),
                              child: tuiles[index],
                            ),
                          ),
                        ]),
                      ),
                      onTap: () {
                        swapTiles(tuiles, 0);
                      },
                    );
                  }),*/
