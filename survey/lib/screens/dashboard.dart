import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text("Link 1"),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("88Zw Survey"),
      ),
      body: Container(
        child: Text("DAshboard"),
      ),
    );
  }
}