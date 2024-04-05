part of 'watchlist_bloc.dart';

@immutable
abstract class WatchlistEvent {}

class GetWatchListItemsEvent extends WatchlistEvent {
  @override
  List<Object?> get props => [];
}

class AddWatchListItemEvent extends WatchlistEvent {
  final Media media;

  AddWatchListItemEvent({
    required this.media,
  });

  @override
  List<Object?> get props => [media];
}

class RemoveWatchListItemEvent extends WatchlistEvent {
  final int index;

  RemoveWatchListItemEvent(this.index);

  @override
  List<Object?> get props => [index];
}

class CheckItemAddedEvent extends WatchlistEvent {
  final int tmdbId;

  CheckItemAddedEvent({
    required this.tmdbId,
  });

  @override
  List<Object?> get props => [tmdbId];
}
