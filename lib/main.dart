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
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Home',
            style: TextStyle(
              overflow: TextOverflow.ellipsis,
              color: Colors.black,

            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.green.shade100,
        ),



      ),
    );
  }
}
