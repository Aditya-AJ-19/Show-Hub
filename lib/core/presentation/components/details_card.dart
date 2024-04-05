import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:show_hub/core/domain/entity/media.dart';
import 'package:show_hub/core/domain/entity/media_details.dart';
import 'package:show_hub/core/presentation/components/slider_card_image.dart';
import 'package:show_hub/core/resources/app_colors.dart';
import 'package:show_hub/features/watch%20List/presentation/bloc/watchlist_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsCard extends StatelessWidget {
  final MediaDetails mediaDetails;
  final Widget detailsWidget;
  const DetailsCard(
      {super.key, required this.mediaDetails, required this.detailsWidget});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    context
        .read<WatchlistBloc>()
        .add(CheckItemAddedEvent(tmdbId: mediaDetails.tmdbID));
    return SafeArea(
      child: Stack(
        children: [
          SliderCardImage(imageUrl: mediaDetails.backdropUrl),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SizedBox(
              height: size.height * 0.6,
              child: Padding(
                padding: EdgeInsets.only(bottom: 8.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            mediaDetails.title,
                            maxLines: 2,
                            style: textTheme.titleMedium,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 4.h,
                              bottom: 6.h,
                            ),
                            child: detailsWidget,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star_rate_rounded,
                                color: AppColors.ratingIconColor,
                                size: 18.sp,
                              ),
                              Text(
                                '${mediaDetails.voteAverage} ',
                                style: textTheme.bodyMedium,
                              ),
                              Text(
                                mediaDetails.voteCount,
                                style: textTheme.bodySmall,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    if (mediaDetails.trailerUrl.isNotEmpty) ...[
                      InkWell(
                        onTap: () async {
                          final url = Uri.parse(mediaDetails.trailerUrl);
                          if (await canLaunchUrl(url)) {
                            await launchUrl(url);
                          }
                        },
                        child: Container(
                          height: 40.h,
                          width: 40.h,
                          decoration: const BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.play_arrow_rounded,
                            color: AppColors.secondaryText,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 12.h,
              left: 16.w,
              right: 16.w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: EdgeInsets.all(8.w),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.iconContainerColor,
                    ),
                    child: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: AppColors.secondaryText,
                      size: 20.sp,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    mediaDetails.isAdded
                        ? context
                            .read<WatchlistBloc>()
                            .add(RemoveWatchListItemEvent(mediaDetails.id!))
                        : context.read<WatchlistBloc>().add(
                              AddWatchListItemEvent(
                                  media: Media.fromMediaDetails(mediaDetails)),
                            );
                  },
                  child: Container(
                    padding: EdgeInsets.all(8.h),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.iconContainerColor,
                    ),
                    child: BlocConsumer<WatchlistBloc, WatchlistState>(
                      listener: (context, state) {
                        if (state.status == WatchlistRequestStatus.itemAdded) {
                          mediaDetails.id = state.id;
                          mediaDetails.isAdded = true;
                        } else if (state.status ==
                            WatchlistRequestStatus.itemRemoved) {
                          mediaDetails.id = null;
                          mediaDetails.isAdded = false;
                        } else if (state.status ==
                                WatchlistRequestStatus.isItemAdded &&
                            state.id != -1) {
                          mediaDetails.id = state.id;
                          mediaDetails.isAdded = true;
                        }
                      },
                      builder: (context, state) {
                        return Icon(
                          Icons.bookmark_rounded,
                          color: mediaDetails.isAdded
                              ? AppColors.primary
                              : AppColors.secondaryText,
                          size: 20.sp,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
