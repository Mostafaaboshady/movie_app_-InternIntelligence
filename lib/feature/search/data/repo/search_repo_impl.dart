import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:moviesapp/core/errors/failure.dart';
import 'package:moviesapp/core/utils/api_constant.dart';
import 'package:moviesapp/core/utils/api_server.dart';
import 'package:moviesapp/feature/search/data/models/search_model.dart';
import 'package:moviesapp/feature/search/data/repo/search_repo.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiServer apiServer;

  SearchRepoImpl(this.apiServer);

  @override
  Future<Either<Failure, List<SearchModel>>> fetchMoviesSearch(
      {required String title}) async {
    try {
      var data = await apiServer.get(api: ApiConstants.getSearchPath(title));
      List<SearchModel> searchMovie = [];
      for (var item in data['results']) {
        searchMovie.add(SearchModel.fromJson(item));
      }

      return right(searchMovie);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioExaption(e));
      } else {
        return left(ServerFailure(errMessage: e.toString()));
      }
    }
  }
}
