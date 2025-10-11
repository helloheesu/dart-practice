import 'package:week_3/services/student_loader.dart';
import 'package:week_3/services/student_selector.dart';

const filePath = 'students.txt';

Future<void> main(List<String> arguments) async {
  final studentScores = await loadStudentData(filePath);

  final selected = readStudentNameFromStdin(studentScores);
  selected.showInfo();
}
