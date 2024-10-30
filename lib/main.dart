import 'package:flutter/material.dart';

// Gridview, ListTile, Form, GolablKey, Key

// ListView.separated, Continuant

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
    'Sazzad',
    'Habib',
    'Ataur',
    'Mizanur',
    'Masum',
    'Salim',
    'Shamim',
    'Shahen',
    'Shehan',
    'Rumman',
    'Hamim',
    'Rana',
    'Tarique',
  ];
  /*TextEditingController _emailTEController = TextEditingController();
  TextEditingController _passwordTEController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey();*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListTile Example'),
        backgroundColor: Colors.green,
      ),
      body: ListView.separated(

          itemCount: friendList.length,
          itemBuilder: (BuildContext context, int index) {

            return Column(
              children: [

                Text(friendList[index],
                ),

                // Divider(
                //   height: 20,
                //   thickness: 2,
                //   color: Colors.grey,
                //   indent: 16,
                //   endIndent: 10,
                // ),
              ],

            );
          },

        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.red,
            indent: 16,
            endIndent: 10,
            height: 5,
          );
        },
      ),

/*
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _emailTEController,
                decoration: InputDecoration(hintText: 'Email'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter your Email';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordTEController,
                decoration: InputDecoration(hintText: 'Password'),
                validator: (String? value){
                  if(value?.isEmpty?? true){
                    return 'Enter your Password';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                  onPressed: () {
                    // String email = _emailTEController.text;
                    // String pass = _passwordTEController.text;
                    //
                    // if (email.isNotEmpty && pass.isNotEmpty) {
                    //   print("Login Success");
                    // } else {
                    //   print("Login failed. Missing data");
                    // }
                    if(_formKey.currentState!.validate()){
                      print("Login Success");
                    }
                  },
                  child: Text('Tap'))
            ],
          ),
        ),
      ),*/
      /*body: GridView.builder(
        itemCount: friendList.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (context, index) {
          return Center(
              child: Text(
                  friendList[index], style: TextStyle(color: Colors.pink,)),

          );
          }
          ),*/

      /*body: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 10),
          children: [
            Text('data'),
            Text('data'),
            Text('data'),
            Text('data'),
          ],
        )*/
        /*body: ListView.builder(
          itemCount: friendList.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(friendList[index]),
              //subtitle: Text('frind no $index'),
              subtitle: Text('Friend no ${index+1}'),
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

            */ /*Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                friendList[index],style: TextStyle(
                fontSize: 16
              ),
              ),
            );*/ /*
          }),*/
        );
  }
}
