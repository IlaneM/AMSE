import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:tp2/Exercice4.dart';
import 'package:tp2/Exercice6.dart';

class GameTaquin extends StatefulWidget {
  @override
  _GameTaquinState createState() => _GameTaquinState();
}

class _GameTaquinState extends State<GameTaquin> {
  double size = 3;
  bool caseB;
  bool joue;
  int deplacements;
  List<NewTile> tiles;
  List<NewTile> tilesFin;
  @override
  void initState() {
    super.initState();
    tiles = initTiles();
    joue = false;
    deplacements = 0;
    caseB = false;
  }

  List<NewTile> initTiles() {
    //génération des tuiles
    return (List.generate(
        size.toInt() * size.toInt(),
        (index) =>
            new NewTile(imageURL: 'https://picsum.photos/512', index: index)));
  }

  List<Widget> getTileWidgets(List<NewTile> inittiles) {
    List<Widget> tiles = [];
    for (var i = 0; i < math.pow(size.toInt(), 2); i++) {
      tiles.add(createTileWidget(inittiles[i], i, size.toInt(), 0));
    }
    if (!caseB && joue) {
      math.Random random = new math.Random();
      int indexB = random.nextInt(size.toInt() * size.toInt());
      tiles[indexB] = Container(color: Colors.white);
    }
    return tiles;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercice 7'),
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
                  children: getTileWidgets(tiles),
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
                tiles = initTiles();
              });
            },
          ),
          TextButton(
            child: Text("Start"),
            onPressed: () {
              joue = !joue;
            },
          ),
        ],
      ),
    );
  }

  Widget createTileWidget(
    //Tile to Widget
    NewTile plateau,
    int index,
    int taille,
    int indexB,
  ) {
    Widget tuile;
    tuile = plateau.newCroppedImageTile(taille);
    if (joue) {
      return InkWell(
        child: tuile,
        onTap: () {
          swapTile(index, indexB);
        },
      );
    } else {
      return tuile;
    }
  }

  swapTile(int index, int indexB) {
    setState(() {
      tiles.insert(index, tiles.removeAt(index + 1));
    });
  }
}

class NewTile {
  String imageURL;
  int index;

  NewTile({this.imageURL, this.index});

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

  Widget newCroppedImageTile(int taille) {
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
