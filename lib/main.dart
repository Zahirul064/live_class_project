// Aspect Ration | Expanded |Flexible| ReactionllySizeBox
//

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

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Home'),
      // ),

      // body: FractionallySizedBox(
      //   heightFactor: .5,
      //   widthFactor: 1,
      //   alignment: FractionalOffset.center,
      //   child: DecoratedBox(
      //     decoration: BoxDecoration(
      //       border: Border.all(color: Colors.blue, width: 10),
      //     ),
      //   ),
      // ),

      // body: AspectRatio(
      //   aspectRatio: 16/9,
      //   child: ColoredBox(color: Colors.black87,),
      // )

/*      body: Column(
        children: [
          Flexible(
            flex: 3,
            fit: FlexFit.tight,
            child: SizedBox(
              width: double.maxFinite,
              child: ColoredBox(
                color: Colors.red,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: SizedBox(
              width: double.maxFinite,
              child: ColoredBox(
                color: Colors.orange,
              ),
            ),
          ),
          Flexible(
            fit: FlexFit.loose,
            flex: 1,
            child: SizedBox(
              width: double.maxFinite,
              height: 40,
              child: ColoredBox(
                color: Colors.black,
              ),
            ),
          ),

        ],
      ),*/

      body: SafeArea(
        top: true,
        bottom: false,
        child: Tooltip(
          message: 'This is Row',
          showDuration:Duration(seconds: 2),
          triggerMode: TooltipTriggerMode.tap,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  color: Colors.orange,
                  height: 100,
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  color: Colors.black,
                  height: 100,
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.pink,
                  height: 100,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
