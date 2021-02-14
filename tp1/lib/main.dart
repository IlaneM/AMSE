import 'package:flutter/material.dart';
import 'package:tp1/media.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      theme: ThemeData(primarySwatch: Colors.red),
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
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    Text(
      'Home',
      style: optionStyle,
    ),
    ListView.builder(
      itemCount: series.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Description(series, index),
                ),
              );
            },
            title: Text(series[index].title),
            leading: Image.network(series[index].imageUrl),
          ),
        );
      },
    ),
    ListView.builder(
      itemCount: films.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Description(films, index),
                ),
              );
            },
            title: Text(films[index].title),
            leading: Image.network(films[index].imageUrl),
          ),
        );
      },
    ),
    ListView.builder(
      itemCount: manga.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Description(manga, index),
                ),
              );
            },
            title: Text(manga[index].title),
            leading: Image.network(manga[index].imageUrl),
          ),
        );
      },
    ),
    Text(
      'TP1 \nMESSAOUDI Ilane',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestion de média'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'Séries',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'Films',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Mangas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Infos',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red[200],
        unselectedItemColor: Colors.black87,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
    );
  }
}

Widget Description(List<MediaModel> type, int index) {
  return Scaffold(
    appBar: AppBar(
      automaticallyImplyLeading: true,
      title: Text('${type[index].title}'),
    ),
    body: CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: <Widget>[
        SliverAppBar(
          leading: new Container(),
          stretch: true,
          onStretchTrigger: () {
            return;
          },
          expandedHeight: 200.0,
          flexibleSpace: FlexibleSpaceBar(
            background: Stack(
              fit: StackFit.expand,
              children: [
                const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment(0.0, 0.5),
                        end: Alignment(0.0, 0.0),
                        colors: <Color>[
                          Color(0xFFFFFFFF),
                          Color(0xFFFFFFFF),
                        ]),
                  ),
                ),
                Image.network(
                  type[index].imageUrl,
                ),
              ],
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(children(type, index)),
        ),
      ],
    ),
  );
}

List<Widget> children(List<MediaModel> type, int index) {
  List<ListTile> retour = [];
  retour.addAll([
    ListTile(
      title: Text(
        'Description ',
        style: TextStyle(fontSize: 20, color: Colors.black),
      ),
      subtitle: Text('${type[index].description}'),
    ),
    ListTile(
      title: Text(
        'Date de sortie  ',
        style: TextStyle(fontSize: 20, color: Colors.black),
      ),
      subtitle: Text('${type[index].sortie}'),
    ),
  ]);
  if (type == series) {
    retour.addAll([
      ListTile(
        title: Text(
          'Saisons ',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        subtitle: Text('${type[index].saison}'),
      ),
      ListTile(
        title: Text(
          'Episodes ',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        subtitle: Text('${type[index].episode}'),
      ),
      ListTile(
          title: Text(
            'Producteur  ',
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          subtitle: Text('${type[index].producteur}')),
      ListTile(
          title: Text(
            'Acteurs Principaux  ',
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          subtitle: Text('${type[index].acteur}')),
    ]);
  } else if (type == films) {
    retour.addAll([
      ListTile(
        title: Text(
          'Durée ',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        subtitle: Text('${type[index].duree}'),
      ),
      ListTile(
          title: Text(
            'Producteur  ',
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          subtitle: Text('${type[index].producteur}')),
      ListTile(
          title: Text(
            'Acteurs Principaux  ',
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          subtitle: Text('${type[index].acteur}')),
    ]);
  } else {
    retour.addAll([
      ListTile(
        title: Text(
          'Saisons ',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        subtitle: Text('${type[index].saison}'),
      ),
      ListTile(
        title: Text(
          'Episodes ',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        subtitle: Text('${type[index].episode}'),
      ),
      ListTile(
          title: Text(
            'Créateur  ',
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          subtitle: Text('${type[index].producteur}')),
    ]);
  }
  return (retour);
}
