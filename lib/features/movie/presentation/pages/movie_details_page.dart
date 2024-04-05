import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:show_hub/core/domain/entity/cast.dart';
import 'package:show_hub/core/domain/entity/media_details.dart';
import 'package:show_hub/core/domain/entity/review.dart';
import 'package:show_hub/core/presentation/components/details_card.dart';
import 'package:show_hub/core/presentation/components/section_listview.dart';
import 'package:show_hub/core/presentation/components/section_title.dart';
import 'package:show_hub/core/resources/app_strings.dart';
import 'package:show_hub/core/utils/functions.dart';
import 'package:show_hub/features/movie/presentation/bloc/movie_details_bloc/movie_details_bloc.dart';
import 'package:show_hub/features/movie/presentation/bloc/movie_details_bloc/movie_details_event.dart';
import 'package:show_hub/features/movie/presentation/bloc/movie_details_bloc/movie_details_state.dart';
import 'package:show_hub/features/movie/presentation/widgets/cast_card.dart';
import 'package:show_hub/features/movie/presentation/widgets/movie_card_details.dart';
import 'package:show_hub/features/movie/presentation/widgets/review_card.dart';
import 'package:show_hub/injection_container.dart';

class MovieDetailsView extends StatelessWidget {
  final int movieId;
  const MovieDetailsView({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MovieDetailsBloc>()
        ..add(
          FetchMovieDetailsEvent(movieId: movieId),
        ),
      child: Scaffold(
        body: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
          builder: (context, state) {
            if (state is MovieDetailsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is MovieDetailsLoaded) {
              return MovieDetailsWidgets(
                movieDetails: state.movieDetails,
              );
            } else if (state is MovieDetailsError) {
              return const Center(
                child: Text('error'),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}

class MovieDetailsWidgets extends StatelessWidget {
  final MediaDetails movieDetails;
  const MovieDetailsWidgets({super.key, required this.movieDetails});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DetailsCard(
              mediaDetails: movieDetails,
              detailsWidget: MovieCardDetails(movieDetails: movieDetails),
            ),
            getOverviewSection(movieDetails.overview),
            _getCast(movieDetails.cast),
            _getReviews(movieDetails.reviews),
            getSimilarSection(movieDetails.similar),
            SizedBox(height: 8.h),
            
          ],
        ),
      ),
    );
  }
}

Widget _getCast(List<Cast>? cast) {
  if (cast != null && cast.isNotEmpty) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: AppStrings.cast),
        SectionListView(
          height: 175.h,
          itemCount: cast.length,
          itemBuilder: (context, index) => CastCard(
            cast: cast[index],
          ),
        ),
      ],
    );
  } else {
    return const SizedBox();
  }
}

Widget _getReviews(List<Review>? reviews) {
  if (reviews != null && reviews.isNotEmpty) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: AppStrings.reviews),
        SectionListView(
          height: 175.h,
          itemCount: reviews.length,
          itemBuilder: (context, index) => ReviewCard(
            review: reviews[index],
          ),
        ),
      ],
    );
  } else {
    return const SizedBox();
  }
}