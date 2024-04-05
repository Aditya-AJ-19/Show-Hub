import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:show_hub/core/resources/app_colors.dart';

class CircleDot extends StatelessWidget {
  const CircleDot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.h),
      child: Container(
        width: 6.w,
        height: 6.w,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.circleDotColor,
        ),
      ),
    );
  }
}