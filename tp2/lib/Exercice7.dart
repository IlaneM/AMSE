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
  double size = 3; //nombre de lignes (ou colonnes) dans le plateau)
  bool caseB; //true s'il y a une case blanche sur le plateau, false sinon
  bool joue; //true si la partie est lancée, false sinon
  bool estMelange; //true si le plateau est mélangé, false sinon
  int indexCaseB; //Index de la case blanche
  int deplacements; //Nombre de déplacements
  int diff; //Difficulté (entre 1 et 4)
  int indexCaseBIni;
  bool affi = true;
  bool
      _playHasBeenPressed; //true si le bouton pause est appuyé (partie en pause), false sinon
  bool
      _diff1HasBeenPressed; //true si le bouton difficulté 1 est appuyé, false sinon
  bool
      _diff2HasBeenPressed; //true si le bouton difficulté 2 est appuyé, false sinon
  bool
      _diff3HasBeenPressed; //true si le bouton difficulté 3 est appuyé, false sinon
  bool
      _diff4HasBeenPressed; //true si le bouton difficulté 4 est appuyé, false sinon
  List<NewTile> tiles; //liste des tuiles
  List<NewTile> tilesFin; //liste des tuiles objectif à atteindre

  Function deepEq = const DeepCollectionEquality().equals;
  Function eq = const ListEquality().equals;
  @override
  void initState() {
    tiles = initTiles();
    tilesFin = [];
    indexCaseB = 0;
    indexCaseBIni = 0;
    size = 3.0;
    joue = false;
    deplacements = 0;
    caseB = false;
    estMelange = false;
    diff = 1;
    _playHasBeenPressed = false;
    _diff1HasBeenPressed = true;
    _diff2HasBeenPressed = false;
    _diff3HasBeenPressed = false;
    _diff4HasBeenPressed = false;
  }

  List<NewTile> initTiles() {
    //génération des tuiles
    return (List.generate(
        size.toInt() * size.toInt(),
        (index) =>
            new NewTile(imageURL: 'https://picsum.photos/512', index: index)));
  }

  List<NewTile> whiteCase(List<NewTile> tiles) {
    math.Random random = new math.Random();
    int indexB = random.nextInt(size.toInt() * size.toInt());
    tiles[indexB] = NewTile(
        imageURL:
            "https://www.artoffice-immobilier.com/wp-content/uploads/2019/12/blanc-512x512-1.jpg",
        index: indexB);
    indexCaseB = indexB;
    indexCaseBIni = indexCaseB;
    tilesFin = tiles;
    return tiles;
  }

  List<NewTile> listVictoire() {
    List<NewTile> liste = initTiles();
    liste[indexCaseBIni] = NewTile(
        imageURL:
            "https://www.artoffice-immobilier.com/wp-content/uploads/2019/12/blanc-512x512-1.jpg",
        index: indexCaseBIni);
    return liste;
  }

  List<NewTile> melangeTiles(List<NewTile> tiles) {
    for (var i = 0; i < 50 * diff * size.toInt(); i++) {
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
    deplacements = 0;
    estMelange = true;
    return tiles;
  }

  List<Widget> getTileWidgets(List<NewTile> inittiles) {
    List<Widget> tiles = [];
    for (var i = 0; i < math.pow(size.toInt(), 2); i++) {
      tiles.add(createTileWidget(inittiles[i], i, size.toInt()));
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
          SizedBox(
            height: 50,
            child: Text('Déplacements : ${deplacements}'),
          ),
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
            min: joue ? size : 3.0,
            max: joue ? size : 9.0,
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
                deplacements = 0;
                estMelange = false;
                _playHasBeenPressed = false;
              });
            },
          ),
          SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  child: _playHasBeenPressed ? Text("Pause") : Text('Start'),
                  onPressed: () {
                    setState(() {
                      if (joue == false) {
                        joue = true;
                        tiles = melangeTiles(whiteCase(tiles));
                        tilesFin = listVictoire();
                      }
                      _playHasBeenPressed = !_playHasBeenPressed;
                    });
                  },
                ),
                TextButton(
                  child: Text("Recommencer"),
                  onPressed: () {
                    setState(() {
                      showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                                  title: Text(
                                      'Etes vous sur de vouloir recommencer ?'),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          setState(() {
                                            initState();
                                            Navigator.of(context).pop();
                                          });
                                        },
                                        child: Text('oui')),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('non')),
                                  ]));
                    });
                  },
                ),
              ],
            ),
          ),
          SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Difficultée'),
                  TextButton(
                    child: _diff1HasBeenPressed
                        ? Text("1",
                            style: TextStyle(
                                backgroundColor: Colors.blue,
                                color: Colors.white))
                        : Text("1"),
                    onPressed: () {
                      setState(() {
                        diff = 1;
                        if (!_diff1HasBeenPressed) {
                          _diff1HasBeenPressed = !_diff1HasBeenPressed;
                          _diff2HasBeenPressed = false;
                          _diff3HasBeenPressed = false;
                          _diff4HasBeenPressed = false;
                        }
                      });
                    },
                  ),
                  TextButton(
                    child: _diff2HasBeenPressed
                        ? Text("2",
                            style: TextStyle(
                                backgroundColor: Colors.blue,
                                color: Colors.white))
                        : Text("2"),
                    onPressed: () {
                      setState(() {
                        diff = 2;
                        if (!_diff2HasBeenPressed) {
                          _diff2HasBeenPressed = !_diff2HasBeenPressed;
                          _diff1HasBeenPressed = false;
                          _diff3HasBeenPressed = false;
                          _diff4HasBeenPressed = false;
                        }
                      });
                    },
                  ),
                  TextButton(
                    child: _diff3HasBeenPressed
                        ? Text("3",
                            style: TextStyle(
                                backgroundColor: Colors.blue,
                                color: Colors.white))
                        : Text("3"),
                    onPressed: () {
                      setState(() {
                        diff = 3;
                        if (!_diff3HasBeenPressed) {
                          _diff3HasBeenPressed = !_diff3HasBeenPressed;
                          _diff1HasBeenPressed = false;
                          _diff2HasBeenPressed = false;
                          _diff4HasBeenPressed = false;
                        }
                      });
                    },
                  ),
                  TextButton(
                    child: _diff4HasBeenPressed
                        ? Text("4",
                            style: TextStyle(
                                backgroundColor: Colors.blue,
                                color: Colors.white))
                        : Text("4"),
                    onPressed: () {
                      setState(() {
                        diff = 4;
                        if (!_diff4HasBeenPressed) {
                          _diff4HasBeenPressed = !_diff4HasBeenPressed;
                          _diff1HasBeenPressed = false;
                          _diff2HasBeenPressed = false;
                          _diff3HasBeenPressed = false;
                        }
                      });
                    },
                  ),
                ],
              ))
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
    if (joue && _playHasBeenPressed) {
      return InkWell(
        child: tuile,
        onTap: () {
          swapTile(index);
        },
      );
    } else {
      return tuile;
    }
  }

  void swapTile(int index) {
    setState(() {
      bool test = false;
      if (index >= 0 && index < size.toInt() * size.toInt()) {
        test = echangeTuiles(tiles, index, indexCaseB);
      }
      if (test) {
        indexCaseB = index;
        deplacements += 1;
      }
      if (estMelange && deplacements > 0 && listEgal(tiles, tilesFin)) {
        print('égalité');
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                    title: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Victoire'),
                          Text(
                              'Vous avez effectués ${deplacements} déplacements'),
                        ]),
                    actions: [
                      TextButton(
                          onPressed: () {
                            setState(() {
                              initState();
                              Navigator.of(context).pop();
                            });
                          },
                          child: Text('Fermer'))
                    ]));
      }
    });
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
}

bool listEgal(List<NewTile> l1, List<NewTile> l2) {
  bool egal = false;
  if (l1.length == l2.length) {
    var i = 0;
    while (tileEgal(l1[i], l2[i]) && i < l1.length - 1) {
      i++;
    }
    if (i == l1.length - 1) {
      egal = true;
    }
  }
  return egal;
}

bool tileEgal(NewTile t1, NewTile t2) {
  if (t1.imageURL == t2.imageURL && t1.index == t2.index) {
    return true;
  }
  return false;
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
