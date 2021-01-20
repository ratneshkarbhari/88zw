import 'package:flutter/material.dart';
import '../views/public/login.dart';

class PageLoader extends StatelessWidget {
  final _loginFormKey = GlobalKey<FormState>();

  login() {
    return Login();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: login(),
    );
  }
}
