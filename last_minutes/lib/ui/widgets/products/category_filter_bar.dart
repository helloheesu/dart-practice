import 'package:flutter/material.dart';
import '../../../core/constants/strings.dart';
import '../../../data/model/product_category.dart';

class CategoryFilterBar extends StatelessWidget {
  final ProductCategory? selected;
  final ValueChanged<ProductCategory?> onChanged;
  const CategoryFilterBar({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final items = <({String label, ProductCategory? value})>[
      (label: AppStrings.all, value: null),
      (
        label: AppStrings.digitalBlackhole,
        value: ProductCategory.digitalBlackhole,
      ),
      (
        label: AppStrings.impulseProjects,
        value: ProductCategory.impulseProjects,
      ),
      (
        label: AppStrings.avoidantProductivity,
        value: ProductCategory.avoidantProductivity,
      ),
      (
        label: AppStrings.everydayTimeThieves,
        value: ProductCategory.everydayTimeThieves,
      ),
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          for (final item in items)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: ChoiceChip(
                label: Text(item.label),
                selected: selected == item.value,
                onSelected: (_) => onChanged(item.value),
              ),
            ),
        ],
      ),
    );
  }
}
