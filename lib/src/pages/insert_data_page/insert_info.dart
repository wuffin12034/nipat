import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nipat/src/services/logging_service.dart';
import '../../utils/constant.dart';
import '../../models/student.dart';
import 'insert_image.dart';
import '../../components/widgets.dart';
import '../../services/alogolia_service.dart';
import 'package:dio/dio.dart';

class InsertDataPage extends StatefulWidget {
  @override
  _InsertDataPageState createState() => _InsertDataPageState();
}

class _InsertDataPageState extends State<InsertDataPage> {
  Student newStudent = Student();
  final algoliaService = AlogoliaService.instance;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  DocumentReference docRef;
  DocumentReference docRef2;

  void _submitForm() async {
    Dio dio = new Dio();
    dio.options.headers['content-type'] = 'application/json';

    final FormState form = _formKey.currentState;
    form.save();

    Map<String, dynamic> addData = {
      "firstName": newStudent.firstName,
      "lastName": newStudent.lastName,
      "identificationNumber": newStudent.identificationNumber,
      "faculty": newStudent.faculty,
      "department": newStudent.department,
      "year": newStudent.year,
      "state": "AWAITING_FOR_IMAGE",
      "sec": newStudent.sec,
      "createdAt": '', //DATE,
      "updatedAt": DateTime.now().millisecondsSinceEpoch, //DATE,
    };

    logger.v(addData);
    Map<String, dynamic> qrdata = {
      "firstName": newStudent.firstName,
      "lastName": newStudent.lastName,
      "identificationNumber": newStudent.identificationNumber,
      // "faculty": newStudent.faculty,
      // "department": newStudent.department,
      // "year": newStudent.year,
      // "state": "AWAITING_FOR_IMAGE",
      // "sec": newStudent.sec,
      // "createdAt": '', //DATE,
      "Check name": 'มาเรียน',
      // "updatedAt": DateTime.now().millisecondsSinceEpoch, //DATE,
    };

    var response =
        await dio.post("https://e025c042.ngrok.io/qr_code", data: qrdata);
    print(response.data);
    logger.v(qrdata);

    try {
      docRef = await Firestore.instance.collection('students').add(addData);
      logger.d(docRef);
    } catch (e) {
      logger.e(e.toString());
      return;
    }

    Map<String, dynamic> qrStudent = {
      "student_doce": docRef.documentID,
      "qr_image_url": response.data['imageUrl'],
    };

    try {
      docRef2 =
          await Firestore.instance.collection('qrstudents').add(qrStudent);
      logger.v(docRef2);
    } catch (e) {
      logger.e(e.toString());
      return;
    }

    await algoliaService.performAddStudentsObject(addData);

    if (docRef.documentID != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return InsertImagePage(
              docID: docRef.documentID,
              studentID: newStudent.identificationNumber,
            );
          },
        ),
      );
    } else {
      print('error');
    }
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
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'กรุณาป้อนชื่อ',
                      labelText: 'ชื่อ',
                      prefixIcon: const Icon(
                        Icons.person,
                      ),
                    ),
                    onSaved: (val) => newStudent.firstName = val,
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
                    onSaved: (val) => newStudent.lastName = val,
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
                    onSaved: (val) => newStudent.identificationNumber = val,
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
                    onSaved: (val) => newStudent.faculty = val,
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
                    onSaved: (val) => newStudent.department = val,
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
                    onSaved: (val) => newStudent.year = val,
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
                    onSaved: (val) => newStudent.sec = val,
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
                        child: Text(
                          "ยืนยัน",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          _submitForm();
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
