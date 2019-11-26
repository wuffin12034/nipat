
import 'dart:async';
import 'dart:convert';
import '../models/student.dart';


class StudentService{
   String _toJson(Student student) {
    var mapData = new Map();
    mapData["firstName"] = student.firstName;
    mapData["lastName"] = student.lastName;
    mapData["identificationNumber"] = student.identificationNumber;
    mapData["faculty"] = student.faculty;
    mapData["department"] = student.department;
    mapData["year"] = student.year;
    String json = jsonEncode(mapData);
    return json;

   }
}