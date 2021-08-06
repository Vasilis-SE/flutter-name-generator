import 'package:flutter/material.dart';
// import 'widgets/randomWords.dart';
import 'widgets/loginForm.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Name Generator',     
      theme: ThemeData(
        primaryColor: Colors.white,
      ),       
      home: LoginForm(),
    );
  }
}