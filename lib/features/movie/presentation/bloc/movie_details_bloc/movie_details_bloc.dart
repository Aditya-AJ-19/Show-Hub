import 'package:bloc/bloc.dart';
import 'package:show_hub/features/movie/domain/usecases/get_movies_details_usecase.dart';

import 'movie_details_event.dart';
import 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMoviesDetails getMoviesDetails;
  MovieDetailsBloc({required this.getMoviesDetails})
      : super(MovieDetailsInitial()) {
    on<FetchMovieDetailsEvent>((event, emit) async {
      emit(MovieDetailsLoading());
      final failureOrMovies = await getMoviesDetails(event.movieId);
      failureOrMovies.fold(
        (failure) => emit(MovieDetailsError(failure.toString())),
        (movies) => emit(MovieDetailsLoaded(movies)),
      );
    });
  }
}
