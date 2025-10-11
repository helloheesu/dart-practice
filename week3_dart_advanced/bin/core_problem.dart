import 'package:week_3/services/student_loader.dart';
import 'package:week_3/services/student_selector.dart';
import 'package:week_3/services/result_saver.dart';

const inputFilePath = 'students.txt';
const outputFilePath = 'result.txt';

Future<void> main(List<String> arguments) async {
  final studentScores = await loadStudentData(inputFilePath);

  final selected = readStudentNameFromStdin(studentScores);
  selected.showInfo();

  final content = '이름: ${selected.studentName}, 점수: ${selected.score}';
  saveStringToFile(filePath: outputFilePath, content: content);
}
