import 'package:week_3/services/student_loader.dart';

Future<void> main(List<String> arguments) async {
  final studentScores = await loadStudentData(
    '/Users/heesu/Documents/dart_practice/week3_dart_advanced/students.txt',
  );

  for (final studentScore in studentScores) {
    studentScore.showInfo();
  }
}
