import 'package:flutter/material.dart';
import 'screens/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Survey App.',
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.light,
        primaryColor: Colors.purple[800],
        accentColor: Colors.green[600],

        // Define the default font family.
        fontFamily: 'Roboto',

        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline2: TextStyle(fontSize: 60.0, fontWeight: FontWeight.bold),
          headline3: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
          headline4: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
          headline5: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic),
          bodyText1: TextStyle(fontSize: 16.0, fontFamily: 'Hind'),
        ),
      ),
      home: App(),
    );
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("88ZeroWaste Survey"),
        backgroundColor: Colors.purple,
      ),
      body: Login(),
    );
  }
}
