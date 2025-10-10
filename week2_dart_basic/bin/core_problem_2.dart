const defaultCart = ["티셔츠", "바지", "모자", "티셔츠", "바지"];
const Map<String, int> priceMap = {"티셔츠": 10000, "바지": 8000, "모자": 4000};
const int discountThreshold = 20000;

void main(List<String> arguments) {
  final List<String> cart;
  if (arguments.isNotEmpty && arguments.first.isNotEmpty) {
    cart = arguments.first.split(',').toList();
  } else {
    cart = defaultCart;
  }

  final int totalPrice = cart.fold(0, (sum, item) => sum + priceMap[item]!);

  // 느낌표 사이에 띄어쓰기는 문제 의도라고 가정하고 유지했습니다.
  print("장바구니에 $totalPrice원 어치를 담으셨네요 !\n");

  final int discount;
  if (totalPrice > discountThreshold) {
    discount = totalPrice ~/ 10;
    print("할인 금액 : $discount원\n");
  } else {
    discount = 0;
  }

  final int finalAmount = totalPrice - discount;
  print("최종 결제 금액은 $finalAmount원입니다!");
}
