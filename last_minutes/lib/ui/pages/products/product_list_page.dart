import 'package:flutter/material.dart';
import '../../../core/constants/strings.dart';
import '../../../data/model/product_category.dart';
import '../../../data/repository/product_repository_mock.dart';
import '../../widgets/products/product_card.dart';
import '../admin/admin_page.dart';
import '../cart/cart_page.dart';
import '../../../data/repository/cart_store.dart';
import '../../../core/utils/format.dart';
import '../../../core/theme/app_theme.dart';

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
    // card aspect ratio tuning for grid
    final aspectRatio = switch (crossAxisCount) {
      1 => 0.90,
      2 => 0.78,
      3 => 0.90,
      _ => 0.95,
    };

    return DefaultTabController(
      length: 1 + categories.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.appName),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings_outlined),
              onPressed: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (_) => const AdminPage()));
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
            const _HomeTab(),
            for (final c in categories)
              _CategoryGrid(
                products: allProducts.where((p) => p.category == c).toList(),
                crossAxisCount: crossAxisCount,
                aspectRatio: aspectRatio,
              ),
          ],
        ),
        floatingActionButton: _CartFab(),
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
  const _HomeTab();
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
            onTap: () {
              final controller = DefaultTabController.of(context);
              controller.animateTo(1 + i);
            },
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

class _CartFab extends StatefulWidget {
  @override
  State<_CartFab> createState() => _CartFabState();
}

class _CartFabState extends State<_CartFab> {
  @override
  Widget build(BuildContext context) {
    final store = CartStore.instance;
    return AnimatedBuilder(
      animation: store,
      builder: (context, _) {
        final total = store.totalMinutes;
        return Stack(
          clipBehavior: Clip.none,
          children: [
            total > 0
                ? FloatingActionButton.large(
                    heroTag: 'cart-fab-large',
                    backgroundColor: AppColors.chipSelectedBg,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const CartPage()),
                      );
                    },
                    child: const Icon(Icons.shopping_cart_outlined),
                  )
                : FloatingActionButton(
                    heroTag: 'cart-fab-normal',
                    backgroundColor: AppColors.chipSelectedBg,
                    foregroundColor: Colors.white,
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const CartPage()),
                      );
                    },
                    child: const Icon(Icons.shopping_cart_outlined),
                  ),
            if (total > 0)
              Positioned(
                right: -4,
                top: -8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.chipSelectedBg,
                    borderRadius: BorderRadius.circular(999),
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: Text(
                    formatMinutesShort(total),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
