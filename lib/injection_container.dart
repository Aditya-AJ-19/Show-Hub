import 'package:get_it/get_it.dart';
import 'package:show_hub/features/movie/data/datascource/remote/movie_remote_data_source.dart';
import 'package:show_hub/features/movie/data/datascource/remote/movie_remote_data_source_impl.dart';
import 'package:show_hub/features/movie/data/repositories/movie_repository_impl.dart';
import 'package:show_hub/features/movie/domain/repositories/movie_repository.dart';
import 'package:show_hub/features/movie/domain/usecases/get_movies_details_usecase.dart';
import 'package:show_hub/features/movie/domain/usecases/get_movies_usecase.dart';
import 'package:show_hub/features/movie/domain/usecases/get_popular_movies_usecase.dart';
import 'package:show_hub/features/movie/domain/usecases/get_trending_movies_usecase.dart';
import 'package:show_hub/features/movie/presentation/bloc/movie_details_bloc/movie_details_bloc.dart';
import 'package:show_hub/features/movie/presentation/bloc/movies_bloc/movies_bloc.dart';
import 'package:show_hub/features/movie/presentation/bloc/popular_movies_bloc/popular_movies_bloc.dart';
import 'package:show_hub/features/movie/presentation/bloc/trending_movie_bloc/trending_movie_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:show_hub/features/watch%20List/data/datasource/watchlist_local_data_source.dart';
import 'package:show_hub/features/watch%20List/data/repository/watchlist_repository_impl.dart';
import 'package:show_hub/features/watch%20List/domain/repository/watchlist_repository.dart';
import 'package:show_hub/features/watch%20List/domain/usecases/add_watchlist_item_usecase.dart';
import 'package:show_hub/features/watch%20List/domain/usecases/check_if_item_added_usecase.dart';
import 'package:show_hub/features/watch%20List/domain/usecases/get_watchlist_items_usecase.dart';
import 'package:show_hub/features/watch%20List/domain/usecases/remove_watchlist_item_usecase.dart';
import 'package:show_hub/features/watch%20List/presentation/bloc/watchlist_bloc.dart';

final getIt = GetIt.instance;

void init() {
  //http Client
  getIt.registerLazySingleton<http.Client>(() => http.Client());

  // Data Sources
  getIt.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImplementation(client: getIt()));
  getIt.registerLazySingleton<WatchlistLocalDataSource>(
      () => WatchlistLocalDataSourceImpl());

  // Repositories
  getIt.registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(movieRemoteDataSource: getIt()));
  getIt.registerLazySingleton<WatchlistRepository>(
        () => WatchListRepositoryImpl(getIt()));

  //Use Cases
  getIt.registerLazySingleton(() => GetPopularMovies(getIt()));
  getIt.registerLazySingleton(() => GetTrendingMovies(getIt()));
  getIt.registerLazySingleton(() => GetMoviesDetails(getIt()));
  getIt.registerLazySingleton(() => GetMovies(getIt()));
  getIt.registerLazySingleton(() => GetWatchlistItemsUseCase(getIt()));
  getIt.registerLazySingleton(() => AddWatchlistItemUseCase(getIt()));
  getIt.registerLazySingleton(() => RemoveWatchlistItemUseCase(getIt()));
  getIt.registerLazySingleton(() => CheckIfItemAddedUseCase(getIt()));

  // Bloc
  getIt.registerFactory(() => PopularMoviesBloc(getPopularMovies: getIt()));
  getIt.registerFactory(() => TrendingMovieBloc(getTrendingMovies: getIt()));
  getIt.registerFactory(() => MovieDetailsBloc(getMoviesDetails: getIt()));
  getIt.registerFactory(() => MoviesBloc(getMovies: getIt()));
  getIt.registerFactory(() => WatchlistBloc(getIt(), getIt(), getIt(), getIt()));
}
