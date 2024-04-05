import 'package:show_hub/core/domain/entity/media_details.dart';
import 'package:show_hub/features/movie/data/models/movie_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<List<MovieModel>>> getMovies();
  Future<List<MovieModel>> getTrendingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<MediaDetails> getMovieDetails(int movieId);
  Future<List<MovieModel>> searchMovies(String query);
}
