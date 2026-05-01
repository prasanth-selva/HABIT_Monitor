import 'package:flutter/material.dart';
import '../../../../core/constants/app_dimensions.dart';

class IconPickerGrid extends StatelessWidget {
  final List<String> icons;
  final String selectedIcon;
  final ValueChanged<String> onIconSelected;

  const IconPickerGrid({
    super.key,
    required this.icons,
    required this.selectedIcon,
    required this.onIconSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 6,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: icons.length,
      itemBuilder: (context, index) {
        final icon = icons[index];
        final isSelected = icon == selectedIcon;

        return GestureDetector(
          onTap: () => onIconSelected(icon),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            decoration: BoxDecoration(
              color: isSelected ? Theme.of(context).colorScheme.primary.withOpacity(0.1) : Colors.transparent,
              borderRadius: BorderRadius.circular(AppDimensions.radiusSM),
              border: Border.all(
                color: isSelected ? Theme.of(context).colorScheme.primary : Colors.transparent,
                width: 2,
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              icon,
              style: TextStyle(
                fontSize: isSelected ? 28 : 24,
              ),
            ),
          ),
        );
      },
    );
  }
}
