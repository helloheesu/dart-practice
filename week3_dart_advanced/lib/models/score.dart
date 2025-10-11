class Score {
  final int score;

  const Score({required this.score});

  showInfo() {
    print(toString());
  }

  @override
  String toString() {
    return '점수: $score';
  }
}
