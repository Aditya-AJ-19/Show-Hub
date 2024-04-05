import 'package:dartz/dartz.dart';
import 'package:show_hub/core/domain/entity/media.dart';
import 'package:show_hub/core/domain/entity/media_details.dart';
import 'package:show_hub/core/errors/server_exception.dart';
import 'package:show_hub/core/errors/server_failure.dart';
import 'package:show_hub/features/movie/data/datascource/remote/movie_remote_data_source.dart';
import 'package:show_hub/features/movie/domain/entities/movie_entity.dart';
import 'package:show_hub/features/movie/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource movieRemoteDataSource;

  MovieRepositoryImpl({required this.movieRemoteDataSource});

  @override
  Future<Either<ServerFailure, MediaDetails>> getMovieDetails(
      int movieId) async {
    try {
      MediaDetails movieData =
          await movieRemoteDataSource.getMovieDetails(movieId);
      return right(movieData);
    } on ServerException {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<ServerFailure, List<Media>>> getPopularMovies() async {
    try {
      List<Media> movies = await movieRemoteDataSource.getPopularMovies();
      return right(movies);
    } on ServerException {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<ServerFailure, List<Media>>> getTrendingMovies() async {
    try {
      List<Media> movies =
          await movieRemoteDataSource.getTrendingMovies();
      return right(movies);
    } on ServerException {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<ServerFailure, List<Media>>> getNowPlayingMovies() async {
    try {
      List<Media> movies =
          await movieRemoteDataSource.getNowPlayingMovies();
      return right(movies);
    } on ServerException {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<ServerFailure, List<Media>>> searchMovie(
      String query) async {
    try {
      List<Media> movies =
          await movieRemoteDataSource.searchMovies(query);
      return right(movies);
    } on ServerException {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<ServerFailure, List<List<Media>>>> getMovies() async {
    try {
      final result = await movieRemoteDataSource.getMovies();
      return right(result);
    } on ServerException {
      return left(ServerFailure());
    }
  }
}
