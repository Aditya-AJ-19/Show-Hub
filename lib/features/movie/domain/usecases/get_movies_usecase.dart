import 'package:dartz/dartz.dart';
import 'package:show_hub/core/domain/entity/media.dart';
import 'package:show_hub/core/errors/server_failure.dart';
import 'package:show_hub/features/movie/domain/repositories/movie_repository.dart';

class GetMovies {
  final MovieRepository movieRepository;

  GetMovies(this.movieRepository);

  Future<Either<Failure, List<List<Media>>>> call() async{
    return await movieRepository.getMovies();
  }
}