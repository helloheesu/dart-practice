import 'package:flutter/material.dart';
import '../../../core/utils/format.dart';
import '../../../core/theme/app_theme.dart';
import '../../../data/model/product.dart';
import '../../pages/products/product_detail_page.dart';
import '../../../data/repository/cart_store.dart';
import '../../../data/model/product_category.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => ProductDetailPage(product: product),
            ),
          );
        },
        onLongPress: () {
          CartStore.instance.add(product);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('장바구니에 "${product.title}" 추가됨 (길게 눌러 담기).')),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ImageWithCart(
                category: product.category,
                onAdd: () {
                  CartStore.instance.add(product);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('장바구니에 "${product.title}" 추가됨')),
                  );
                },
              ),
              const SizedBox(height: 8),
              Text(
                product.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              if (product.subtitle != null) ...[
                const SizedBox(height: 4),
                Text(
                  product.subtitle!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black.withValues(alpha: 0.55),
                    fontSize: 12,
                  ),
                ),
              ],
              const SizedBox(height: 8),
              _PriceText(minutes: product.minutes),
            ],
          ),
        ),
      ),
    );
  }
}

class _PriceText extends StatelessWidget {
  final int minutes;
  const _PriceText({required this.minutes});
  @override
  Widget build(BuildContext context) {
    final color = AppColors.timeColor(minutes);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.schedule, size: 16, color: color),
        const SizedBox(width: 6),
        Text(
          formatMinutes(minutes),
          style: const TextStyle(fontWeight: FontWeight.w800),
        ),
      ],
    );
  }
}

class _ImageWithCart extends StatelessWidget {
  final ProductCategory category;
  final VoidCallback onAdd;
  const _ImageWithCart({required this.category, required this.onAdd});
  @override
  Widget build(BuildContext context) {
    final emoji = category.emoji;
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.accent.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: Text(emoji, style: const TextStyle(fontSize: 28)),
            ),
          ),
          Positioned(
            right: 8,
            bottom: 8,
            child: IconButton(
              visualDensity: VisualDensity.compact,
              style: IconButton.styleFrom(
                backgroundColor: Colors.white,
                shape: const CircleBorder(),
                side: BorderSide(color: Colors.black.withValues(alpha: 0.08)),
              ),
              icon: const Icon(Icons.add_shopping_cart, size: 18),
              onPressed: onAdd,
            ),
          ),
        ],
      ),
    );
  }
}
