// lib/models/exam.dart
import 'package:flutter/foundation.dart';

class Exam {
  final String subjectName;
  final DateTime dateTime;
  final List<String> premises;

  // named parameters constructor
  Exam({
    required this.subjectName,
    required this.dateTime,
    required this.premises,
  });
}
