import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:show_hub/core/domain/entity/media.dart';
import 'package:show_hub/core/presentation/components/slider_card_image.dart';
import 'package:show_hub/core/resources/app_colors.dart';
import 'package:show_hub/core/utils/functions.dart';

class SliderCard extends StatelessWidget {
  final Media media;
  final int itemIndex;
  const SliderCard({super.key, required this.media, required this.itemIndex});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        navigateToDetailsView(context,media);
      },
      child: Stack(
        children: [
          SliderCardImage(imageUrl: media.backdropUrl),
          Padding(
            padding: EdgeInsets.only(
              right: 16.w,
              left: 16.w,
              bottom: 10.h,
            ),
            child: SizedBox(
              height: size.height * 0.55,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    media.title,
                    maxLines: 2,
                    style: textTheme.titleMedium,
                  ),
                  Text(
                    media.releaseDate,
                    style: textTheme.bodyLarge,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 4.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: List.generate(
                        4,
                        (index) => Container(
                          margin: EdgeInsets.only(right: 10.w),
                          width: index == itemIndex ? 30.w : 6.w,
                          height: 6.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.r),
                            color: index == itemIndex
                                ? AppColors.primary
                                : AppColors.inactiveColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
