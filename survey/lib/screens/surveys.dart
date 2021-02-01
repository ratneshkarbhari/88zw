import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:survey/templates/drawerclass.dart';
import '../utils/Constants.dart';
import '../templates/bar.dart';
import '../services/apiservice.dart';

class Surveys extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Surveys> {
  final prefs = Constants.prefs;
  var url = "https://jsonplaceholder.typicode.com/photos/";
  var surveys;

  getData() async {
    var apiService = new ApiService();
    var res = await apiService.fetchGet(url);
    var data = jsonDecode(res);
    setState(() {
      surveys = data;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerClass(),
      appBar: Bar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: surveys == null
              ? Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircularProgressIndicator(),
                      Text(
                        "Loading Surveys",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                )
              : Container(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(surveys[index]["title"]),
                      );
                    },
                    itemCount: surveys.length,
                  ),
              ),
        ),
      ),
    );
  }
}
