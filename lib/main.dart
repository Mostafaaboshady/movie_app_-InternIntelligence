import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:moviesapp/constants.dart';
import 'package:moviesapp/core/utils/api_server.dart';
import 'package:moviesapp/core/utils/app_router.dart';
import 'package:moviesapp/core/utils/setup_locator.dart';
import 'package:moviesapp/feature/movies/data/repos/home_repo_impl.dart';
import 'package:moviesapp/feature/movies/presentation/manage/now_movies/now_movies_cubit.dart';
import 'package:moviesapp/feature/movies/presentation/manage/populer_movies/populer_movies_cubit.dart';
import 'package:moviesapp/feature/movies/presentation/views/home_views.dart';
import 'package:moviesapp/feature/search/data/repo/search_repo_impl.dart';
import 'package:moviesapp/feature/search/presentation/manage/search_cubit/search_cubit.dart';
import 'package:moviesapp/feature/shows/data/repo/show_repo_impl.dart';
import 'package:moviesapp/feature/shows/presentation/manage/episodes_season/episodes_season_cubit.dart';
import 'package:moviesapp/feature/shows/presentation/manage/now_show/now_show_cubit.dart';
import 'package:moviesapp/feature/shows/presentation/manage/show_popular/showtv_popular_cubit.dart';
import 'package:moviesapp/feature/splash/presentation/views/splash_view.dart';
import 'package:moviesapp/feature/watchlist/data/models/watchlist_model.dart';
import 'package:moviesapp/feature/watchlist/presentation/manage/all_movies/all_movies_cubit.dart';
import 'package:moviesapp/feature/watchlist/presentation/manage/watchlist_cubit/watch_cubit.dart';

void main() async {
  setup();
  await Hive.initFlutter();
  Hive.registerAdapter<WatchlistModel>(WatchlistModelAdapter());
  Box boxMovie;

  if (!Hive.isBoxOpen(kBoxMovie)) {
    boxMovie = await Hive.openBox<WatchlistModel>(kBoxMovie);
  } else {
    boxMovie = Hive.box<WatchlistModel>(kBoxMovie);
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) =>
              NowMoviesCubit(getIt.get<HomeRepoImpl>())..getNowMovies(),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              PopulerMoviesCubit(getIt.get<HomeRepoImpl>())..getPopulerMovies(),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              NowShowCubit(getIt.get<ShowRepoImpl>())..getNowShow(),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              ShowtvPopularCubit(getIt.get<ShowRepoImpl>())..getShowTvPopuler(),
        ),
        BlocProvider(
          create: (context) => EpisodesSeasonCubit(getIt.get<ShowRepoImpl>()),
        ),
        BlocProvider(
          create: (context) => SearchCubit(getIt.get<SearchRepoImpl>()),
        ),
        BlocProvider(
          create: (context) => WatchCubit(),
        ),
        BlocProvider(
          create: (context) => AllMoviesCubit(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
        theme: ThemeData.dark(),
      ),
    );
  }
}
