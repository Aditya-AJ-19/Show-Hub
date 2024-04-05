import 'package:show_hub/core/domain/entity/media.dart';

abstract class TrendingMovieState {}

class TrendingMovieInitial extends TrendingMovieState {}

class TrendingMovieLoading extends TrendingMovieState {}

class TrendingMovieLoaded extends TrendingMovieState {
  final List<Media> movies;

  TrendingMovieLoaded(this.movies);
}

class TrendingMovieError extends TrendingMovieState {
  final String message;

  TrendingMovieError(this.message);
}
