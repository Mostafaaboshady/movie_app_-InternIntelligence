import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:moviesapp/core/utils/api_server.dart';
import 'package:moviesapp/feature/movies/data/repos/home_repo_impl.dart';
import 'package:moviesapp/feature/search/data/repo/search_repo_impl.dart';
import 'package:moviesapp/feature/shows/data/repo/show_repo_impl.dart';

final getIt = GetIt.instance;
void setup() {
  getIt.registerSingleton<ApiServer>(ApiServer(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(getIt.get<ApiServer>()));
  getIt.registerSingleton<ShowRepoImpl>(ShowRepoImpl(getIt.get<ApiServer>()));
  getIt.registerSingleton<SearchRepoImpl>(
      SearchRepoImpl(getIt.get<ApiServer>()));
}
