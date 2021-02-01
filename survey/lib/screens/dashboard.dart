import 'package:flutter/material.dart';
import 'package:survey/templates/drawerclass.dart';
import '../utils/Constants.dart';
import '../templates/bar.dart';

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
      appBar: Bar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          child: ListView(
            children: [
              SizedBox(
                height: 15.0,
              ),
              Text(
                "Welcome " + prefs.getString("first_name"),
                style: TextStyle(fontSize: 30.0),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/surveys");
                },
                child: Card(
                  child: Container(
                    height: 200.0,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Surveys",
                          style: Theme.of(context).textTheme.headline6,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/profile");
                },
                child: Card(
                  child: Container(
                    height: 200.0,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Profile",
                          style: Theme.of(context).textTheme.headline6,
                        )
                      ],
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
