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
    Text(
      'Film',
      style: optionStyle,
    ),
    Text(
      'Manga',
      style: optionStyle,
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
            label: 'Manga',
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
            // Function callback for stretch
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
                  //fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            ListTile(
              title: Text('Description '),
              subtitle: Text('${type[index].description}'),
            ),
            ListTile(
              title: Text('Saisons '),
              subtitle: Text('${type[index].saison}'),
            ),
            ListTile(
              title: Text('Episodes par saison '),
              subtitle: Text('${type[index].episode}'),
            ),
            // ListTiles++
          ]),
        ),
      ],
    ),
  );

  /*Center(
        child: Text(
            'Description : \n${type[index1].description} \nSaisons : ${type[index1].saison} \nEpisodes : ${type[index1].episode}'),
      ));*/
}
