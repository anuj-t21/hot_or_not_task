import 'package:flutter/material.dart';
import 'package:hot_or_not_task/core/constants/constants.dart';
import 'package:hot_or_not_task/core/utils/extensions/extensions.dart';
import 'package:hot_or_not_task/presentation/home/widgets/widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Stack(
        children: [
          const FeedWidget(),
          Positioned(
            top: 40.h,
            left: (1.sw - 104.w) / 2,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.appWhite.o3,
                borderRadius: BorderRadius.circular(24.r),
              ),
              width: 104.w,
              padding: AppPaddings.paddingV8,
              child: Center(
                child: Text(
                  'Hot Or Not',
                  style: AppTextStyles.inter.s16.w8,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 24.h,
            child: const BottomTabController(),
          ),
        ],
      ),
    );
  }
}
