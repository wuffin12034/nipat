import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nipat/src/components/loading_container.dart';
import 'package:nipat/src/pages/profile_page/edit_insert.dart';
import 'package:nipat/src/utils/constant.dart';

class InsertSecStudentPage extends StatefulWidget {
  final String numbersec;

  final String docID;
  final String studerntID;
  InsertSecStudentPage({
    Key key,
    this.numbersec,
    this.docID,
    this.studerntID,
  }) : super(key: key);

  @override
  _InsertSecStudentPageState createState() => _InsertSecStudentPageState();
}

class _InsertSecStudentPageState extends State<InsertSecStudentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Constant.INSERT),
        centerTitle: true,
        backgroundColor: Constant.BG_COLOR,
        actions: <Widget>[],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance
            .collection('students')
            .where('sec', isEqualTo: widget.numbersec)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) return Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return LoadingContainer();
            default:
              return ListView(
                  children: snapshot.data.documents.map(
                (DocumentSnapshot document) {
                  return ListTile(
                    title: Text(
                      document['firstName'],
                      style: TextStyle(color: Colors.black),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditInsertPage(
                            docID: document.documentID,
                          ),
                        ),
                      );
                    },
                    trailing: Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.black,
                    ),
                    onLongPress: () => showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('ต้องการลบข้อมูลนิสิต?'),
                          content: Text('ลบข้อมูลนิสิต'),
                          actions: <Widget>[
                            FlatButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('ยกเลิก'),
                            ),
                            FlatButton(
                              onPressed: () async {
                                await Firestore.instance
                                    .collection('students')
                                    .document(document.documentID)
                                    .delete();
                                Navigator.pop(context);
                              },
                              child: const Text('ยืนยัน'),
                            )
                          ],
                        );
                      },
                    ),
                  );
                },
              ).toList());
          }
        },
      ),
    );
  }

  void _submitForm() async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return EditInsertPage();
        },
      ),
    );
  }
}
