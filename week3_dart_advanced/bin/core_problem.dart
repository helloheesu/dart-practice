import 'dart:io';
import 'package:week_3/services/student_loader.dart';

Future<void> main(List<String> arguments) async {
  final studentScores = await loadStudentData(
    '/Users/heesu/Documents/dart_practice/week3_dart_advanced/students.txt',
  );

  while (true) {
    stdout.write('어떤 학생의 통계를 확인하시겠습니까? ');
    final input = stdin.readLineSync();
    final name = (input ?? '').trim();

    final existingScore = studentScores[name];

    if (existingScore != null) {
      existingScore.showInfo();
      break;
    } else {
      print('잘못된 학생 이름을 입력하셨습니다. 다시 입력해주세요.');
    }
  }
}
