import 'dart:convert';

import 'package:show_hub/core/errors/server_exception.dart';
import 'package:show_hub/core/network/api_constants.dart';
import 'package:show_hub/features/movie/data/datascource/remote/movie_remote_data_source.dart';
import 'package:show_hub/features/movie/data/models/movie_details_model.dart';
import 'package:show_hub/features/movie/data/models/movie_model.dart';
import 'package:http/http.dart' as http;
import 'package:show_hub/features/movie/domain/usecases/get_now_playing_movies_usecase.dart';

class MovieRemoteDataSourceImplementation extends MovieRemoteDataSource {
  final http.Client client;

  MovieRemoteDataSourceImplementation({required this.client});

  @override
  Future<MovieDetailsModel> getMovieDetails(int movieId) async {
    final responce = await client.get(
      Uri.parse(
        ApiConstants.getMovieDetailsPath(movieId),
      ),
    );
    if (responce.statusCode == 200) {
      final responcebody = jsonDecode(responce.body);
      final MovieDetailsModel movieDetail = MovieDetailsModel.fromJson(
        (responcebody as Map<String, dynamic>),
      );

      return movieDetail;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final responce =
        await client.get(Uri.parse(ApiConstants.popularMoviesPath));

    if (responce.statusCode == 200) {
      final responcebody = jsonDecode(responce.body);
      final List<MovieModel> movies = (responcebody['results'] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList();
      return movies;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> getTrendingMovies() async {
    final responce =
        await client.get(Uri.parse(ApiConstants.trendingMoviesPath));
    if (responce.statusCode == 200) {
      final responcebody = jsonDecode(responce.body);
      final List<MovieModel> movies = (responcebody['results'] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList();
      return movies;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final responce =
        await client.get(Uri.parse(ApiConstants.nowPlayingMoviesPath));
    if (responce.statusCode == 200) {
      final responcebody = jsonDecode(responce.body);
      final List<MovieModel> movies = (responcebody['results'] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList();
      return movies;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> searchMovies(String query) async {
    final responce =
        await client.get(Uri.parse(ApiConstants.getSearchPath(query)));
    if (responce.statusCode == 200) {
      final responcebody = jsonDecode(responce.body);
      final List<MovieModel> movies = (responcebody['results'] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList();
      return movies;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<List<MovieModel>>> getMovies() {
    final response = Future.wait(
      [
        getNowPlayingMovies(),
        getPopularMovies(),
        getTrendingMovies(),
      ],
      eagerError: true,
    );
    return response;
  }
}
