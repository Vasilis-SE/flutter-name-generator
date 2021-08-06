import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:flutter/services.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 15.0);
  
  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    void _loginUser() async {
      var usersList = json.decode(await rootBundle.loadString('database/users.json'));

    }

    final usernameField = TextField(
      obscureText: false,
      style: style,
      controller: usernameController,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Username",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))
      ),
    );

    final passwordField = TextField(
      obscureText: true,
      style: style,
      controller: passwordController,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Password",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))
      ),
    );

    final loginBtn = Material(
      borderRadius: BorderRadius.circular(5.0),
      color: Colors.blue,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        textColor: Colors.white,
        onPressed: _loginUser,
        child: Text(
          'Sign In',
          textAlign: TextAlign.center,
        ),
      ),
    );

    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.fromLTRB(55, 10, 55, 10),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/images/banner.png'),
              SizedBox(height: 10.0),
              usernameField,
              SizedBox(height: 15.0),
              passwordField,
              SizedBox(height: 35.0),
              loginBtn
            ],
          ),
        ),
      ),
    );
  }
}

