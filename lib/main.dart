import 'package:flutter/material.dart';

// Image(asset, network), Column, Row

// Divider, ModelBottomSheet, TextField

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
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 100),
            ElevatedButton(
              onPressed: () {
                //showAboutDialog(context: context);
                showModalBottomSheet(
                  //barrierColor: Colors.tealAccent,
                  backgroundColor: Colors.amberAccent[50],
                    isScrollControlled: true,
                    useSafeArea: true,
                    enableDrag: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    context: context,
                    builder: (ctx) {
                      return Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Title', style: TextStyle(
                                  fontSize: 20,
                                ),),
                              ],
                            ),
                          ),
                          Divider(
                            height:20,
                            thickness: 4,
                          ),
                          Text('sample'),
                          Row(
                            children: [
                              ElevatedButton(onPressed: (){}, child: Text('Save')),
                              ElevatedButton(onPressed: (){}, child: Text('Cancel'))
                            ],
                          )
                        ],
                      );
                    });
              },
              child: Text('Show dialog'),
            ),
          ],
        ),
      ),
    );
  }
}
