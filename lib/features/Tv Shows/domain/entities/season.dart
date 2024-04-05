class Season {
  final int tmdbID;
  final String name;
  final int episodeCount;
  final String airDate;
  final String overview;
  final String posterUrl;
  final int seasonNumber;

  const Season({
    required this.tmdbID,
    required this.name,
    required this.episodeCount,
    required this.airDate,
    required this.overview,
    required this.posterUrl,
    required this.seasonNumber,
  });
}
