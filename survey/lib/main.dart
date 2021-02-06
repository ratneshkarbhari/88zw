import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/login.dart';
import 'screens/surveys.dart';
import 'screens/profile.dart';
import 'screens/surveyDetails.dart';
import 'screens/dashboard.dart';
import 'utils/Constants.dart';
import 'screens/AddSurveyEntry.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Constants.prefs = await SharedPreferences.getInstance();
  runApp(MaterialApp(
    title: "88zw Survey App",
    home: Constants.prefs.getBool("loggedIn") == true ? Dashboard() : Login(),
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
        headline5: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
        headline6: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        bodyText1: TextStyle(fontSize: 16.0, fontFamily: 'Roboto'),
      ),
    ),
    routes: {
      "/dashboard": (context) => Dashboard(),
      "/surveys": (context) => Surveys(),
      "/profile": (context) => Profile(),
      "/surveyDetails": (context) =>
          SurveyDetails(),
      "/addSurveyEntry": (context) =>
          AddSurveyEntry(),
    },
  ));
}
