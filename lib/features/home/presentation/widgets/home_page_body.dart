import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/config/app_text_styles.dart';
import 'package:todo_app/core/utils/app_navigation.dart';
import 'package:todo_app/core/widgets/custom_button.dart';
import 'package:todo_app/features/home/presentation/pages/add_new_task_page.dart';
import 'package:todo_app/features/home/presentation/widgets/task_Item.dart';
import 'package:todo_app/features/home/presentation/widgets/task_container_list.dart';
import 'package:animations/animations.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});
  final List<TaskItem> tasks = const [
    TaskItem(),
    TaskItem(isCompleted: true),
    TaskItem(isLastTask: true),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 60.h),
                    Text(
                      "Aug 6, 2024",
                      style: AppTextStyles.medium20.copyWith(
                        color: Colors.white,
                      ),
                    ),

                    Text(
                      "My Todo List",
                      style: AppTextStyles.semiBold24.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 30)),

              const SliverToBoxAdapter(child: SizedBox(height: 20)),
              SliverToBoxAdapter(
                child: TaskContainerList(
                  child: Column(
                    children: List.generate(tasks.length, (index) {
                      return tasks[index];
                    }),
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 20)),
              SliverToBoxAdapter(
                child: Text("Completed", style: AppTextStyles.medium20),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 20)),
              SliverToBoxAdapter(
                child: TaskContainerList(
                  child: Column(
                    children: List.generate(tasks.length, (index) {
                      return tasks[index];
                    }),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 20,
            right: 0,
            left: 0,
            child: CustomButton(
              text: "Add New Task",
              onPressed: () {
                AppNavigation.pushSharedAxis(
                  context,
                  const AddNewTaskPage(),
                  type: SharedAxisTransitionType.vertical,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
