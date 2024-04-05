import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:show_hub/core/domain/entity/review.dart';
import 'package:show_hub/core/resources/app_colors.dart';
import 'package:show_hub/core/utils/functions.dart';
import 'package:show_hub/features/movie/presentation/widgets/avatar.dart';
import 'package:show_hub/features/movie/presentation/widgets/review_content.dart';


class ReviewCard extends StatelessWidget {
  final Review review;
  const ReviewCard({
    required this.review,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: () {
        showCustomBottomSheet(context, ReviewContent(review: review));
      },
      child: Container(
        padding: EdgeInsets.all(12.h),
        width: 240.w,
        height: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.secondaryBackground,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 6.w),
                  child: Avatar(avatarUrl: review.avatarUrl),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        review.authorName,
                        style: textTheme.bodyMedium,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        review.authorUserName,
                        style: textTheme.bodyLarge,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                )
              ],
            ),
            Text(
              review.content,
              style: textTheme.bodyLarge,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _getRatingBarIndicator(review.rating),
                Text(
                  review.elapsedTime,
                  style: textTheme.bodySmall,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget _getRatingBarIndicator(double rating) {
  if (rating != -1) {
    return RatingBarIndicator(
      rating: rating,
      itemSize: 16.h,
      unratedColor: AppColors.primaryText,
      itemBuilder: (_, __) {
        return const Icon(
          Icons.star_rate_rounded,
          color: AppColors.ratingIconColor,
        );
      },
    );
  } else {
    return const SizedBox();
  }
}
