import 'package:flutter/material.dart';

class StudyTimerScreen extends StatefulWidget {
  const StudyTimerScreen({super.key});
  @override
  State<StudyTimerScreen> createState() => _StudyTimerScreenState();
}

class _StudyTimerScreenState extends State<StudyTimerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Study Timer')));
  }
}
