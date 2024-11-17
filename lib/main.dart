//  MediaQuery | Wrap | LayoutBuilder | OrientationBuilder

import 'dart:js_interop';

import 'package:flutter/material.dart';

void main() {
  runApp(const SimpleApp());
}

class SimpleApp extends StatelessWidget {
  const SimpleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    //Size screenSize = MediaQuery.of(context).size;
    Size screenSize = MediaQuery.sizeOf(context);
    print(screenSize.width);
    print(screenSize.height);
    print(screenSize.flipped);
    print(screenSize.aspectRatio);
    print(screenSize.longestSide);
    print(screenSize.shortestSide);

    print(MediaQuery.of(context).devicePixelRatio);
    print(MediaQuery.of(context).orientation);

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Media Query')),
      ),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Wrap(
      //         alignment: WrapAlignment.center,
      //         crossAxisAlignment: WrapCrossAlignment.start,
      //         spacing: 10,
      //         runSpacing: 16,
      //         children: [
      //           TextButton(
      //             onPressed: () {},
      //             child: Text('Go to Profile'),
      //           ),
      //           TextButton(
      //             onPressed: () {},
      //             child: Text('Go to Profile'),
      //           ),
      //           TextButton(
      //             onPressed: () {},
      //             child: Text('Go to Profile'),
      //           ),
      //           TextButton(
      //             onPressed: () {},
      //             child: Text('Go to Profile'),
      //           ),
      //           TextButton(
      //             onPressed: () {},
      //             child: Text('Go to Profile'),
      //           ),
      //           TextButton(
      //             onPressed: () {},
      //             child: Text('Go to Profile'),
      //           ),
      //           TextButton(
      //             onPressed: () {},
      //             child: Text('Go to Profile'),
      //           ),
      //           TextButton(
      //             onPressed: () {},
      //             child: Text('Go to Profile'),
      //           ),
      //           TextButton(
      //             onPressed: () {},
      //             child: Text('Go to Profile'),
      //           ),
      //           TextButton(
      //             onPressed: () {},
      //             child: Text('Go to Profile'),
      //           ),
      //           TextButton(
      //             onPressed: () {},
      //             child: Text('Go to Profile'),
      //           ),
      //           TextButton(
      //             onPressed: () {},
      //             child: Text('Go to Profile'),
      //           ),
      //           TextButton(
      //             onPressed: () {},
      //             child: Text('Go to Profile'),
      //           ),
      //           TextButton(
      //             onPressed: () {},
      //             child: Text('Go to Profile'),
      //           ),
      //           TextButton(
      //             onPressed: () {},
      //             child: Text('Go to Profile'),
      //           ),
      //           TextButton(
      //             onPressed: () {},
      //             child: Text('Go to Profile'),
      //           ),
      //           TextButton(
      //             onPressed: () {},
      //             child: Text('Go to Profile'),
      //           ),
      //           TextButton(
      //             onPressed: () {},
      //             child: Text('Go to Profile'),
      //           ),
      //           TextButton(
      //             onPressed: () {},
      //             child: Text('Go to Profile'),
      //           ),
      //           TextButton(
      //             onPressed: () {},
      //             child: Text('Go to Profile'),
      //           ),
      //           TextButton(
      //             onPressed: () {},
      //             child: Text('Go to Profile'),
      //           ),
      //         ],
      //       ),
      //     ],
      //   ),
      // ),
      // body: Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
      //   child: LayoutBuilder(
      //     builder: (BuildContext context, BoxConstraints constraints) {
      //       return Center(
      //         child: Text('${constraints.maxWidth}, ${constraints.maxHeight}'),
      //       );
      //     }
      //   ),
      // ),

      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return Center(
              child: Text('portrait'),
            );
          } else {
            return Center(child: Text('Landscrep'));
          }
        },
      ),
    );
  }
}
