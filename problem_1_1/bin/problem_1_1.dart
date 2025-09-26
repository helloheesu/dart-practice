const defaultScore = 84;

void main(List<String> arguments) {
  final input = arguments.isNotEmpty ? int.tryParse(arguments.first) : null;
  final score = input ?? defaultScore;

  String grade;
  if (score >= 90 && score <= 100) {
    grade = 'A';
  } else if (score >= 80 && score <= 89) {
    grade = 'B';
  } else {
    grade = 'C';
  }

  print('이 학생의 점수는 $score점 이며, 등급은 $grade등급입니다!');
}
