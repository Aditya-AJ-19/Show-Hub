import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:show_hub/core/domain/entity/media.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:show_hub/core/presentation/components/custom_slider.dart';
import 'package:show_hub/core/presentation/components/section_header.dart';
import 'package:show_hub/core/presentation/components/section_listview.dart';
import 'package:show_hub/core/presentation/components/section_listview_card.dart';
import 'package:show_hub/core/presentation/components/slider_card.dart';
import 'package:show_hub/core/resources/app_routes.dart';
import 'package:show_hub/core/resources/app_strings.dart';
import 'package:show_hub/features/movie/presentation/bloc/movies_bloc/movies_bloc.dart';
import 'package:show_hub/features/movie/presentation/bloc/movies_bloc/movies_event.dart';
import 'package:show_hub/features/movie/presentation/bloc/movies_bloc/movies_state.dart';
import 'package:show_hub/injection_container.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<MoviesBloc>()..add(GetMoviesEvent()),
      child: BlocBuilder<MoviesBloc, MoviesState>(
        builder: (context, state) {
          if (state is MoviesLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is MoviesLoaded) {
            return MoviesWidgets(
              nowPlayingMovies: state.movies[0],
              popularMovies: state.movies[1],
              trendingMovies: state.movies[2],
            );
          } else if (state is MoviesError) {
            return const Center(
              child: Text('error'),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}

class MoviesWidgets extends StatelessWidget {
  final List<Media> nowPlayingMovies;
  final List<Media> popularMovies;
  final List<Media> trendingMovies;
  const MoviesWidgets(
      {super.key,
      required this.nowPlayingMovies,
      required this.popularMovies,
      required this.trendingMovies});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSlider(
            itemBuilder: (context, itemIndex, _) {
              return SliderCard(
                media: nowPlayingMovies[itemIndex],
                itemIndex: itemIndex,
              );
            },
          ),
          SectionHeader(
            title: AppStrings.popularMovies,
            onSeeAllTap: () {
              context.goNamed(AppRoutes.popularMoviesRoute);
            },
          ),
          SectionListView(
            height: 240.h,
            itemCount: popularMovies.length,
            itemBuilder: (context, index) {
              return SectionListViewCard(media: popularMovies[index]);
            },
          ),
          SectionHeader(
            title: AppStrings.topRatedMovies,
            onSeeAllTap: () {
              context.goNamed(AppRoutes.trendingMoviesRoute);
            },
          ),
          SectionListView(
            height: 240.h,
            itemCount: trendingMovies.length,
            itemBuilder: (context, index) {
              return SectionListViewCard(media: trendingMovies[index]);
            },
          ),
        ],
      ),
    );
  }
}
