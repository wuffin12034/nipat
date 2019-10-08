import 'package:flutter/material.dart';
import 'package:nipat/src/utils/constant.dart';

class ReportPage extends StatefulWidget {
  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Constant.REPORT),centerTitle: true,backgroundColor: Constant.BG_COLOR,
      ),
    );
  }
}
