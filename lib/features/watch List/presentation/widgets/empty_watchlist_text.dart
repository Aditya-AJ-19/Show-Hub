import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:show_hub/core/resources/app_strings.dart';

class EmptyWatchlistText extends StatelessWidget {
  const EmptyWatchlistText({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppStrings.watchlistIsEmpty,
          style: textTheme.titleMedium,
        ),
        Padding(
          padding: EdgeInsets.only(top: 6.h),
          child: Text(
            AppStrings.watchlistText,
            style: textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}