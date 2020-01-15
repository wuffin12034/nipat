import 'package:flutter/material.dart';
import 'package:nipat/src/utils/constant.dart';

class LoginTeacherPage extends StatefulWidget {
  @override
  _LoginTeacherPageState createState() => _LoginTeacherPageState();
}

class _LoginTeacherPageState extends State<LoginTeacherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(Constant.PROFILE),
          centerTitle: true,
          backgroundColor: Constant.BG_COLOR,
          actions: <Widget>[]),
    );
  }
}
