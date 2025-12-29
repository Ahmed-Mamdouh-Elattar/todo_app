import 'package:flutter/material.dart';
import 'package:todo_app/core/config/app_color.dart';
import 'package:todo_app/features/home/presentation/widgets/home_page_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColor.primary, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.3, 0.3],
          ),
        ),
        child: const HomePageBody(),
      ),
    );
  }
}
