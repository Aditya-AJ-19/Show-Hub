import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:show_hub/core/domain/entity/media.dart';
import 'package:show_hub/core/presentation/components/custom_appbar.dart';
import 'package:show_hub/core/presentation/components/loading_indicater.dart';
import 'package:show_hub/core/presentation/components/vertical_listview_card.dart';
import 'package:show_hub/core/presentation/components/virtical_listview.dart';
import 'package:show_hub/core/resources/app_strings.dart';
import 'package:show_hub/features/movie/presentation/bloc/popular_movies_bloc/popular_movies_bloc.dart';
import 'package:show_hub/features/movie/presentation/bloc/popular_movies_bloc/popular_movies_event.dart';
import 'package:show_hub/features/movie/presentation/bloc/popular_movies_bloc/popular_movies_state.dart';
import 'package:show_hub/injection_container.dart';

class PopularMoviesView extends StatelessWidget {
  const PopularMoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<PopularMoviesBloc>()..add(FetchPopularMovies()),
      child: Scaffold(
        appBar: const CustomAppBar(
          title: AppStrings.popularMovies,
        ),
        body: BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
          builder: (context, state) {
            if (state is PopularMoviesLoading) {
              return const LoadingIndicator();
            } else if (state is PopularMoviesloaded) {
              return PopularMoviesWidget(movies: state.movies);
            } else if (state is PopularMoviesError) {
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

class PopularMoviesWidget extends StatelessWidget {
  const PopularMoviesWidget({
    required this.movies,
    super.key,
  });

  final List<Media> movies;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
      builder: (context, state) {
        return VerticalListView(
          itemCount: movies.length + 1,
          itemBuilder: (context, index) {
            if (index < movies.length) {
              return VerticalListViewCard(media: movies[index]);
            } else {
              return const LoadingIndicator();
            }
          },
          addEvent: () {
            context
                .read<PopularMoviesBloc>()
                .add(FetchMorePopularMoviesEvent());
          },
        );
      },
    );
  }
}
