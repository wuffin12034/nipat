import 'package:flutter/material.dart';
import 'package:nipat/src/pages/camera_page/camera.dart';
import 'package:nipat/src/pages/home_page/home.dart';
import 'package:nipat/src/pages/insertdata_page/insert.dart';
import 'package:nipat/src/pages/profile_page/profile.dart';
import 'package:nipat/src/pages/report_page/report.dart';
import 'package:nipat/src/utils/constant.dart';

class MyApp extends StatelessWidget {
  final _route = <String, WidgetBuilder>{
    Constant.HOME_ROUTE: (context) => HomePage(),
    Constant.PROFILE_ROUTE: (context) => ProfilePage(),
    Constant.CAMERA_ROUTE: (context) => CameraPage(),
    Constant.REPORT_ROUTE: (context) => ReportPage(),
    Constant.INSERT_ROUTE: (context) => InsertDataPage(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constant.APP_NAME,
//      theme: appTheme(),
      routes: _route,
      home: HomePage(),
    );
  }
}
