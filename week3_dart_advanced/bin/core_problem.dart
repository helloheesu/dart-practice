import 'package:week_3/models/score.dart';
import 'package:week_3/models/student_score.dart';

void main(List<String> arguments) {
  final scoreOnly = Score(score: 85);
  scoreOnly.showInfo();

  final student = StudentScore(studentName: '홍길동', score: 90);
  student.showInfo();
}
