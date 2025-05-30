import 'package:show_hub/core/domain/entity/cast.dart';
import 'package:show_hub/core/domain/entity/media.dart';
import 'package:show_hub/core/domain/entity/review.dart';
import 'package:show_hub/features/Tv%20Shows/domain/entities/episodes.dart';
import 'package:show_hub/features/Tv%20Shows/domain/entities/season.dart';

class MediaDetails {
  int? id;
  final int tmdbID;
  final String title;
  final String posterUrl;
  final String backdropUrl;
  final String releaseDate;
  final Episode? lastEpisodeToAir;
  final String genres;
  final String? runtime;
  final int? numberOfSeasons;
  final String overview;
  final double voteAverage;
  final String voteCount;
  final String trailerUrl;
  final List<Cast>? cast;
  final List<Review>? reviews;
  final List<Season>? seasons;
  final List<Media> similar;
  bool isAdded;

  MediaDetails({
    this.id,
    required this.tmdbID,
    required this.title,
    required this.posterUrl,
    required this.backdropUrl,
    required this.releaseDate,
    this.lastEpisodeToAir,
    required this.genres,
    this.runtime,
    this.numberOfSeasons,
    required this.overview,
    required this.voteAverage,
    required this.voteCount,
    required this.trailerUrl,
    this.cast,
    this.reviews,
    this.seasons,
    required this.similar,
    this.isAdded = false,
  });
}