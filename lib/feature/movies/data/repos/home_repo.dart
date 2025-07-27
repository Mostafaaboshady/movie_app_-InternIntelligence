import 'package:dartz/dartz.dart';
import 'package:moviesapp/core/errors/failure.dart';
import 'package:moviesapp/feature/movies/data/models/media.dart';
import 'package:moviesapp/feature/movies/data/models/movies_detail_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<Media>>> fetchNowMovies();
  Future<Either<Failure, List<Media>>> fetchPopulerMovies();
  Future<Either<Failure, MoviesDetailModel>> fetchMoviesDetail(
      {required int id});
}
