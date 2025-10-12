import 'dart:io';

import 'package:week_3/services/student_loader.dart';
import 'package:week_3/models/student_score.dart';

const inputFilePath = 'students.txt';

Future<void> main(List<String> arguments) async {
  final studentScores = await loadStudentDataFromFile(inputFilePath);

  while (true) {
    stdout.writeln('\n[메뉴] 기능을 선택하세요:');
    stdout.writeln('1. 우수생 출력');
    stdout.writeln('3. 종료');
    stdout.write('입력: ');

    final input = stdin.readLineSync()?.trim() ?? '';

    switch (input) {
      case '1':
        printTopStudent(studentScores);
        break;
      case '3':
        stdout.writeln('프로그램을 종료합니다.');
        return;
      default:
        stdout.writeln('잘못된 입력입니다. 다시 시도해주세요.');
    }
  }
}

void printTopStudent(Map<String, StudentScore> studentScores) {
  if (studentScores.isEmpty) {
    stdout.writeln('학생 데이터가 비어 있습니다.');
    return;
  }

  final StudentScore topStudentScore = studentScores.values.reduce(
    (a, b) => a.score >= b.score ? a : b,
  );

  stdout.writeln('우수생 ${topStudentScore.toString()}');
}
