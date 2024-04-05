import 'package:bloc/bloc.dart';
import 'package:show_hub/features/movie/domain/usecases/get_movies_usecase.dart';

import 'movies_event.dart';
import 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetMovies getMovies;
  MoviesBloc({required this.getMovies}) : super(MoviesInitial()) {
    on<GetMoviesEvent>((event, emit) async{
      emit(MoviesLoading());
      final failureOrMovies = await getMovies();
      failureOrMovies.fold(
        (failure) => emit(MoviesError(failure.toString())),
        (movies) => emit(MoviesLoaded(movies)),
      );
    });
  }
}
