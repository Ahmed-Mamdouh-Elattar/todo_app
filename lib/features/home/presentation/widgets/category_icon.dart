import 'package:flutter/material.dart';
import 'package:todo_app/core/config/app_color.dart';

class CategoryIcon extends StatelessWidget {
  const CategoryIcon({
    required this.color,
    required this.iconData,
    super.key,
    this.isSelected = false,
  });
  final Color color;
  final IconData iconData;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.2),
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? AppColor.primary : color,
          width: isSelected ? 3 : 1.5,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Icon(iconData, color: color),
      ),
    );
  }
}
