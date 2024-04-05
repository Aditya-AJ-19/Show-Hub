import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:show_hub/core/domain/entity/cast.dart';
import 'package:show_hub/core/presentation/components/image_with_shimmer.dart';

class CastCard extends StatelessWidget {
  final Cast cast;
  const CastCard({
    required this.cast,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      width: 100.w,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: ImageWithShimmer(
              imageUrl: cast.profileUrl,
              width: double.infinity,
              height: 130.h,
            ),
          ),
          Text(
            cast.name,
            style: textTheme.bodyLarge,
            maxLines: 2,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}