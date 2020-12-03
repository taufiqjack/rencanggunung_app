import 'package:flutter/material.dart';

class LoginApp extends StatefulWidget {
  LoginApp({Key key}) : super(key: key);

  @override
  _LoginAppState createState() => _LoginAppState();
}

class _LoginAppState extends State<LoginApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('Sugeng Rawuh'),
      ),
    );
  }
}
