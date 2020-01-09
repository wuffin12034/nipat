import 'package:flutter/material.dart';
import 'package:nipat/src/pages/camera_page/camera.dart';
import 'package:nipat/src/pages/insert_data_page/insert_info.dart';
import 'package:nipat/src/pages/profile_page/profile.dart';
import 'package:nipat/src/utils/constant.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
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
              Container(
                height: 120,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: RaisedButton(
                    color: Constant.R_COLOR,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ProfilePage();
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
                          "การแสดงหมู่เรียน",
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
              Container(
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
              ),
              SizedBox(height: 18),
              Container(
                height: 120,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: RaisedButton(
                    color: Constant.R_COLOR,
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return InsertDataPage();
                        },
                      ),
                    ),
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.people_outline,
                            size: 70, color: Colors.white),
                        SizedBox(width: 30),
                        Text(
                          "เพิ่งข้อมูล",
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
            ],
          ),
        ],
      ),
    );
  }
}
