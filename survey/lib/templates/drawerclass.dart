import 'package:flutter/material.dart';
import '../utils/Constants.dart';

class DrawerClass extends StatefulWidget {
  @override
  _DrawerClassState createState() => _DrawerClassState();
}

class _DrawerClassState extends State<DrawerClass> {

  final prefs = Constants.prefs;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: UserAccountsDrawerHeader(
              accountName: Text(prefs.getString("first_name")),
              accountEmail: Text(prefs.getString("mobile_number")),
            ),
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
          ),
          ListTile(
            title: Text("Dashboard"),
            onTap: () {
              Navigator.pushNamed(context, "/dashboard");
            },
          ),
          ListTile(
            title: Text("Surveys"),
            onTap: () {
              Navigator.pushNamed(context, "/surveys");
            },
          ),
          ListTile(
            title: Text("Profile"),
            onTap: () {
              Navigator.pushNamed(context, "/profile");
            },
          )
        ],
      ),
    );
  }
}
