import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:show_hub/core/data/errors/failure.dart';
import 'package:show_hub/core/domain/entity/media.dart';
import 'package:show_hub/features/watch%20List/data/datasource/watchlist_local_data_source.dart';
import 'package:show_hub/features/watch%20List/data/models/watchlist_item_model.dart';
import 'package:show_hub/features/watch%20List/domain/repository/watchlist_repository.dart';

class WatchListRepositoryImpl extends WatchlistRepository {
  final WatchlistLocalDataSource _baseWatchlistLocalDataSource;

  WatchListRepositoryImpl(this._baseWatchlistLocalDataSource);

  @override
  Future<Either<Failure, int>> addWatchListItem(Media media) async {
    try {
      int id = await _baseWatchlistLocalDataSource.addWatchListItem(
        WatchlistItemModel.fromEntity(media),
      );
      return Right(id);
    } on HiveError catch (failure) {
      return Left(DatabaseFailure(failure.message));
    }
  }

  @override
  Future<Either<Failure, int>> checkIfItemAdded(int tmdbId) async {
    try {
      final result = await _baseWatchlistLocalDataSource.isItemAdded(tmdbId);
      return Right(result);
    } on HiveError catch (failure) {
      return Left(DatabaseFailure(failure.message));
    }
  }

  @override
  Future<Either<Failure, List<Media>>> getWatchListItems() async {
    final result = (await _baseWatchlistLocalDataSource.getWatchListItems());
    try {
      return Right(result);
    } on HiveError catch (failure) {
      return Left(DatabaseFailure(failure.message));
    }
  }

  @override
  Future<Either<Failure, Unit>> removeWatchListItem(int index) async{
    try {
      await _baseWatchlistLocalDataSource.removeWatchListItem(index);
      return const Right(unit);
    } on HiveError catch (failure) {
      return Left(DatabaseFailure(failure.message));
    }
  }
}
