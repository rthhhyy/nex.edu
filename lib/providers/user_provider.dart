import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String? _userName;
  String? _goal;
  bool? _remindersEnabled;
  String? _learningStyle;

  String? get userName => _userName;
  String? get goal => _goal;
  bool? get remindersEnabled => _remindersEnabled;
  String? get learningStyle => _learningStyle;

  void setUserName(String name) {
    _userName = name;
    notifyListeners();
  }

  void setGoal(String goal) {
    _goal = goal;
    notifyListeners();
  }

  void setRemindersEnabled(bool enabled) {
    _remindersEnabled = enabled;
    notifyListeners();
  }

  void setLearningStyle(String style) {
    _learningStyle = style;
    notifyListeners();
  }
}
