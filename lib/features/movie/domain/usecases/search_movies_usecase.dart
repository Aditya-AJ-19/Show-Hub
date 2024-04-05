import 'package:dartz/dartz.dart';
import 'package:show_hub/core/domain/entity/media.dart';
import 'package:show_hub/core/errors/server_failure.dart';
import 'package:show_hub/features/movie/domain/entities/movie_entity.dart';
import 'package:show_hub/features/movie/domain/repositories/movie_repository.dart';

class SearchMovies {
  final MovieRepository movieRepository;

  SearchMovies(this.movieRepository);

  Future<Either<Failure, List<Media>>> call(String query) async {
    return await movieRepository.searchMovie(query);
  }
}
