void main() {
  final Map<String, int> priceMap = {"티셔츠": 10000, "바지": 8000, "모자": 4000};

  final List<String> cart = ["티셔츠", "바지", "모자", "티셔츠", "바지"];

  final int totalPrice = cart.fold(0, (price, item) => price + priceMap[item]!);

  print("장바구니에 $totalPrice원 어치를 담으셨네요 !");
}
