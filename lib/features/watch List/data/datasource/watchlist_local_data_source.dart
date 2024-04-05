import 'package:hive_flutter/hive_flutter.dart';
import 'package:show_hub/core/resources/app_hive_string.dart';
import 'package:show_hub/features/watch%20List/data/models/watchlist_item_model.dart';

abstract class WatchlistLocalDataSource {
  Future<List<WatchlistItemModel>> getWatchListItems();
  Future<int> addWatchListItem(WatchlistItemModel item);
  Future<void> removeWatchListItem(int index);
  Future<int> isItemAdded(int tmdbID);
}

class WatchlistLocalDataSourceImpl extends WatchlistLocalDataSource {
  final Box _box = Hive.box(AppHiveString.itemBox);

  @override
  Future<int> addWatchListItem(WatchlistItemModel item) async{
    return await _box.add(item);
  }

  @override
  Future<List<WatchlistItemModel>> getWatchListItems() async {
    return _box.values
        .map((e) => WatchlistItemModel.fromEntity(e))
        .toList()
        .reversed
        .toList();
  }

  @override
  Future<int> isItemAdded(int tmdbID) async{
    return _box.values.toList().indexWhere((e) => e.tmdbID == tmdbID);
  }

  @override
  Future<void> removeWatchListItem(int index) async{
    await _box.deleteAt(index);
  }
}
