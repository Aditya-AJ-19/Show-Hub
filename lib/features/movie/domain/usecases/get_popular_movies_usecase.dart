import 'package:dartz/dartz.dart';
import 'package:show_hub/core/domain/entity/media.dart';
import 'package:show_hub/core/errors/server_failure.dart';
import 'package:show_hub/features/movie/domain/repositories/movie_repository.dart';

class GetPopularMovies {
  final MovieRepository movieRepository;

  GetPopularMovies(this.movieRepository);

  Future<Either<Failure, List<Media>>> call() async{
    return await movieRepository.getPopularMovies();
  }
}
