import 'package:flutter/material.dart';

// Drawer, NavigationBar, Bottom Navigation bar, SingleChildScrollView, ListView

void main() {
  runApp(HelloWorldApp());
}

class HelloWorldApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hello World App',
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  Home({super.key});

  List<String> friendList = ['Zahirul Islam', 'Tanvir Talha', 'Zarifa Fariha (Sara)', 'Zarifa', 'Zarifa', 'Zarifa', 'Zarifa', 'Zarifa', 'Zarifa', 'Zarifa', 'Zarifa', 'Zarifa', 'Zarifa', 'Zarifa'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.green,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.add)),
          IconButton(onPressed: () {}, icon: Icon(Icons.delete))
        ],
        // leading: Icon(Icons.add),
      ),
      drawer: Drawer(
        elevation: 0,
        shadowColor: Colors.red,
        backgroundColor: Colors.amber.shade50,
        shape: OutlineInputBorder(),
        width: 300,
        child: Column(
          children: [Text("data")],
        ),
      ),
      /* bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.green,
        unselectedFontSize: 12,
        showUnselectedLabels: false,
        onTap: (int selectedIndex) {
          // TODO; Have to change state, will see after stateful widget
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        ],
      ),*/
      bottomNavigationBar: NavigationBar(
        selectedIndex: 1,
        onDestinationSelected: (int selectedIndex) {
          // TODO; Have to change state, will see after stateful widget
        },
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.search), label: 'Search'),
        ],
      ),
      /* body: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('adfafsafadfw'),
              Text('adfafasfa'),
              Text('adfaf'),
              Text('adfaf'),
              Text('adfaf'),
              Text('adfaf'),
              Text('adfaf'),
              Text('adfaf'),
              Text('adfaf'),
              Text('adfaf'),
              Text('adfaf'),
              Text('adfaf'),
              Text('adfaf'),
              Text('adfaf'),
              Text('adfaf'),
              Text('adfaf'),
              Text('adfaf'),
              Text('adfaf'),
              Text('adfaf'),
              Text('adfaf'),
              Text('adfaf'),
              Text('adfaf'),
              Text('adfaf'),
              Text('adfaf'),
              Text('adfaf'),
              Text('adfaf'),
              Text('adfaf'),
              Text('adfaf'),
              Text('adfaf'),
              Text('adfaf'),
              Text('adfaf'),
              Text('adfaf'),
              Text('adfaf'),
              Text('adfaf'),
              Text('adfaf'),
              Text('adfaf'),
              Text('adfaf'),
              Text('adfaf'),
              Text('adfaf'),
              Text('adfaf'),
              Text('adfaf'),
              Text('adfaf'),
              Text('adfaf'),
              Text('adfaf'),
              Text('adfaf'),
              Text('adfaf'),
              Text('adfaf'),
              Text('adfaf'),
              Text('adfaf'),
              Text('adfaf'),
              Text('adfaf'),
              Text('adfaf'),
              Text('adfaf'),
              Text('adfaf'),
              Text('adfaf'),
              Text('adfaf'),
              Text('adfaf'),
              Text('adfaf'),
              Text('adfaf'),
              Text('adfaf'),
              Text('adfaf'),
              Text('adfaf'),
              Text('adfaf'),
              Text('adfaf'),
              Text('adfaf'),
              Text('adfaf'),
              Text('adfaf'),
              Text('adfaf'),
              Text('adfaf'),
              Text('adfaf'),
              Text('adfaf'),
            ],
          ),
        ),
      ),*/
      body: Scrollbar(
        thickness: 10,
        interactive: true,
        radius: Radius.circular(10),
        /*child: ListView(
          scrollDirection: Axis.vertical,
          reverse: false,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          children: [
            Text('adfafsafadfw'),
            Text('adfafasfa'),
            Text('adfaf'),
            Text('adfaf'),
            Text('adfaf'),
            Text('adfaf'),
            Text('adfaf'),
            Text('adfaf'),
            Text('adfaf'),
            Text('adfaf'),
            Text('adfaf'),
            Text('adfaf'),
            Text('adfaf'),
            Text('adfaf'),
            Text('adfaf'),
            Text('adfaf'),
            Text('adfaf'),
            Text('adfaf'),
            Text('adfaf'),
            Text('adfaf'),
            Text('adfaf'),
            Text('adfaf'),
            Text('adfaf'),
            Text('adfaf'),
            Text('adfaf'),
            Text('adfaf'),
            Text('adfaf'),
            Text('adfaf'),
            Text('adfaf'),
            Text('adfaf'),
            Text('adfaf'),
            Text('adfaf'),
            Text('adfaf'),
            Text('adfaf'),
            Text('adfaf'),
            Text('adfaf'),
            Text('adfaf'),
            Text('adfaf'),
            Text('adfaf'),
            Text('adfaf'),
            Text('adfaf'),
            Text('adfaf'),
            Text('adfaf'),
            Text('adfaf'),
            Text('adfaf'),
            Text('adfaf'),
            Text('adfaf'),
            Text('adfaf'),
            Text('adfaf'),
            Text('adfaf'),
            Text('adfaf'),
            Text('adfaf'),
            Text('adfaf'),
            Text('adfaf'),
            Text('adfaf'),
            Text('adfaf'),
            Text('adfaf'),
            Text('adfaf'),
            Text('adfaf'),
            Text('adfaf'),
            Text('adfaf'),
            Text('adfaf'),
            Text('adfaf'),
            Text('adfaf'),
            Text('adfaf'),
            Text('adfaf'),
            Text('adfaf'),
            Text('adfaf'),
            Text('adfaf'),
            Text('adfaf'),
            Text('adfaf'),
          ],
        ),*/
        /*child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            itemCount: 100, //100-1 =99 =>0->99
            itemBuilder: (context, index) {
              return Text('Item $index');
            }),*/

        child: ListView.builder(
            itemCount: friendList.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.all(10.0),
                child: Text('$index. '+friendList[index]),
              );
            }),
      ),
    );
  }
}
