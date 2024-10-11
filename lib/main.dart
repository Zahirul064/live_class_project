import 'package:flutter/material.dart';

// Reformat - "Ctrl+Shift+L"
//
// Image (asset, network), Column, Row

void main() {
  runApp(HelloWorldApp());
}

class HelloWorldApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Hello World App',
      home: Home() ,
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
        backgroundColor: Colors.green ,
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green,
              foregroundColor: Colors.white,
                textStyle: TextStyle(
                  fontSize: 14,
                ),
              ),
                onPressed: () {}, child: Text('Tab'))
          ],
        ),
      ),
    );
  }
}
