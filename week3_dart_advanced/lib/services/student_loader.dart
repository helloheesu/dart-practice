import 'dart:io';

import 'package:week_3/models/student_score.dart';

List<StudentScore> loadStudentData(String filePath) {
  final List<StudentScore> studentScores = [];

  try {
    final file = File(filePath);
    final lines = file.readAsLinesSync();

    for (final line in lines) {
      if (line.trim().isEmpty) continue;

      final parts = line.split(',');
      if (parts.length != 2) {
        throw FormatException('잘못된 데이터 형식: $line');
      }

      final [name, score] = parts;

      studentScores.add(
        StudentScore(studentName: name.trim(), score: int.parse(score.trim())),
      );
    }
  } catch (e) {
    print('학생 데이터를 불러오는 데 실패했습니다: $e');
    exit(1);
  }
  return studentScores;
}
