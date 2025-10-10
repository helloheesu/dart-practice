import 'dart:math';

List<int> generateLottoNumbers({int count = 6, int maxNumber = 45}) {
  final Random random = Random();
  final Set<int> uniqueNumbers = <int>{};

  while (uniqueNumbers.length < count) {
    final int candidate = random.nextInt(maxNumber) + 1;
    uniqueNumbers.add(candidate);
  }

  final List<int> sorted = uniqueNumbers.toList()..sort();
  return sorted;
}

Set<int> generateWinningNumbers({int count = 6, int maxNumber = 45}) {
  final Random random = Random();
  final List<int> pool = List<int>.generate(maxNumber, (index) => index + 1);
  pool.shuffle(random);
  final Set<int> selected = pool.sublist(0, count).toSet();
  return selected;
}

String getWinningGrade(int matchCount) {
  if (matchCount >= 5) {
    return '1등';
  } else if (matchCount == 4) {
    return '2등';
  } else if (matchCount == 3) {
    return '3등';
  } else {
    return '당첨 실패!';
  }
}

void main() {
  final List<int> lotto = generateLottoNumbers();
  print('발급한 로또 번호 : $lotto');

  final Set<int> winningNumbers = generateWinningNumbers();
  print('당첨 번호 : ${winningNumbers.toList()..sort()}');

  final int matchCount = lotto.where((n) => winningNumbers.contains(n)).length;
  print('당첨 여부 : ${getWinningGrade(matchCount)}');

  lotto.clear();
  print('초기화된 복권 번호 : $lotto');
}
