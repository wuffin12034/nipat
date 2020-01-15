import 'package:flutter/material.dart';
import 'edit_insert.dart';
import 'edit_sec.dart';
import '../../utils/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class InsertsecStudentPage extends StatefulWidget {
  InsertsecStudentPage({
    Key key,
    this.numbersec,
    this.docID,
    this.studerntID,
  }) : super(key: key);
  final String numbersec;
  final String docID;
  final String studerntID;

  @override
  _InsertsecStudentPageState createState() => _InsertsecStudentPageState();
}

class _InsertsecStudentPageState extends State<InsertsecStudentPage> {
  void _submitForm() async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return EditinsertPage();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Constant.INSERT),
        centerTitle: true,
        backgroundColor: Constant.BG_COLOR,
        actions: <Widget>[
          // IconButton(
          //   icon: Icon(Icons.add),
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) {
          //           return EditsecPage();
          //         },
          //       ),
          //     );
          //   },
          // ),
        ],
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
              return Center(
                  child: Text('Loading...',
                      style: TextStyle(color: Colors.black)));
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
                          builder: (context) => EditinsertPage(
                            docID: document.documentID,
                          ),
                        ),
                      );
                    },
                    trailing:
                        Icon(Icons.keyboard_arrow_right, color: Colors.black),
                    onLongPress: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('ต้องการลบข้อมูลนิสิต?'),
                            content: Text('ลบข้อมูลนิสิต'),
                            actions: <Widget>[
                              FlatButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text('ยกเลิก'),
                              ),
                              FlatButton(
                                onPressed: () async {
                                  await Firestore.instance
                                      .collection('students')
                                      .document(document.documentID)
                                      .delete();
                                  Navigator.pop(context);
                                },
                                child: Text('ยืนยัน'),
                              )
                            ],
                          );
                        },
                      );
                    },
                  );
                },
              ).toList());
          }
        },
      ),
    );
  }
}
