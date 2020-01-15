import 'package:flutter/material.dart';
import '../src/utils/constant.dart';
import '../src/pages/camera_page/camera.dart';
import './pages/home_page/home.dart';
import './pages/insert_data_page/insert_info.dart';
import './pages/profile_page/profile.dart';
import './login_page/login_student.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constant.APP_NAME,
      // routes: _route,
      home: HomePage(),
    );
  }
}
