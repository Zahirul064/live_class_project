import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfileScreen(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.yellow[700],
          foregroundColor: Colors.yellow,
          titleTextStyle: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black87),
          actionsIconTheme: IconThemeData(color: Colors.black87),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProfileItem extends StatelessWidget {
  final IconData icon;
  final String text;

  ProfileItem({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 60,
          backgroundColor: Colors.purple[100],
          child: Icon(
            icon,
            size: 60,
            color: Colors.purple[900],
          ),
        ),
        SizedBox(height: 10),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.phone),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 16),
              ProfileItem(
                icon: Icons.icecream,
                text: 'Ice cream is very delicious right?',
              ),
              SizedBox(height: 20),
              ProfileItem(
                icon: Icons.code,
                text: 'Programming is not boring if you love it',
              ),
              SizedBox(height: 20),
              ProfileItem(
                icon: Icons.egg,
                text:
                    'If you submit code directly copy from chatgpt then mark will 0',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
