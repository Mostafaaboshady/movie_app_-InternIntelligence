import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:moviesapp/core/errors/failure.dart';
import 'package:moviesapp/core/utils/api_constant.dart';
import 'package:moviesapp/core/utils/api_server.dart';
import 'package:moviesapp/feature/shows/data/models/episodes_model.dart';
import 'package:moviesapp/feature/shows/data/models/show_details_model.dart';
import 'package:moviesapp/feature/shows/data/models/show_model.dart';
import 'package:moviesapp/feature/shows/data/repo/show_repo.dart';

class ShowRepoImpl implements ShowRepo {
  final ApiServer apiServer;

  ShowRepoImpl(this.apiServer);
  @override
  Future<Either<Failure, List<ShowModel>>> fetchNowShowMovie() async {
    try {
      var data = await apiServer.get(api: ApiConstants.onAirTvShowsPath);

      List<ShowModel> showModel = [];
      for (var item in data['results']) {
        showModel.add(ShowModel.fromJson(item));
      }

      return right(showModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioExaption(e));
      } else {
        return left(ServerFailure(errMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<ShowModel>>> fetchShowTvMovie() async {
    try {
      var data = await apiServer.get(api: ApiConstants.popularTvShowsPath);

      List<ShowModel> showModel = [];
      for (var item in data['results']) {
        showModel.add(ShowModel.fromJson(item));
      }

      return right(showModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioExaption(e));
      } else {
        return left(ServerFailure(errMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, ShowDetailModel>> fetchShowDetailMovie(
      {required int tvShowId}) async {
    try {
      var data =
          await apiServer.get(api: ApiConstants.getTvShowDetailsPath(tvShowId));

      // List<ShowModel> showModel = [];
      // for (var item in data['results']) {
      //   showModel.add(ShowModel.fromJson(item));
      // }
      var showDetail = ShowDetailModel.fromJson(data);

      return right(showDetail);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioExaption(e));
      } else {
        return left(ServerFailure(errMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, EpisodesModel>> fetchShowEpisodes(
      {required int id, required seasonNumbers}) async {
    try {
      var data = await apiServer.get(
          api: ApiConstants.getSeasonDetailsPath(id, seasonNumbers));

      // List<ShowModel> showModel = [];
      // for (var item in data['results']) {
      //   showModel.add(ShowModel.fromJson(item));
      // }
      var seasonDetials = EpisodesModel.fromJson(data);

      return right(seasonDetials);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioExaption(e));
      } else {
        return left(ServerFailure(errMessage: e.toString()));
      }
    }
  }
}
