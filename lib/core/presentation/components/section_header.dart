import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:show_hub/core/resources/app_colors.dart';
import 'package:show_hub/core/resources/app_strings.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final Function() onSeeAllTap;

  const SectionHeader({
    super.key,
    required this.title,
    required this.onSeeAllTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 4.h,
        horizontal: 16.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: textTheme.titleSmall,
          ),
          InkWell(
            onTap: onSeeAllTap,
            child: Row(
              children: [
                Text(
                  AppStrings.seeAll,
                  style: textTheme.bodyLarge,
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 12.sp,
                  color: AppColors.primaryText,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}