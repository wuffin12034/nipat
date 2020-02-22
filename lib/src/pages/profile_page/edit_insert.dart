import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nipat/src/components/widgets.dart';
import 'package:nipat/src/models/student.dart';
import 'package:nipat/src/services/alogolia_service.dart';
import 'package:nipat/src/services/logging_service.dart';
import 'package:nipat/src/utils/constant.dart';

class EditInsertPage extends StatefulWidget {
  final String docID;
  EditInsertPage({
    Key key,
    this.docID,
  }) : super(key: key);

  _EditInsertPageState createState() => _EditInsertPageState();
}

class _EditInsertPageState extends State<EditInsertPage> {
  Student newStudent = Student();

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

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
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'กรุณาป้อนชื่อ',
                        labelText: 'ชื่อ',
                        prefixIcon: const Icon(
                          Icons.person,
                        ),
                      ),
                      onSaved: (val) => newStudent.firstName = val.trim(),
                    ),
                    buildSizedBox(13.0),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'กรุณาป้อนนามสุล',
                        labelText: 'นามสกุล',
                        prefixIcon: const Icon(
                          Icons.person,
                        ),
                      ),
                      onSaved: (val) => newStudent.lastName = val.trim(),
                    ),
                    buildSizedBox(13.0),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'กรุณาป้อนรหัสนักศึกษา',
                        labelText: 'รหัสนักศึกษา',
                        prefixIcon: const Icon(
                          Icons.person,
                        ),
                      ),
                      onSaved: (val) =>
                          newStudent.identificationNumber = val.trim(),
                    ),
                    buildSizedBox(13.0),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'กรุณาป้อนสาขาวิชา',
                        labelText: 'สาขาวิชา',
                        prefixIcon: const Icon(
                          Icons.person,
                        ),
                      ),
                      onSaved: (val) => newStudent.faculty = val.trim(),
                    ),
                    buildSizedBox(13.0),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'กรุณาป้อนคณะ',
                        labelText: 'คณะ',
                        prefixIcon: const Icon(
                          Icons.person,
                        ),
                      ),
                      onSaved: (val) => newStudent.department = val.trim(),
                    ),
                    buildSizedBox(13.0),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'กรุณาป้อนชั้นปี',
                        labelText: 'ชั้นปี',
                        prefixIcon: const Icon(
                          Icons.person,
                        ),
                      ),
                      onSaved: (val) => newStudent.year = val.trim(),
                    ),
                    buildSizedBox(13.0),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'กรุณาป้อนหมู่เรียน',
                        labelText: 'หมู่เรียน',
                        prefixIcon: const Icon(
                          Icons.person,
                        ),
                      ),
                      onSaved: (val) => newStudent.sec = val.trim(),
                    ),
                    buildSizedBox(13.0),
                    Container(
                      height: 50,
                      width: double.infinity,
                      child: RaisedButton(
                        color: Constant.BG_COLOR,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Text(
                          "ยืนยัน",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () => _submitForm(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  void _submitForm() async {
    final algoliaService = AlogoliaService.instance;
    final FormState form = _formKey.currentState;
    form.save();

    Map<String, dynamic> upData = {
      "firstName": newStudent.firstName,
      "lastName": newStudent.lastName,
      "identificationNumber": newStudent.identificationNumber,
      "faculty": newStudent.faculty,
      "department": newStudent.department,
      "year": newStudent.year,
      "state": "AWAITING_FOR_IMAGE",
      "sec": newStudent.sec,
      "createdAt": '',
      "updatedAt": DateTime.now().millisecondsSinceEpoch,
    };

    logger.v(upData);

    await Firestore.instance
        .collection('students')
        .document(widget.docID)
        .updateData(upData);
    await algoliaService.performUpdateStudentObject(upData);
    Navigator.pop(context);
  }
}
