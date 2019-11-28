import 'package:flutter/material.dart';
import 'package:nipat/src/utils/constant.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Constant.PROFILE),
        centerTitle: true,
        backgroundColor: Constant.BG_COLOR,
        actions: <Widget>[
           new IconButton(
        icon: new Icon(Icons.add),
        onPressed: () => print("IconButton Add")),
        
        
        ],
      ),
    );
  }
}
