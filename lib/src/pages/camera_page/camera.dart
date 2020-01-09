import 'package:flutter/material.dart';
import '../../utils/constant.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  File _image;

  Future getImageFromCam() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Constant.CAMERA),
        centerTitle: true,
        backgroundColor: Constant.BG_COLOR,
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200.0,
            child: Center(
              child: _image == null
                  ? Text('No image selected.')
                  : Image.file(_image),
            ),
          ),
          FloatingActionButton(
            onPressed: getImageFromCam,
            tooltip: 'Pick Image',
            child: Icon(Icons.add_a_photo),
          ),
        ],
      ),
    );
  }
}
