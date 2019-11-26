import 'package:flutter/material.dart';
import 'package:nipat/src/utils/constant.dart';

import 'package:image_picker/image_picker.dart';
import 'dart:async';

//import 'dart:io';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future getImageFromCam() async {
    // for camera
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
//      _image = image;
    });
  }

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
                      Navigator.pushNamed(context, Constant.PROFILE_ROUTE);
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
                          "Add more SKUs",
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
//                  onPressed: () {Navigator.pushNamed(context, Constant.CAMERA_ROUTE);},
                    onPressed: getImageFromCam,
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
                          "Multi branchs Control",
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
                    color: Constant.B_COLOR,
                    onPressed: () {
                      Navigator.pushNamed(context, Constant.REPORT_ROUTE);
                    },
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.cloud_queue, size: 70, color: Colors.white),
                        SizedBox(width: 30),
                        Text(
                          "Cloud based Backup",
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
                    onPressed: () {
                      Navigator.pushNamed(context, Constant.INSERT_ROUTE);
                    },
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.people_outline,
                            size: 70, color: Colors.white),
                        SizedBox(width: 30),
                        Text(
                          "Data Student",
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
