import 'package:dartz/dartz.dart';
import 'package:show_hub/core/data/errors/failure.dart';
import 'package:show_hub/core/domain/entity/media.dart';

abstract class WatchlistRepository {
  Future<Either<Failure, List<Media>>> getWatchListItems();
  Future<Either<Failure, int>> addWatchListItem(Media media);
  Future<Either<Failure, Unit>> removeWatchListItem(int index);
  Future<Either<Failure, int>> checkIfItemAdded(int tmdbId);
}