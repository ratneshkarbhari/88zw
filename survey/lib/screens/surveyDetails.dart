import 'package:flutter/material.dart';
import '../templates/bar.dart';
import '../templates/drawerclass.dart';

class SurveyDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map survey = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: Bar(),
      drawer: DrawerClass(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Text("Id: " + survey["id"].toString(),
                style: TextStyle(fontSize: 20.0)),
            Text("Title: " + survey["title"], style: TextStyle(fontSize: 20.0)),
            SizedBox(height: 20,),
            MaterialButton(
              height: 50.0,
              color: Colors.green,
              child: Text("Add Entry",style: TextStyle(color: Colors.white),),
              onPressed: () {
                Navigator.pushNamed(context,"/addSurveyEntry",arguments: {
                  "surveyId" : survey["id"]
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
