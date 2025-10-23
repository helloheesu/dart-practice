import 'dart:io';

import 'package:week_3/models/student_score.dart';

StudentScore readStudentNameFromStdin(Map<String, StudentScore> studentScores) {
  while (true) {
    stdout.write('어떤 학생의 통계를 확인하시겠습니까? ');
    final input = stdin.readLineSync();
    final name = (input ?? '').trim();

    final existingScore = studentScores[name];

    if (existingScore != null) {
      return existingScore;
    } else {
      print('잘못된 학생 이름을 입력하셨습니다. 다시 입력해주세요.');
    }
  }
}
