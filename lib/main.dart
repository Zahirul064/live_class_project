import 'package:flutter/material.dart';



// Gridview, ListTile, Form, GolablKey, Key hh

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

  List<String> friendList = [
    'Zahirul Islam',
    'Tanvir Talha',
    'Zarifa Fariha (Sara)',
    'Zarifa Fariha (Sara)',
    'Zarifa Fariha (Sara)',
    'Zarifa Fariha (Sara)',
    'Zarifa Fariha (Sara)',
    'Zarifa Fariha (Sara)',
    'Zarifa',
    'Zarifa',
    'Zarifa',
    'Zarifa',
    'Zarifa',
    'Zarifa',
    'Zarifa',
    'Zarifa',
    'Zarifa',
    'Zarifa',
    'Zarifa'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListTile Example'),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
          itemCount: friendList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(friendList[index]),
              subtitle: Text('frind no $index'),
              trailing: Icon(Icons.arrow_forward_ios),
              leading: CircleAvatar(child: Icon(Icons.account_circle_rounded,size: 30,)),
              onTap: () {print('on Tab $index');},
              onLongPress: () {print('on Long Press $index');},
              tileColor: Colors.blue[100],
              titleTextStyle: TextStyle(color: Colors.pink),
              contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 3),
              //contentPadding: EdgeInsets.all(20),
              //enabled: false,
              //dense: false,
            );

            /*Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                friendList[index],style: TextStyle(
                fontSize: 16
              ),
              ),
            );*/
          }),
    );
  }
}
