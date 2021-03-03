import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:tp2/Exercice4.dart';
import 'package:tp2/Exercice6.dart';
import 'package:collection/collection.dart';

class GameTaquin extends StatefulWidget {
  @override
  _GameTaquinState createState() => _GameTaquinState();
}

class _GameTaquinState extends State<GameTaquin> {
  double size = 3;
  bool caseB;
  bool joue;
  int indexCaseB;
  int deplacements;
  int diff;
  List<NewTile> tiles;
  List<NewTile> tilesFin;
  List<Widget> tilesWidget;
  TextButton playPause;
  Function eq = const ListEquality().equals;
  @override
  void initState() {
    super.initState();
    tiles = initTiles();
    tilesFin = [];
    tilesWidget = [];
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
      tiles.add(createTileWidget(inittiles[i], i, size.toInt()));
    }
    return tiles;
  }

  List<NewTile> whiteCase(List<NewTile> tiles) {
    math.Random random = new math.Random();
    int indexB = random.nextInt(size.toInt() * size.toInt());
    tiles[indexB] = NewTile(
        imageURL:
            "https://www.artoffice-immobilier.com/wp-content/uploads/2019/12/blanc-512x512-1.jpg",
        index: indexB);
    indexCaseB = indexB;
    return tiles;
  }

  List<NewTile> melangeTiles(List<NewTile> tiles) {
    for (var i = 0; i < 3; i++) {
      List<int> liste = [
        indexCaseB - 1,
        indexCaseB + 1,
        indexCaseB - size.toInt(),
        indexCaseB + size.toInt()
      ];
      math.Random random = new math.Random();
      int r = random.nextInt(4);
      swapTile(liste[r]);
    }
    return tiles;
  }

  bool echangeTuiles(List<NewTile> liste, int a, int b) {
    NewTile tuile;
    if (a % size.toInt() == size.toInt() - 1 &&
        a != size.toInt() - 1 &&
        a != size.toInt() * size.toInt() - 1) {
      if (b == a - 1 || b == a - size.toInt() || b == a + size.toInt()) {
        tuile = liste[a];
        liste[a] = liste[b];
        liste[b] = tuile;
        return true;
      }
    } else if (a % size.toInt() == 0 &&
        a != 0 &&
        a != size.toInt() * size.toInt() - size.toInt()) {
      if (b == a + 1 || b == a - size.toInt() || b == a + size.toInt()) {
        tuile = liste[a];
        liste[a] = liste[b];
        liste[b] = tuile;
        return true;
      }
    } else if (a == 0) {
      if (b == 1 || b == size.toInt()) {
        tuile = liste[a];
        liste[a] = liste[b];
        liste[b] = tuile;
        return true;
      }
    } else if (a == size.toInt() - 1) {
      if (b == a - 1 || b == a + size.toInt()) {
        tuile = liste[a];
        liste[a] = liste[b];
        liste[b] = tuile;
        return true;
      }
    } else if (a == size.toInt() * size.toInt() - 1) {
      if (b == a - 1 || b == a - size.toInt()) {
        tuile = liste[a];
        liste[a] = liste[b];
        liste[b] = tuile;
        return true;
      }
    } else if (a == size.toInt() * size.toInt() - size.toInt()) {
      if (b == a + 1 || b == a - size.toInt()) {
        tuile = liste[a];
        liste[a] = liste[b];
        liste[b] = tuile;
        return true;
      }
    } else {
      if (b == a - 1 ||
          b == a + 1 ||
          b == a - size.toInt() ||
          b == a + size.toInt()) {
        tuile = liste[a];
        liste[a] = liste[b];
        liste[b] = tuile;
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    tilesWidget = getTileWidgets(tiles);
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
                  children: tilesWidget,
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
                joue = false;
                tiles = initTiles();
              });
            },
          ),
          TextButton(
            child: Text("Start"),
            onPressed: () {
              setState(() {
                JeuRegle();
              });
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
  ) {
    Widget tuile;
    tuile = plateau.newCroppedImageTile(taille);
    if (joue) {
      return InkWell(
        child: tuile,
        onTap: () {
          if (index > 0 && index < size.toInt() * size.toInt()) {
            swapTile(index);
            deplacements += 1;
          }
        },
      );
    } else {
      return tuile;
    }
  }

  swapTile(int index) {
    setState(() {
      bool test = false;
      if (deplacements >= 20 && eq(tiles, tilesFin)) {
        joue = false;
        print('égalité');
        showDialog(
            context: context,
            builder: (_) => AlertDialog(title: Text('Victoire'), actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Fermer'))
                ]));
      }
      if (index > 0 && index < size.toInt() * size.toInt()) {
        test = echangeTuiles(tiles, index, indexCaseB);
      }
      //tiles.insert(index, tiles.removeAt(indexCaseB));
      if (test) {
        indexCaseB = index;
      }
    });
  }

  void JeuRegle() {
    if (joue == false) {
      joue = true;
      tiles = whiteCase(tiles);
      tilesFin = tiles;
      tiles = melangeTiles(tiles);
    }
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
