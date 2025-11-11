// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/exam.dart';
import '../widgets/exam_card.dart';
import 'exam_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  final String indexNumber;
  const HomeScreen({super.key, required this.indexNumber});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Exam> exams;

  @override
  void initState() {
    super.initState();
    exams = _generateExams();
    // sort chronologically
    exams.sort((a, b) => a.dateTime.compareTo(b.dateTime));
  }

  List<Exam> _generateExams() {
    // static/hardcoded list of at least 10 exams
    final now = DateTime.now();
    return [
      Exam(
        subjectName: 'Mathematics I',
        dateTime: DateTime(
          now.year,
          now.month,
          now.day,
        ).add(const Duration(days: -10, hours: 9)),
        premises: ['Building A - Room 101'],
      ),
      Exam(
        subjectName: 'Physics',
        dateTime: DateTime(
          now.year,
          now.month,
          now.day,
        ).add(const Duration(days: -3, hours: 14)),
        premises: ['Building B - Hall 2'],
      ),
      Exam(
        subjectName: 'Chemistry',
        dateTime: DateTime(
          now.year,
          now.month,
          now.day,
        ).add(const Duration(days: 1, hours: 10)),
        premises: ['Lab 3'],
      ),
      Exam(
        subjectName: 'Algorithms',
        dateTime: DateTime(
          now.year,
          now.month,
          now.day,
        ).add(const Duration(days: 5, hours: 9)),
        premises: ['Building C - Room 12'],
      ),
      Exam(
        subjectName: 'Data Structures',
        dateTime: DateTime(
          now.year,
          now.month,
          now.day,
        ).add(const Duration(days: 7, hours: 13)),
        premises: ['Building C - Room 14'],
      ),
      Exam(
        subjectName: 'Operating Systems',
        dateTime: DateTime(
          now.year,
          now.month,
          now.day,
        ).add(const Duration(days: 10, hours: 8)),
        premises: ['Building D - Hall A'],
      ),
      Exam(
        subjectName: 'Databases',
        dateTime: DateTime(
          now.year,
          now.month,
          now.day,
        ).add(const Duration(days: 12, hours: 11)),
        premises: ['Building D - Lab 1'],
      ),
      Exam(
        subjectName: 'Computer Networks',
        dateTime: DateTime(
          now.year,
          now.month,
          now.day,
        ).add(const Duration(days: 20, hours: 9)),
        premises: ['Building E - Room 5'],
      ),
      Exam(
        subjectName: 'Software Engineering',
        dateTime: DateTime(
          now.year,
          now.month,
          now.day,
        ).add(const Duration(days: 25, hours: 14)),
        premises: ['Building F - Room 2'],
      ),
      Exam(
        subjectName: 'Machine Learning',
        dateTime: DateTime(
          now.year,
          now.month,
          now.day,
        ).add(const Duration(days: 35, hours: 10)),
        premises: ['Building G - Hall 1'],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final total = exams.length;
    return Scaffold(
      appBar: AppBar(title: Text('Exam Schedule - ${widget.indexNumber}')),
      body: Stack(
        children: [
          ListView.builder(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 80),
            itemCount: exams.length,
            itemBuilder: (context, index) {
              final exam = exams[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ExamDetailScreen(exam: exam),
                    ),
                  );
                },
                child: ExamCard(exam: exam),
              );
            },
          ),
          // bottom badge
          Positioned(
            left: 16,
            right: 16,
            bottom: 16,
            child: Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 12.0,
                  horizontal: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.event_note),
                        const SizedBox(width: 8),
                        const Text(
                          'Total exams',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      radius: 18,
                      child: Text(
                        '$total',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
