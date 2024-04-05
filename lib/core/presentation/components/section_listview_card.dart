import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:show_hub/core/domain/entity/media.dart';
import 'package:show_hub/core/presentation/components/image_with_shimmer.dart';
import 'package:show_hub/core/resources/app_colors.dart';
import 'package:show_hub/core/utils/functions.dart';

class SectionListViewCard extends StatelessWidget {
  final Media media;

  const SectionListViewCard({
    required this.media,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      width: 120.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              navigateToDetailsView(context, media);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: ImageWithShimmer(
                imageUrl: media.posterUrl,
                width: double.infinity,
                height: 175.h,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                media.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: textTheme.bodyMedium,
              ),
              Row(
                children: [
                  Icon(
                    Icons.star_rate_rounded,
                    color: AppColors.ratingIconColor,
                    size: 18.sp,
                  ),
                  Text(
                    '${media.voteAverage}/10',
                    style: textTheme.bodySmall,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}