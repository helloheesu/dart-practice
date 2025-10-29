import 'package:flutter/material.dart';
import '../../../core/utils/format.dart';
import '../../../core/theme/app_theme.dart';
import '../../../data/model/product.dart';
import '../../../data/model/product_category.dart';
import '../../../data/repository/cart_store.dart';
import '../../../core/constants/strings.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;
  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.detailTitle)),
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
              child: AnimatedBuilder(
                animation: CartStore.instance,
                builder: (context, _) {
                  final qty = CartStore.instance.quantityOf(product.id);
                  return Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: AppColors.surfaceBorder),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                formatMinutes(
                                  product.minutes * (qty == 0 ? 1 : qty),
                                ),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    style: IconButton.styleFrom(
                                      backgroundColor:
                                          AppColors.chipUnselectedBg,
                                    ),
                                    onPressed: qty > 0
                                        ? () => CartStore.instance.decrement(
                                            product,
                                          )
                                        : null,
                                    icon: const Icon(Icons.remove),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                    ),
                                    child: Text(
                                      qty.toString(),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    style: IconButton.styleFrom(
                                      backgroundColor: AppColors.chipSelectedBg,
                                      foregroundColor: Colors.white,
                                    ),
                                    onPressed: () =>
                                        CartStore.instance.increment(product),
                                    icon: const Icon(Icons.add),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
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
