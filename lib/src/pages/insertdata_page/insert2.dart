import 'package:flutter/material.dart';
import 'package:nipat/src/utils/constant.dart';
import 'dart:async';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
// import '../insertdata_page/insert.dart';
import 'package:firebase_storage/firebase_storage.dart';
class InsertDataPage extends StatefulWidget {
  @override
  _InsertDataPageState createState() => _InsertDataPageState();
}

class _InsertDataPageState extends State<InsertDataPage> {
  File _image;
   final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  
Future getImageFromCam() async {
    // for camera
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  Future getImageFromGallery() async {
    // for gallery
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }
   Future<String> _onImageUploader(File imagePath, String studentId) async {
    final StorageReference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('${studentId}.png');
    final StorageUploadTask task = firebaseStorageRef.putFile(imagePath);
    StorageTaskSnapshot storageTaskSnapshot = await task.onComplete;
    String downloadUrl = await storageTaskSnapshot.ref.getDownloadURL();
    return downloadUrl;
    Future<Null> _submitForm() async {
    final FormState form = _formKey.currentState;
    form.save();
  }
   Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(Constant.INSERT),
          centerTitle: true,
          backgroundColor: Constant.BG_COLOR,
        ),
        body: Form(
          key: _formKey,
          autovalidate: true,
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                        
                        Container(
//                      width: MediaQuery.of(context).size.width,
                          height: 100.0,
                          width: 274.0,  //การตั้งค่าปุ่ม
                          child: Center(
                            child: _image == null
                                ? Text('กรุณาเลือกรูปภาพ')
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
              ),
            ],
          ),
        ));}
   }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}
