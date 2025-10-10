import 'package:week_3/services/student_loader.dart';

void main(List<String> arguments) {
  final studentScores = loadStudentData(
    '/Users/heesu/Documents/dart_practice/week3_dart_advanced/students.txt',
  );

  for (final studentScore in studentScores) {
    studentScore.showInfo();
  }
}
