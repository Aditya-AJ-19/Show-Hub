class ApiConstants {
  static const String apiKey = '1e722ab7036ee07d1b5f5955d2460eed';
  static const String baseUrl = 'https://api.themoviedb.org/3';

  static const String baseBackdropUrl = 'https://image.tmdb.org/t/p/w1280';
  static const String basePosterUrl = 'https://image.tmdb.org/t/p/w500';
  static const String baseProfileUrl = 'https://image.tmdb.org/t/p/w300';
  static const String baseStillUrl = 'https://image.tmdb.org/t/p/w500';
  static const String baseAvatarUrl = 'https://image.tmdb.org/t/p/w185';
  static const String baseVideoUrl = 'https://www.youtube.com/watch?v=';

  static const String moviePlaceHolder =
      'https://davidkoepp.com/wp-content/themes/blankslate/images/Movie%20Placeholder.jpg';

  static const String castPlaceHolder =
      'https://palmbayprep.org/wp-content/uploads/2015/09/user-icon-placeholder.png';

  static const String avatarPlaceHolder =
      'https://cdn.pixabay.com/photo/2018/11/13/21/43/avatar-3814049__480.png';

  static const String popularMoviesPath =
      '$baseUrl/movie/popular?api_key=$apiKey';
  
  static const String upCommingMoviesPath =
      '$baseUrl/movie/upcoming?api_key=$apiKey';
  // movies paths
  static const String nowPlayingMoviesPath =
      '$baseUrl/movie/now_playing?api_key=$apiKey';

  static const String trendingMoviesPath =
      '$baseUrl/movie/top_rated?api_key=$apiKey';
  
  static const String stillPlaceHolder =
      'https://popcornsg.s3.amazonaws.com/gallery/1577405144-six-year.png';


  static String getMovieDetailsPath(int movieId) {
    return '$baseUrl/movie/$movieId?api_key=$apiKey&append_to_response=videos,credits,reviews,similar';
  }

   // search paths
  static String getSearchPath(String title) {
    return '$baseUrl/search/multi?api_key=$apiKey&query=$title';
  }
}