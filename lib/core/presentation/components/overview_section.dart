import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';
import 'package:show_hub/core/resources/app_strings.dart';

class OverviewSection extends StatelessWidget {
  final String overview;

  const OverviewSection({
    super.key,
    required this.overview,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: ReadMoreText(
        overview,
        trimLines: 5,
        trimMode: TrimMode.Line,
        trimCollapsedText: AppStrings.showMore,
        trimExpandedText: AppStrings.showLess,
        style: Theme.of(context).textTheme.bodyLarge,
        moreStyle: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(fontWeight: FontWeight.w500),
        lessStyle: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(fontWeight: FontWeight.w500),
      ),
    );
  }
}
