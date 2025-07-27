import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:moviesapp/core/errors/failure.dart';
import 'package:moviesapp/core/utils/api_constant.dart';
import 'package:moviesapp/core/utils/api_server.dart';
import 'package:moviesapp/feature/movies/data/models/media.dart';
import 'package:moviesapp/feature/movies/data/models/movies_detail_model.dart';
import 'package:moviesapp/feature/movies/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiServer apiServer;

  HomeRepoImpl(this.apiServer);
  @override
  Future<Either<Failure, List<Media>>> fetchNowMovies() async {
    try {
      var data = await apiServer.get(api: ApiConstants.nowPlayingMoviesPath);

      List<Media> moviews = [];
      for (var item in data['results']) {
        moviews.add(Media.fromJson(item));
      }

      return right(moviews);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioExaption(e));
      } else {
        return left(ServerFailure(errMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<Media>>> fetchPopulerMovies() async {
    try {
      var data = await apiServer.get(api: ApiConstants.popularMoviesPath);

      List<Media> moviews = [];
      for (var item in data['results']) {
        moviews.add(Media.fromJson(item));
      }

      return right(moviews);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioExaption(e));
      } else {
        return left(ServerFailure(errMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, MoviesDetailModel>> fetchMoviesDetail(
      {required int id}) async {
    try {
      var data = await apiServer.get(api: ApiConstants.getMovieDetailsPath(id));
      var movieDetail = MoviesDetailModel.fromJson(data);
      return right(movieDetail);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioExaption(e));
      } else {
        return left(ServerFailure(errMessage: e.toString()));
      }
    }
  }
}
