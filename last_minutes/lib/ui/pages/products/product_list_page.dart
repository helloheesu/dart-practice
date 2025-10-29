import 'package:flutter/material.dart';
import '../../../core/constants/strings.dart';
import '../../../data/model/product_category.dart';
import '../../../data/repository/product_repository_mock.dart';
import '../../widgets/products/product_card.dart';
// import '../admin/admin_page.dart';
import '../cart/cart_page.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage>
    with TickerProviderStateMixin {
  final _repo = ProductRepositoryMock();

  @override
  Widget build(BuildContext context) {
    final allProducts = _repo.getAll();
    final categories = ProductCategory.values;
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

    return DefaultTabController(
      length: 1 + categories.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.appName),
          actions: [
          // Settings icon will be added in a later step
            IconButton(
              icon: const Icon(Icons.shopping_cart_outlined),
              onPressed: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (_) => const CartPage()));
              },
            ),
          ],
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: AppStrings.home),
              for (final c in categories) Tab(text: c.label),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _HomeTab(
              onSelect: (idx) {
                DefaultTabController.of(context).animateTo(1 + idx);
              },
            ),
            for (final c in categories)
              _CategoryGrid(
                products: allProducts.where((p) => p.category == c).toList(),
                crossAxisCount: crossAxisCount,
                aspectRatio: aspectRatio,
              ),
          ],
        ),
      ),
    );
  }
}

class _CategoryGrid extends StatelessWidget {
  final List products;
  final int crossAxisCount;
  final double aspectRatio;
  const _CategoryGrid({
    required this.products,
    required this.crossAxisCount,
    required this.aspectRatio,
  });
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: aspectRatio,
      ),
      itemCount: products.length,
      itemBuilder: (_, i) => ProductCard(product: products[i]),
    );
  }
}

class _HomeTab extends StatelessWidget {
  final ValueChanged<int> onSelect;
  const _HomeTab({required this.onSelect});
  @override
  Widget build(BuildContext context) {
    final cats = ProductCategory.values;
    final width = MediaQuery.sizeOf(context).width;
    final crossAxisCount = width < 380 ? 2 : (width < 600 ? 3 : 4);
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1,
      ),
      itemCount: cats.length,
      itemBuilder: (_, i) {
        final c = cats[i];
        return Card(
          child: InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            onTap: () => onSelect(i),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(c.emoji, style: const TextStyle(fontSize: 28)),
                  const SizedBox(height: 8),
                  Text(
                    c.label,
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
