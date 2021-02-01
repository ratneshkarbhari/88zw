import 'package:flutter/material.dart';
import 'package:survey/templates/drawerclass.dart';
import '../utils/Constants.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final prefs = Constants.prefs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerClass(),
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: ListView(
            children: [
              SizedBox(height: 15.0,),
              Text("Welcome "+prefs.getString("first_name"),style: TextStyle(fontSize: 30.0),),
              Container(
                height: 500,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context,"/surveys");
                  },
                  child: Card(
                    elevation: 10.0,
                    child: Text(
                      "Surveys"
                    ),
                  ),
                ),
              ),
              Container(
                height: 500,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context,"/profile");
                  },
                  child: Card(
                    elevation: 10.0,
                    child: Text(
                      "Profile"
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
