import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:show_hub/core/domain/entity/media.dart';
import 'package:show_hub/core/presentation/components/image_with_shimmer.dart';
import 'package:show_hub/core/resources/app_colors.dart';
import 'package:show_hub/core/utils/functions.dart';

class VerticalListViewCard extends StatelessWidget {
  const VerticalListViewCard({
    super.key,
    required this.media,
  });

  final Media media;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () {
        navigateToDetailsView(context, media);
      },
      child: Container(
        height: 175.h,
        decoration: BoxDecoration(
          color: AppColors.secondaryBackground,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.all(8.h),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: ImageWithShimmer(
                  imageUrl: media.posterUrl,
                  width: 110.w,
                  height: double.infinity,
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 6.h),
                    child: Text(
                      media.title,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.titleSmall,
                    ),
                  ),
                  Row(
                    children: [
                      if (media.releaseDate.isNotEmpty) ...[
                        Padding(
                          padding: EdgeInsets.only(right: 12.w),
                          child: Text(
                            media.releaseDate.split(', ')[1],
                            textAlign: TextAlign.center,
                            style: textTheme.bodyLarge,
                          ),
                        ),
                      ],
                      Icon(
                        Icons.star_rate_rounded,
                        color: AppColors.ratingIconColor,
                        size: 18.sp,
                      ),
                      Text(
                        media.voteAverage.toString(),
                        style: textTheme.bodyLarge,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 14.h),
                    child: Text(
                      media.overview,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.bodyLarge,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
