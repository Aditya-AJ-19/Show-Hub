import 'package:bloc/bloc.dart';
import 'package:show_hub/features/movie/domain/usecases/get_trending_movies_usecase.dart';

import 'trending_movie_state.dart';

import 'trending_movie_event.dart';

class TrendingMovieBloc extends Bloc<TrendingMovieEvent, TrendingMovieState> {
  final GetTrendingMovies getTrendingMovies;

  TrendingMovieBloc({required this.getTrendingMovies})
      : super(TrendingMovieInitial()) {
    on<FetchTrendingMovies>((event, emit) async {
      emit(TrendingMovieLoading());
      final failureOrMovies = await getTrendingMovies();
      failureOrMovies.fold(
        (failure) => emit(TrendingMovieError(failure.toString())),
        (movies) => emit(TrendingMovieLoaded(movies)),
      );
    });
  }
}
