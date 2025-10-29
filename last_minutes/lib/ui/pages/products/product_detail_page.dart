import 'package:flutter/material.dart';
import '../../../core/utils/format.dart';
import '../../../core/theme/app_theme.dart';
import '../../../data/model/product.dart';
import '../../../data/model/product_category.dart';
import '../../../data/repository/cart_store.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;
  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('상세 보기')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    product.title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                _MinutesPill(minutes: product.minutes),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                _CategoryChip(category: product.category),
                if (product.premium) ...[
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.premium,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      '💎 프리미엄',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ],
            ),
            if (product.subtitle != null) ...[
              const SizedBox(height: 16),
              Text(
                product.subtitle!,
                style: TextStyle(
                  color: Colors.black.withValues(alpha: 0.7),
                  fontSize: 14,
                ),
              ),
            ],
            const Spacer(),
            SafeArea(
              top: false,
              minimum: const EdgeInsets.only(bottom: 12),
              child: SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.chipSelectedBg,
                    foregroundColor: Colors.white,
                  ),
                  icon: const Icon(Icons.check_circle_outline),
                  label: Text('${formatMinutes(product.minutes)} 담기'),
                  onPressed: () {
                    CartStore.instance.add(product);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('장바구니에 "${product.title}"이(가) 담겼어요.'),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MinutesPill extends StatelessWidget {
  final int minutes;
  const _MinutesPill({required this.minutes});
  @override
  Widget build(BuildContext context) {
    final color = AppColors.timeColor(minutes);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.18),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.timer_outlined, size: 16, color: color),
          const SizedBox(width: 6),
          Text(
            formatMinutes(minutes),
            style: TextStyle(fontWeight: FontWeight.w700, color: color),
          ),
        ],
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  final ProductCategory category;
  const _CategoryChip({required this.category});
  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        category.label,
        style: const TextStyle(color: AppColors.chipText),
      ),
      backgroundColor: AppColors.chipUnselectedBg,
      side: const BorderSide(color: AppColors.surfaceBorder),
    );
  }
}
