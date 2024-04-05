import 'package:show_hub/core/domain/entity/media.dart';

abstract class PopularMoviesState {}

class PopularMoviesInitial extends PopularMoviesState {}

class PopularMoviesLoading extends PopularMoviesState {}

class PopularMoviesloaded extends PopularMoviesState {
  final List<Media> movies;

  PopularMoviesloaded(this.movies);

}

class PopularMoviesError extends PopularMoviesState {
  final String message;

  PopularMoviesError(this.message);
}
