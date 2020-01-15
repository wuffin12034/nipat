import 'package:flutter/material.dart';
import 'package:nipat/src/login_page/log_admin.dart';
import 'package:nipat/src/utils/constant.dart';

class AdminbuttPage extends StatefulWidget {
  @override
  _AdminbuttPageState createState() => _AdminbuttPageState();
}

class _AdminbuttPageState extends State<AdminbuttPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3c4250),
      body: ListView(children: <Widget>[
        Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 60, bottom: 30),
            child: Text(
              Constant.APP_NAME,
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
          ),
          Container(
            height: 120,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: RaisedButton(
                color: Constant.G_COLOR,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginAdminPage();
                      },
                    ),
                  );
                },
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.folder_open,
                      size: 70,
                      color: Colors.white,
                    ),
                    SizedBox(width: 30),
                    Text(
                      "แอดมิน",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 18),
        ]),
      ]),
    );
  }
}
