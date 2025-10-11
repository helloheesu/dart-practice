import 'package:week_3/services/student_loader.dart';
import 'package:week_3/services/student_selector.dart';

Future<void> main(List<String> arguments) async {
  final studentScores = await loadStudentData(
    '/Users/heesu/Documents/dart_practice/week3_dart_advanced/students.txt',
  );

  final selected = readStudentNameFromStdin(studentScores);
  selected.showInfo();
}
