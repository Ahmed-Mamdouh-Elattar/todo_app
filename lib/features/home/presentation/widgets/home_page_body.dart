import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/config/app_text_styles.dart';
import 'package:todo_app/core/helper/constants.dart';
import 'package:todo_app/core/utils/app_navigation.dart';
import 'package:todo_app/core/widgets/custom_button.dart';
import 'package:todo_app/features/home/presentation/pages/add_or_edit_task_page.dart';
import 'package:todo_app/features/home/presentation/widgets/active_tasks_builder.dart';
import 'package:todo_app/features/home/presentation/widgets/completed_tasks_builder.dart';
import 'package:animations/animations.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPadding),
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
              const SliverToBoxAdapter(child: ActiveTasksBuilder()),
              const SliverToBoxAdapter(child: SizedBox(height: 20)),
              SliverToBoxAdapter(
                child: Text("Completed", style: AppTextStyles.medium20),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 20)),
              const SliverToBoxAdapter(child: CompletedTasksBuilder()),
              SliverToBoxAdapter(child: SizedBox(height: 100.h)),
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
                  const AddOrEditTaskPage(),
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
