import 'package:flutter/material.dart';
import '../controllers/authentication.dart';
// import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final mobileNumberController = TextEditingController();
  final passwordController = TextEditingController();
  var loginError = "";

  loginExe() {
    var enteredMobileNumber = mobileNumberController.text;
    var enteredPassword = passwordController.text;
    if (enteredMobileNumber == '' || enteredPassword == '') {
      setState(() { loginError = "Please enter both mobile number and password"; });
    } else {
      setState(() { loginError = ""; });
      var authentication = new Authentication();
      var params = {
        'mobile_number': enteredMobileNumber,
        'password': enteredPassword
      };
      var response = authentication.loginExe(params);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
              obscureText: true,
              decoration: InputDecoration(labelText: ("Password")),
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
    );
  }
}
