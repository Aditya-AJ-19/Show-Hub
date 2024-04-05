import 'package:bloc/bloc.dart';
import 'package:show_hub/features/movie/domain/usecases/get_popular_movies_usecase.dart';
import 'popular_movies_event.dart';
import 'popular_movies_state.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  final GetPopularMovies getPopularMovies;
  PopularMoviesBloc({required this.getPopularMovies})
      : super(PopularMoviesInitial()) {
    on<FetchPopularMovies>((event, emit) async {
      emit(PopularMoviesLoading());
      final failureOrMovies = await getPopularMovies();
      failureOrMovies.fold(
        (failure) => emit(PopularMoviesError(failure.toString())),
        (movies) => emit(PopularMoviesloaded(movies)),
      );
    });

    on<FetchMorePopularMoviesEvent>(
      (event, emit) async {
        emit(PopularMoviesLoading());
        final failureOrMovies = await getPopularMovies();
        failureOrMovies.fold(
          (failure) => emit(PopularMoviesError(failure.toString())),
          (movies) => emit(PopularMoviesloaded(movies)),
        );
      },
    );
  }
}
