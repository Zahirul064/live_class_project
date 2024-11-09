import 'package:flutter/cupertino.dart';


// Theme
// Code Smelll
// Code Duplication

void main() {
  runApp(CupertinoExpApp());
}

class CupertinoExpApp extends StatelessWidget {
  const CupertinoExpApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Experiment Project',
      home: Home(),
    );
  }
}
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Home'),
        trailing: Icon(CupertinoIcons.alarm),
        leading: Icon(CupertinoIcons.delete),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          CupertinoButton.filled(child: Text('Tap Here'), onPressed: (){}),
          CupertinoButton(child: Text('Tap Here'), onPressed: (){}),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CupertinoListTile(
              title: Text('Title'),
              onTap: (){},
              backgroundColor: CupertinoColors.inactiveGray,
              subtitle: Text('Subtitle'),
              trailing: Icon(CupertinoIcons.airplane),

            ),
          ),
          CupertinoSwitch(value: true, onChanged: (value){}

          ),
        ],

      ),
    );
  }
}
