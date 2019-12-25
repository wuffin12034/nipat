import 'package:flutter/material.dart';
import '../../models/sec.dart';
import '../../widgets/widgets.dart';
import 'package:nipat/src/utils/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class EditsecPage extends StatefulWidget {
  EditsecPage({
    Key key,
    this.numbersec,
    this.docID,
    this.studerntID,
  }):super(key:key);
  final String numbersec;
  final String docID;
  final String studerntID;
  
  @override
  _EditsecPageState createState() => _EditsecPageState();

}
class _EditsecPageState extends State<EditsecPage> {
  @override
Sec newSec = new Sec();


  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  void _submitForm(docID) async {
    final FormState form = _formKey.currentState;
    form.save();

    await Firestore.instance.collection('students').document(docID).updateData({"sec":newSec.numbersec});
         Navigator.pop(context);

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
                    ]))])));}}