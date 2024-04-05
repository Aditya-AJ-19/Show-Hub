import 'package:dartz/dartz.dart';
import 'package:show_hub/core/data/errors/failure.dart';
import 'package:show_hub/features/watch%20List/domain/repository/watchlist_repository.dart';

class RemoveWatchlistItemUseCase {
  final WatchlistRepository _baseWatchListRepository;

  RemoveWatchlistItemUseCase(this._baseWatchListRepository);

  @override
  Future<Either<Failure, Unit>> call(int p) async {
    return await _baseWatchListRepository.removeWatchListItem(p);
  }
}
