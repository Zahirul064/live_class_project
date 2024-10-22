import 'package:flutter/material.dart';

// Drawer, NavigationBar, Bottom Navigation bar

void main() {
  runApp(HelloWorldApp());
}

class HelloWorldApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Hello World App',
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.green,
      ),
      drawer: Drawer(
        elevation: 0,
        shadowColor: Colors.red,

        backgroundColor: Colors.amber.shade50,
        shape: OutlineInputBorder(

        ),
        width: 300,
        child: Column(
          children: [
            Text("data")
          ],
        ),
      )
    );
  }
}
