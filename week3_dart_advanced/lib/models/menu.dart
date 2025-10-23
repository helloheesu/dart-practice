import 'dart:io';
import 'package:week_3/models/student_score.dart';

class MenuItem {
  final String label;
  final String title;
  final Function() action;

  MenuItem({required this.label, required this.title, required this.action});

  @override
  String toString() {
    return '$label. $title';
  }
}

class Menu {
  final String header = '\n[메뉴] 기능을 선택하세요:';
  final List<MenuItem> items;
  final Map<String, StudentScore> studentScores;

  Menu({required this.studentScores}) : items = [] {
    items.addAll([
      MenuItem(
        label: '1',
        title: '우수생 출력',
        action: () => printTopStudent(studentScores),
      ),
      MenuItem(
        label: '2',
        title: '전체 평균 점수 출력',
        action: () => printAverageScore(studentScores),
      ),
      MenuItem(label: '3', title: '종료', action: terminateProgram),
    ]);
  }

  void show() {
    stdout.writeln(header);
    items.forEach(showItem);
    stdout.write('입력: ');
  }

  void showItem(MenuItem item) {
    stdout.writeln(item.toString());
  }

  void readInput() {
    final input = stdin.readLineSync()?.trim() ?? '';

    try {
      final item = items.firstWhere((item) => item.label == input);
      item.action();
    } on StateError {
      stdout.writeln('잘못된 입력입니다. 다시 시도해주세요.');
    }
  }
}

void printTopStudent(Map<String, StudentScore> studentScores) {
  if (studentScores.isEmpty) {
    stdout.writeln('학생 데이터가 비어 있습니다.');
    return;
  }

  final StudentScore topStudentScore = studentScores.values.reduce(
    (a, b) => a.score >= b.score ? a : b,
  );

  stdout.writeln('우수생 ${topStudentScore.toString()}');
}

void printAverageScore(Map<String, StudentScore> studentScores) {
  if (studentScores.isEmpty) {
    stdout.writeln('학생 데이터가 비어 있습니다.');
    return;
  }

  final totalScore = studentScores.values.fold<int>(0, (a, b) => a + b.score);
  final averageScore = totalScore / studentScores.length;

  stdout.writeln('전체 평균 점수: $averageScore');
}

void terminateProgram() {
  stdout.writeln('프로그램을 종료합니다.');
  exit(0);
}
