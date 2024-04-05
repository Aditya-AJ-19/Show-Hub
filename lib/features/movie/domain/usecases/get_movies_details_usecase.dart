import 'package:dartz/dartz.dart';
import 'package:show_hub/core/domain/entity/media_details.dart';
import 'package:show_hub/core/errors/server_failure.dart';
import 'package:show_hub/features/movie/domain/repositories/movie_repository.dart';

class GetMoviesDetails {
  final MovieRepository movieRepository;

  GetMoviesDetails(this.movieRepository);

  Future<Either<Failure, MediaDetails>> call(int movieId) async {
    return await movieRepository.getMovieDetails(movieId);
  }
}
