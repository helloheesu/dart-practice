import 'package:week_3/services/student_loader.dart';
import 'package:week_3/models/menu.dart';

const inputFilePath = 'students.txt';

Future<void> main(List<String> arguments) async {
  final studentScores = await loadStudentDataFromFile(inputFilePath);

  final menu = Menu(studentScores: studentScores);

  while (true) {
    menu.show();
    menu.readInput();
  }
}
