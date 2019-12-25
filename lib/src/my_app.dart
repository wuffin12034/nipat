import 'package:flutter/material.dart';
import '../src/pages/camera_page/camera_page.dart';
import '../src/pages/home_page/home_page.dart';
import '../src/pages/insert_data_page/insert_info_page.dart';
import '../src/pages/profile_page/profile_page.dart';
import '../src/pages/report_page/report_page.dart';
import '../src/utils/constant.dart';

class MyApp extends StatelessWidget {
  final _route = <String, WidgetBuilder>{
    Constant.HOME_ROUTE: (context) => HomePage(),
    Constant.PROFILE_ROUTE: (context) => ProfilePage(),
    Constant.CAMERA_ROUTE: (context) => CameraPage(),
    // Constant.REPORT_ROUTE: (context) => ReprotPage(),
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
