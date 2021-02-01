import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../controllers/authentication.dart';
import '../utils/Constants.dart';
import 'dashboard.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final mobileNumberController = TextEditingController();
  final passwordController = TextEditingController();
  var loginError = "";
  var _pwdShowStatus = true;
  var pwdIcon = Icons.visibility;

  Future loginExe() async {
    var enteredMobileNumber = mobileNumberController.text;
    var enteredPassword = passwordController.text;
    if (enteredMobileNumber == '' || enteredPassword == '') {
      setState(() {
        loginError = "Please enter both Values";
      });
    } else {
      setState(() {
        loginError = "";
      });
      var authentication = new Authentication();
      var params = {
        "key": "6016f56e070cb",
        'mobile_number': enteredMobileNumber,
        'password': enteredPassword,
        "role": "survey"
      };
      var response = await authentication.loginExe(params);
      var res = jsonDecode(response);
      if (res["result"] == "success") {
        setState(() {
          loginError = "";
        });
        var userdata = jsonDecode(res["data"]);
        Constants.prefs = await SharedPreferences.getInstance();
        Constants.prefs.setBool("loggedIn", true);
        Constants.prefs.setString("first_name", userdata["first_name"]);
        Constants.prefs.setString("last_name", userdata["last_name"]);
        Constants.prefs.setString("mobile_number", userdata["mobile_number"]);
        Navigator.pushReplacementNamed(context, "/dashboard");
      } else {
        setState(() {
          loginError = "Please check Mobile Number and Password";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              SizedBox(height: 25.0),
              Image(
                  image: AssetImage('assets/88zwlogo.jpeg'),
                  width: 150.0,
                  height: 150.0),
              Center(
                child: Text(
                  loginError,
                  style: TextStyle(color: Colors.red, fontSize: 16.0),
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: mobileNumberController,
                decoration: InputDecoration(labelText: ("Mobile Number")),
              ),
              TextField(
                controller: passwordController,
                obscureText: _pwdShowStatus,
                decoration: InputDecoration(
                    labelText: ("Password"),
                    suffixIcon: IconButton(
                      icon: Icon(pwdIcon),
                      onPressed: () {
                        if (_pwdShowStatus == true) {
                          setState(() {
                            pwdIcon = Icons.visibility_off;
                            _pwdShowStatus = false;
                          });
                        } else {
                          setState(() {
                            pwdIcon = Icons.visibility;
                            _pwdShowStatus = true;
                          });
                        }
                      },
                    )),
              ),
              SizedBox(height: 20.0),
              MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                height: 50.0,
                onPressed: loginExe,
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.purple,
              )
            ],
          ),
        ),
      ),
    );
  }
}
