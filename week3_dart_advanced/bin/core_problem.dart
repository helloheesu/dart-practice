class Score {
  final int score;

  const Score({required this.score});

  showInfo() {
    print('점수: $score');
  }
}

class StudentScore extends Score {
  final String studentName;

  const StudentScore({required this.studentName, required super.score});

  @override
  showInfo() {
    print('이름: $studentName, 점수: $score');
  }
}

void main(List<String> arguments) {
  final scoreOnly = Score(score: 85);
  scoreOnly.showInfo();

  final student = StudentScore(studentName: '홍길동', score: 90);
  student.showInfo();
}
