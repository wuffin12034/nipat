import 'package:flutter/material.dart';
import 'package:nipat/src/pages/camera_page/camera.dart';
import 'package:nipat/src/scoped_modls/user.dart';
import 'package:nipat/src/services/auth_service.dart';
import 'package:nipat/src/utils/constant.dart';
import 'package:scoped_model/scoped_model.dart';

class HomePage extends StatefulWidget {
  HomePage({
    this.userId,
    this.userEmail,
    this.auth,
    this.logoutCallback,
  });

  final String userId;
  final String userEmail;
  final BaseAuth auth;
  final VoidCallback logoutCallback;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void signOut() async {
    try {
      await widget.auth.signOut();
      widget.logoutCallback();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<User>(
      builder: (BuildContext context, Widget child, User user) {
        return Scaffold(
          backgroundColor: Color(0xFF3c4250),
          body: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 60, bottom: 30),
                    child: Text(
                      Constant.APP_NAME,
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                  user.role == UserType.ADMIN
                      ? Container(
                          height: 120,
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20, left: 20),
                            child: RaisedButton(
                              color: Constant.G_COLOR,
                              onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return CameraPage();
                                  },
                                ),
                              ),
                              child: Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.computer,
                                    size: 70,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 30),
                                  Text(
                                    "กล้อง",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      : Container(),
                  SizedBox(height: 18),
                ],
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => signOut(),
            child: Icon(Icons.exit_to_app),
          ),
        );
      },
    );
  }
}
