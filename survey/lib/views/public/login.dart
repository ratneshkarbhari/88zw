import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  final _loginFormKey = GlobalKey<FormState>();
  final mobilenumberController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "88 Zero Waste",
            style: TextStyle(fontSize: 40),
          ),
          Text(
            "Survey",
            style: TextStyle(fontSize: 20),
          ),
          Form(
              key: _loginFormKey,
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(children: <Widget>[
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: mobilenumberController,
                    decoration: const InputDecoration(
                      labelText: "Enter Mobile Number",
                      hintText: '8779618322',
                    ),
                  ),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: "Password",
                    ),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  MaterialButton(
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white,fontSize: 18.0),
                    ),
                    height: 45,
                    color: Colors.purple,
                    minWidth: 300.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(50)),
                    onPressed: () {},
                  )
                ]),
              ))
        ]),
      ),
    );
  }
}
