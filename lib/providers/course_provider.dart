import 'package:flutter/material.dart';

class CourseProvider extends ChangeNotifier {
  String? _university;
  String? _course;
  String? _semester;
  List<String> _chapters = [];

  String? get university => _university;
  String? get course => _course;
  String? get semester => _semester;
  List<String> get chapters => _chapters;

  void setUniversity(String university) {
    _university = university;
    notifyListeners();
  }

  void setCourse(String course) {
    _course = course;
    notifyListeners();
  }

  void setSemester(String semester) {
    _semester = semester;
    notifyListeners();
  }

  void setChapters(List<String> chapters) {
    _chapters = chapters;
    notifyListeners();
  }
}
