import 'package:week_3/models/score.dart';

class StudentScore extends Score {
  final String studentName;

  const StudentScore({required this.studentName, required super.score});

  @override
  showInfo() {
    print('이름: $studentName, 점수: $score');
  }
}
