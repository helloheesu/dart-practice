import 'package:flutter/material.dart';
import '../../../core/constants/strings.dart';
import '../../../data/model/product_category.dart';
import '../../../data/repository/product_repository_mock.dart';
import '../../widgets/products/category_filter_bar.dart';
import '../../widgets/products/product_card.dart';
import 'product_create_page.dart';
import '../cart/cart_page.dart';

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
    final crossAxisCount = width < 380
        ? 1
        : (width < 600 ? 2 : (width < 1024 ? 3 : 4));
    // Make cards taller on smaller screens to avoid text overflow
    // Make cards tall enough for title(2) + subtitle(1) + price row
    final aspectRatio = switch (crossAxisCount) {
      1 => 0.90,
      2 => 0.78,
      3 => 0.90,
      _ => 0.95, // 4+ columns: slightly taller than square
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.appName),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => const CartPage()));
            },
          ),
        ],
      ),
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
                childAspectRatio: aspectRatio,
              ),
              itemCount: filtered.length,
              itemBuilder: (_, i) => ProductCard(product: filtered[i]),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final created = await Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (_) => const ProductCreatePage()));
          if (created == true && mounted) setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
