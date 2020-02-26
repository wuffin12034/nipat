import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nipat/src/models/section.dart';
import 'package:nipat/src/utils/constant.dart';

class EditSecPage extends StatefulWidget {
  final String numbersec;
  final String docID;
  final String studerntID;
  EditSecPage({
    Key key,
    this.numbersec,
    this.docID,
    this.studerntID,
  }) : super(key: key);

  @override
  _EditSecPageState createState() => _EditSecPageState();
}

class _EditSecPageState extends State<EditSecPage> {
  Section newSec = Section();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                children: <Widget>[],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _submitForm(docID) async {
    final FormState form = _formKey.currentState;
    form.save();

    await Firestore.instance
        .collection('students')
        .document(docID)
        .updateData({"sec": newSec.number});
    Navigator.pop(context);
  }
}
