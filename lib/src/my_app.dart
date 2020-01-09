import 'package:flutter/material.dart';
import '../src/utils/constant.dart';
import '../src/pages/camera_page/camera.dart';
import './pages/home_page/home.dart';
import './pages/insert_data_page/insert_info.dart';
import './pages/profile_page/profile.dart';

class MyApp extends StatelessWidget {
  final _route = <String, WidgetBuilder>{
    Constant.HOME_ROUTE: (context) => HomePage(),
    Constant.PROFILE_ROUTE: (context) => ProfilePage(),
    Constant.CAMERA_ROUTE: (context) => CameraPage(),
    // Constant.REPORT_ROUTE: (context) => ReportPage(),
    Constant.INSERT_ROUTE: (context) => InsertDataPage(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constant.APP_NAME,
      routes: _route,
      home: HomePage(),
    );
  }
}
