import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:show_hub/core/presentation/pages/main_page.dart';
import 'package:show_hub/core/resources/app_routes.dart';
import 'package:show_hub/core/utils/hive_utils.dart';
import 'package:show_hub/features/movie/presentation/pages/movie_details_page.dart';
import 'package:show_hub/features/movie/presentation/pages/movie_page.dart';
import 'package:show_hub/features/movie/presentation/pages/popular_movies_view.dart';
import 'package:show_hub/features/movie/presentation/pages/trending_movies_view.dart';
import 'package:show_hub/features/onboarding/onboarding_screen.dart';
import 'package:show_hub/features/search/presentation/pages/search_view.dart';
import 'package:show_hub/features/watch%20List/presentation/pages/watchlist_view.dart';

const String moviesPath = '/movies';
const String movieDetailsPath = 'movieDetails/:movieId';
const String popularMoviesPath = 'popularMovies';
const String topRatedMoviesPath = 'topRatedMovies';
const String searchPath = '/search';
const String onboardingPath = '/onboarding';
const String mainPagePath = '/mainPage';
const String watchlistPath = '/watchlist';

class AppRouter {
  GoRouter router = GoRouter(
    initialLocation: moviesPath,
    redirect: (context, state) {
      var isFirstTime = HiveUtils.readFirstTimeHiveBox();
      if (isFirstTime) {
        return onboardingPath;
      }
      return null;
    },
    routes: [
      ShellRoute(
        builder: (context, state, child) => MainPage(child: child),
        routes: [
          GoRoute(
            path: moviesPath,
            name: AppRoutes.moviesRoute,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: MovieScreen(),
            ),
            routes: [
              GoRoute(
                  name: AppRoutes.movieDetailsRoute,
                  path: movieDetailsPath,
                  pageBuilder: (context, state) {
                    return CupertinoPage(
                      child: MovieDetailsView(
                        movieId: int.parse(state.pathParameters['movieId']!),
                      ),
                    );
                  }),
              GoRoute(
                name: AppRoutes.popularMoviesRoute,
                path: popularMoviesPath,
                pageBuilder: (context, state) => const CupertinoPage(
                  child: PopularMoviesView(),
                ),
              ),
              GoRoute(
                name: AppRoutes.trendingMoviesRoute,
                path: topRatedMoviesPath,
                pageBuilder: (context, state) => const CupertinoPage(
                  child: TrendingMoviesView(),
                ),
              ),
            ],
          ),
          GoRoute(
            name: AppRoutes.searchRoute,
            path: searchPath,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: SearchView(),
            ),
          ),
          GoRoute(
            name: AppRoutes.watchlistRoute,
            path: watchlistPath,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: WatchListView(),
            ),
          ),
        ],
      ),
      GoRoute(
        path: mainPagePath,
        name: AppRoutes.mainPageRoute,
        builder: (context, state) => const MainPage(
          child: MovieScreen(),
        ),
      ),
      GoRoute(
        path: onboardingPath,
        name: AppRoutes.onboardingRoute,
        builder: (context, state) => const OnboardingScreen(),
      ),
    ],
  );
}
