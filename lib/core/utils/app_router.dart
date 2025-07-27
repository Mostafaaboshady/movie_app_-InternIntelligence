import 'package:go_router/go_router.dart';
import 'package:moviesapp/feature/movies/presentation/views/home_views.dart';
import 'package:moviesapp/feature/search/presentation/views/search_view.dart';
import 'package:moviesapp/feature/shows/presentation/views/show_details_view.dart';
import 'package:moviesapp/feature/shows/presentation/views/show_movies_view.dart';
import 'package:moviesapp/feature/shows/presentation/views/shows_view.dart';

import 'package:moviesapp/feature/splash/presentation/views/splash_view.dart';
import 'package:moviesapp/feature/watchlist/presentation/views/watchlist_view.dart';

import '../../feature/movies/presentation/views/movies_details_view.dart';
import '../../feature/movies/presentation/views/populer_movies_view.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kSearchView = '/searchView';
  static const kWatchlistView = '/watchlistView';
  static const kShowsView = '/showView';
  static const kPopulerMoviesView = '/populerMoviesView';
  static const kMoviesDetailsView = '/moviesDetailsView';
  static const kShowMoviesView = '/showMoviesView';
  static const kShowDetailView = '/showDetailView';
  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: kHomeView,
      builder: (context, state) => const HomeViews(),
    ),
    GoRoute(
      path: kSearchView,
      builder: (context, state) => const SearchView(),
    ),
    GoRoute(
      path: kWatchlistView,
      builder: (context, state) => const WatchlistView(),
    ),
    GoRoute(
      path: kShowsView,
      builder: (context, state) => const ShowsView(),
    ),
    GoRoute(
      path: kPopulerMoviesView,
      builder: (context, state) => const PopulerMoviesView(),
    ),
    GoRoute(
      path: kMoviesDetailsView,
      builder: (context, state) {
        final int movieId = state.extra as int;
        return MoviesDetailsView(moviesId: movieId);
      },
    ),
    GoRoute(
      path: kShowMoviesView,
      builder: (context, state) => const ShowMoviesView(),
    ),
    GoRoute(
      path: kShowDetailView,
      builder: (context, state) {
        final int movieShowId = state.extra as int;
        return ShowDetailsView(movieShowId: movieShowId);
      },
    ),
  ]);
}
