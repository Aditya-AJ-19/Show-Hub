class Review {
  final String authorName;
  final String authorUserName;
  final String avatarUrl;
  final double rating;
  final String content;
  final String elapsedTime;

  const Review({
    required this.authorName,
    required this.authorUserName,
    required this.avatarUrl,
    required this.rating,
    required this.content,
    required this.elapsedTime,
  });
}