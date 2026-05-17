import 'package:flutter/material.dart';

class ErrorWidgetCustom extends StatelessWidget {
  final String message;
  const ErrorWidgetCustom({required this.message});
  @override
  Widget build(BuildContext context) => Center(child: Text(message, style: const TextStyle(color: Colors.red)));
}
