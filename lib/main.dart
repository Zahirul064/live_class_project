import 'package:flutter/material.dart';

// Theme
// Code Smelll
// Code Duplication

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
      theme: ThemeData(
        useMaterial3: true,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green[900],
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.green[800],
          foregroundColor: Colors.white,
          titleTextStyle: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.pink),
          ),
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[800],
          foregroundColor: Colors.black,
          titleTextStyle: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white38),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
      themeMode: ThemeMode.light,
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
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(),
                  SizedBox(height: 16),
                  TextField(),
                  SizedBox(height: 16),
                  TextField(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Profile(
                          userName: 'Zahirul',
                        );
                      },
                    ),
                  );
                },
                child: Text('Go to Frofile'),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Setting();
                    },
                  ),
                );
              },
              child: Text('Go to Setting'),
            ),
          ],
        ),
      ),
    );
  }
}

class Profile extends StatelessWidget {
  const Profile({super.key, required this.userName});

  final String userName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.red[200],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(userName),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Back')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Setting(),
                    ),
                  );
                },
                child: Text('Go to Setting')),
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                    (predicate) => false);
              },
              child: Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Profile(
                        userName: 'Tanvir',
                      ),
                    ),
                  );
                },
                child: Text('Go to Profile')),
          ],
        ),
      ),
    );
  }
}

/*class Home extends StatelessWidget {
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
  */ /*TextEditingController _emailTEController = TextEditingController();
  TextEditingController _passwordTEController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey();*/ /*

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListTile Example'),
        backgroundColor: Colors.green,
      ),
      // Container
      */ /*body: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            alignment: Alignment.center,
            decoration: BoxDecoration(color: Colors.red, boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.pink.withOpacity(0.4),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 2),
              )
            ]),
            margin: EdgeInsets.only(left: 24),
            child: Text('Zahirul'),
          ),
          Container(
            width: 100,
            height: 100,
            alignment: Alignment.center,
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.amber,
              border: Border.all(color: Colors.black, width: 2),
              shape: BoxShape.circle,
              //borderRadius: BorderRadius.circular(26)
            ),
            child: Text('Random'),
          ),
        ],
      ),
*/ /*
      */ /*body: ListView.separated(

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

          );
        },
      ),*/ /*

*/ /*
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
      ),*/ /*
      */ /*body: GridView.builder(
        itemCount: friendList.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (context, index) {
          return Center(
              child: Text(
                  friendList[index], style: TextStyle(color: Colors.pink,)),

          );
          }
          ),*/ /*

      */ /*body: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 10),
          children: [
            Text('data'),
            Text('data'),
            Text('data'),
            Text('data'),
          ],
        )*/ /*
        */ /*body: ListView.builder(
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

            */ /* */ /*Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                friendList[index],style: TextStyle(
                fontSize: 16
              ),
              ),
            );*/ /* */ /*
          }),*/ /*
        );
  }
}*/
