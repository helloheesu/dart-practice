import 'product_category.dart';

class Product {
  final String id;
  final String title;
  final int minutes; // 가격 = 분
  final ProductCategory category;
  final bool premium;
  final String? subtitle;

  const Product({
    required this.id,
    required this.title,
    required this.minutes,
    required this.category,
    this.premium = false,
    this.subtitle,
  });
}
