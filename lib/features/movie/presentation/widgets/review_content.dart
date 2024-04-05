import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:show_hub/core/domain/entity/review.dart';
import 'package:show_hub/features/movie/presentation/widgets/avatar.dart';

class ReviewContent extends StatelessWidget {
  const ReviewContent({
    super.key,
    required this.review,
  });

  final Review review;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.all(16.h),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 6.w),
                  child: Avatar(avatarUrl: review.avatarUrl),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      review.authorName,
                      style: textTheme.bodyMedium,
                    ),
                    Text(
                      review.authorUserName,
                      style: textTheme.bodyLarge,
                    ),
                  ],
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: Text(
                review.content,
                style: textTheme.bodyLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}