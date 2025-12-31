import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/config/app_text_styles.dart';
import 'package:todo_app/core/enums/todo_category.dart';
import 'package:todo_app/features/home/presentation/widgets/category_icon.dart';

class TaskCategory extends HookWidget {
  const TaskCategory({super.key});
  @override
  Widget build(BuildContext context) {
    final selectedCategory = useState<TodoCategory?>(null);
    return SizedBox(
      height: 50.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Category", style: AppTextStyles.medium20),
          const SizedBox(width: 10),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              scrollDirection: Axis.horizontal,
              itemCount: TodoCategory.values.length,
              itemBuilder: (context, index) {
                final category = TodoCategory.values[index];
                return GestureDetector(
                  onTap: () {
                    selectedCategory.value = category;
                  },
                  child: CategoryIcon(
                    color: category.color,
                    iconData: category.icon,
                    isSelected: selectedCategory.value == category,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
