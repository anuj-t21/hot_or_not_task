import 'package:flutter/material.dart';
import 'package:hot_or_not_task/core/constants/constants.dart';
import 'package:hot_or_not_task/core/utils/screen_util/screen_util.dart';
import 'package:hot_or_not_task/presentation/home/view/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hot Or Not - Task',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.brightOrange),
        useMaterial3: true,
      ),
      home: ScreenUtilInit(
        minTextAdapt: false,
        splitScreenMode: false,
        ensureScreenSize: true,
        builder: (_, __) {
          return const HomeView();
        },
      ),
    );
  }
}
