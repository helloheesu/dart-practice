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
  // final List<int> lotto = [9, 19, 29, 35, 37, 38]; // 테스트용 로또 번호
  final List<int> lotto = generateLottoNumbers();
  print('발급한 로또 번호 : $lotto');

  const Set<int> winningNumbers = {9, 19, 29, 35, 37, 38};
  final int matchCount = lotto.where((n) => winningNumbers.contains(n)).length;

  print('당첨 여부 : ${getWinningGrade(matchCount)}');
}
