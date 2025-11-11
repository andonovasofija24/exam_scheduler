// lib/widgets/exam_card.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/exam.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;
  const ExamCard({super.key, required this.exam});

  String _formatDate(DateTime dt) {
    final dateFormatter = DateFormat('EEE, dd MMM yyyy');
    return dateFormatter.format(dt);
  }

  String _formatTime(DateTime dt) {
    return DateFormat('HH:mm').format(dt);
  }

  bool get isPassed => exam.dateTime.isBefore(DateTime.now());

  @override
  Widget build(BuildContext context) {
    final color = isPassed ? Colors.grey.shade200 : Colors.blue.shade50;
    final borderColor = isPassed ? Colors.grey : Colors.blue;
    return Card(
      color: color,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: borderColor),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  exam.subjectName,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: isPassed ? Colors.black54 : Colors.black87,
                  ),
                ),
                Icon(
                  isPassed ? Icons.check_circle : Icons.schedule,
                  color: isPassed ? Colors.grey : Colors.blue,
                ),
              ],
            ),
            const SizedBox(height: 8),
            // date/time row
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 18),
                const SizedBox(width: 6),
                Text(_formatDate(exam.dateTime)),
                const SizedBox(width: 12),
                const Icon(Icons.access_time, size: 18),
                const SizedBox(width: 6),
                Text(_formatTime(exam.dateTime)),
              ],
            ),
            const SizedBox(height: 8),
            // venue(s)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.location_on, size: 18),
                const SizedBox(width: 6),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: exam.premises.map((p) => Text(p)).toList(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
