import 'package:flutter/material.dart';
import '../../../core/constants/strings.dart';
import '../../../data/model/product_category.dart';
import '../../../data/repository/product_repository_mock.dart';
import '../../widgets/products/category_filter_bar.dart';
import '../../widgets/products/product_card.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  final _repo = ProductRepositoryMock();
  ProductCategory? _selected;

  @override
  Widget build(BuildContext context) {
    final allProducts = _repo.getAll();
    final filtered = _selected == null
        ? allProducts
        : allProducts.where((p) => p.category == _selected).toList();
    final width = MediaQuery.sizeOf(context).width;
    final crossAxisCount = width < 600 ? 2 : (width < 1024 ? 3 : 4);

    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.appName)),
      body: Column(
        children: [
          CategoryFilterBar(
            selected: _selected,
            onChanged: (c) => setState(() => _selected = c),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 3 / 2,
              ),
              itemCount: filtered.length,
              itemBuilder: (_, i) => ProductCard(product: filtered[i]),
            ),
          ),
        ],
      ),
    );
  }
}
