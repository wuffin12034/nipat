import 'package:flutter/material.dart';
import 'package:nipat/src/utils/constant.dart';
import 'dart:async';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../../models/student.dart';
// import '../../services/student_services.dart';

class InsertDataPage extends StatefulWidget {
  @override
  _InsertDataPageState createState() => _InsertDataPageState();
}

class _InsertDataPageState extends State<InsertDataPage> {
  File _image;
  Student newStudent = new Student();

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
  }

  Future<Null> _submitForm() async {
    final FormState form = _formKey.currentState;
    form.save();
    print(newStudent.firstName);
    print(newStudent.lastName);
    // print(newStudent.faculty);
    // print(newStudent.department);
    // print(newStudent.year);
    print(newStudent);

    var imageUrl =
        await _onImageUploader(_image, newStudent.identificationNumber);
    print(imageUrl);
    Firestore.instance.collection('student').document().setData(
        {"firstName": newStudent.firstName, "lastName": newStudent.lastName});
  }

  @override
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
                    TextFormField(
                      decoration: new InputDecoration(
                        border: new OutlineInputBorder(),
                        hintText: 'กรุณาป้อนชื่อ',
//              helperText: 'Keep it short, this is just a demo.',
                        labelText: 'ชื่อ',
                        prefixIcon: const Icon(
                          Icons.person,
                        ),
                      ),
                      onSaved: (val) => newStudent.firstName = val,
                    ),
                    buildSizedBox(),
                    TextFormField(
                      decoration: new InputDecoration(
                        border: new OutlineInputBorder(),
                        hintText: 'กรุณาป้อนนามสุล',
//              helperText: 'Keep it short, this is just a demo.',
                        labelText: 'นามสกุล',
                        prefixIcon: const Icon(
                          Icons.person,
                        ),
                      ),
                      onSaved: (val) => newStudent.lastName = val,
                    ),
                    buildSizedBox(),
                    TextFormField(
                      decoration: new InputDecoration(
                        border: new OutlineInputBorder(),
                        hintText: 'กรุณาป้อนรหัสนักศึกษา',
//              helperText: 'Keep it short, this is just a demo.',
                        labelText: 'รหัสนักศึกษา',
                        prefixIcon: const Icon(
                          Icons.person,
                        ),
                      ),
                      onSaved: (val) => newStudent.identificationNumber = val,
                    ),
                    buildSizedBox(),
                    TextFormField(
                      decoration: new InputDecoration(
                        border: new OutlineInputBorder(),
                        hintText: 'กรุณาป้อนสาขาวิชา',
//              helperText: 'Keep it short, this is just a demo.',
                        labelText: 'สาขาวิชา',
                        prefixIcon: const Icon(
                          Icons.person,
                        ),
                      ),
                      onSaved: (val) => newStudent.faculty = val,
                    ),
                    buildSizedBox(),
                    TextFormField(
                      decoration: new InputDecoration(
                        border: new OutlineInputBorder(),
                        hintText: 'กรุณาป้อนคณะ',
//              helperText: 'Keep it short, this is just a demo.',
                        labelText: 'คณะ',
                        prefixIcon: const Icon(
                          Icons.person,
                        ),
                      ),
                      onSaved: (val) => newStudent.department = val,
                    ),
                    buildSizedBox(),
                    TextFormField(
                      decoration: new InputDecoration(
                        border: new OutlineInputBorder(),
                        hintText: 'กรุณาป้อนชั้นปี',
//              helperText: 'Keep it short, this is just a demo.',
                        labelText: 'ชั้นปี',
                        prefixIcon: const Icon(
                          Icons.person,
                        ),
                      ),
                      onSaved: (val) => newStudent.year = val,
                    ),
                    buildSizedBox(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
//                      width: MediaQuery.of(context).size.width,
                          height: 100.0,
                          width: 274.0,  //ตตั้งหน้าจอเคริ่องมุก 274จะไม่เกิน
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
                    buildSizedBox(),
                    Container(
                      height: 50,
                      width: double.infinity,
                      child: RaisedButton(
                        color: Constant.BG_COLOR,
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(5),
                        ),
                        child: Text(
                          "ยืนยัน",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: _submitForm,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  SizedBox buildSizedBox() {
    return SizedBox(
      height: 13,
    );
  }
}
