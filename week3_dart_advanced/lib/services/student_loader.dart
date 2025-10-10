import 'dart:io';

import 'package:week_3/models/student_score.dart';

Future<Map<String, StudentScore>> loadStudentData(String filePath) async {
  final Map<String, StudentScore> studentScores = {};

  try {
    final file = File(filePath);
    final lines = await file.readAsLines();

    for (final line in lines) {
      if (line.trim().isEmpty) continue;

      final parts = line.split(',');
      if (parts.length != 2) {
        throw FormatException('잘못된 데이터 형식: $line');
      }

      final String name = parts[0].trim();
      final int score = int.parse(parts[1].trim());

      studentScores[name] = StudentScore(studentName: name, score: score);
    }
  } catch (e) {
    print('학생 데이터를 불러오는 데 실패했습니다: $e');
    exit(1);
  }
  return studentScores;
}
