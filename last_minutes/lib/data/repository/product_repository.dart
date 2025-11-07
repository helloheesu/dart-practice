import '../model/product.dart';

abstract class ProductRepository {
  List<Product> getAll();
  void add(Product product);
}
