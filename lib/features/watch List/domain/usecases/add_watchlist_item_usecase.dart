import 'package:dartz/dartz.dart';
import 'package:show_hub/core/data/errors/failure.dart';
import 'package:show_hub/core/domain/entity/media.dart';
import 'package:show_hub/features/watch%20List/domain/repository/watchlist_repository.dart';

class AddWatchlistItemUseCase {
  final WatchlistRepository _baseWatchListRepository;

  AddWatchlistItemUseCase(this._baseWatchListRepository);

  @override
  Future<Either<Failure, int>> call(Media p) async {
    return await _baseWatchListRepository.addWatchListItem(p);
  }
}