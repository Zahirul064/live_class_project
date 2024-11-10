// Named Navigation, Stateful Widget

import 'package:flutter/material.dart';

void main(){
  runApp(SimpleApp());
}

class SimpleApp extends StatelessWidget {
  const SimpleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      routes: {
        '/home': (context) => Home(),
        '/profile': (context) => Profile(),
        '/setting': (context) => Setting(),
      },
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
      ),
      body: Center(
        child: SizedBox(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => Profile(),
                  //   ),
                  // );
                  Navigator.pushNamed(context, '/profile');
                },
                child: Text('Go to Profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
            // Navigator.pushReplacement(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => Setting(),
            //   ),
            // );
            Navigator.pushReplacementNamed(context, '/setting');
          }, child: Text('Go to Setting'))
        ],
      ),
    );
  }
}


class Setting extends StatelessWidget {
   Setting ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
            //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>Home()), (predicate) => false);
          Navigator.pushNamedAndRemoveUntil(context, '/home', (predicate) => false);
          }, child: Text('Home'))
        ],
      ),
    );
  }
}