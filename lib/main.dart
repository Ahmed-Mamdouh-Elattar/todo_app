import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/core/services/object_box/object_box.dart';
import 'package:todo_app/core/services/object_box/object_box_provider.dart';
import 'package:todo_app/features/home/presentation/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final objectBox = ObjectBox.instance;
  await objectBox.init();
  runApp(
    ProviderScope(
      overrides: [objectBoxProvider.overrideWithValue(objectBox)],
      child: const TodoApp(),
    ),
  );
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(384, 838),
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Todo App',
          theme: ThemeData(textTheme: GoogleFonts.itimTextTheme()),
          home: child,
        );
      },
      child: const HomePage(),
    );
  }
}
