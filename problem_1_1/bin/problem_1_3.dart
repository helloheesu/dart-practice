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

void main() {
  final List<int> lotto = generateLottoNumbers();
  print('발급한 로또 번호 : $lotto');
}
