import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class CategoryPills extends StatelessWidget {
  final List<String> categories;
  final String selectedCategory;
  final ValueChanged<String> onCategorySelected;

  const CategoryPills({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((cat) {
          final isSelected = cat == selectedCategory;
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ChoiceChip(
              label: Text(cat),
              selected: isSelected,
              onSelected: (_) => onCategorySelected(cat),
              selectedColor: Colors.white,
              backgroundColor: Colors.transparent,
              labelStyle: TextStyle(
                color: isSelected ? AppColors.text : AppColors.textSecondary,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: isSelected ? BorderSide.none : const BorderSide(color: AppColors.border),
              ),
              elevation: isSelected ? 1 : 0,
            ),
          );
        }).toList(),
      ),
    );
  }
}
