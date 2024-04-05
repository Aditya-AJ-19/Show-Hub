import 'package:dartz/dartz.dart';
import 'package:show_hub/core/domain/entity/media.dart';
import 'package:show_hub/core/data/errors/failure.dart';
import 'package:show_hub/features/watch%20List/domain/repository/watchlist_repository.dart';

class GetWatchlistItemsUseCase {
  final WatchlistRepository _baseWatchListRepository;

  GetWatchlistItemsUseCase(this._baseWatchListRepository);

  @override
  Future<Either<Failure, List<Media>>> call() async {
    return await _baseWatchListRepository.getWatchListItems();
  }
}
