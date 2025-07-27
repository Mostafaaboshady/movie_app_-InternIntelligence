import 'package:dartz/dartz.dart';
import 'package:moviesapp/core/errors/failure.dart';
import 'package:moviesapp/feature/shows/data/models/episodes_model.dart';
import 'package:moviesapp/feature/shows/data/models/show_details_model.dart';
import 'package:moviesapp/feature/shows/presentation/views/widgets/show_details_view_body.dart';

import '../models/show_model.dart';

abstract class ShowRepo {
  Future<Either<Failure, List<ShowModel>>> fetchNowShowMovie();
  Future<Either<Failure, List<ShowModel>>> fetchShowTvMovie();
  Future<Either<Failure, ShowDetailModel>> fetchShowDetailMovie(
      {required int tvShowId});

  Future<Either<Failure, EpisodesModel>> fetchShowEpisodes(
      {required int id, required seasonNumbers});
}
