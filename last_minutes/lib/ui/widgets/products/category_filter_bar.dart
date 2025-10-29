import 'package:flutter/material.dart';
import '../../../core/constants/strings.dart';
import '../../../data/model/product_category.dart';
import '../../../core/theme/app_theme.dart';

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
      (label: AppStrings.allCategory, value: null),
      for (final c in ProductCategory.values) (label: c.label, value: c),
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
                label: Text(
                  item.label,
                  style: TextStyle(
                    color: selected == item.value
                        ? Colors.white
                        : AppColors.chipText,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                selectedColor: AppColors.chipSelectedBg,
                backgroundColor: AppColors.chipUnselectedBg,
                checkmarkColor: Colors.white,
                selected: selected == item.value,
                onSelected: (_) => onChanged(item.value),
              ),
            ),
        ],
      ),
    );
  }
}
