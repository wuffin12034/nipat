import 'package:flutter/material.dart';
import 'package:nipat/src/utils/constant.dart';

class LoginAdminPage extends StatefulWidget {
  @override
  _LoginAdminPageState createState() => _LoginAdminPageState();
}

class _LoginAdminPageState extends State<LoginAdminPage> {
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
