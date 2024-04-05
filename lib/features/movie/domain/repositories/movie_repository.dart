import 'package:dartz/dartz.dart';
import 'package:show_hub/core/domain/entity/media.dart';
import 'package:show_hub/core/domain/entity/media_details.dart';
import 'package:show_hub/core/errors/server_failure.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<Media>>> getTrendingMovies();
  Future<Either<Failure, List<Media>>> getPopularMovies();
  Future<Either<Failure, List<Media>>> getNowPlayingMovies();
  Future<Either<Failure, MediaDetails>> getMovieDetails(int movieId);
  Future<Either<Failure, List<Media>>> searchMovie(String query);
  Future<Either<Failure, List<List<Media>>>> getMovies();
}
