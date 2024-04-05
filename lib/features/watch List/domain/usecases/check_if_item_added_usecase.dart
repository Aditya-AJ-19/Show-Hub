import 'package:dartz/dartz.dart';
import 'package:show_hub/features/watch%20List/domain/repository/watchlist_repository.dart';
import 'package:show_hub/core/data/errors/failure.dart';

class CheckIfItemAddedUseCase {
  final WatchlistRepository _watchlistRepository;

  CheckIfItemAddedUseCase(this._watchlistRepository);
  @override
  Future<Either<Failure, int>> call(int p) async {
    return await _watchlistRepository.checkIfItemAdded(p);
  }
}