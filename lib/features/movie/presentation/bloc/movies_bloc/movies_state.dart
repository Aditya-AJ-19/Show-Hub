import 'package:show_hub/core/domain/entity/media.dart';

abstract class MoviesState {}

class MoviesInitial extends MoviesState {}

class MoviesLoading extends MoviesState {}

class MoviesLoaded extends MoviesState {
  final List<List<Media>> movies;

  MoviesLoaded(this.movies);
}

class MoviesError extends MoviesState {
  final String Message;

  MoviesError(this.Message);
}
