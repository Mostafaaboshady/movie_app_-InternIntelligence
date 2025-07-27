import 'package:dartz/dartz.dart';
import 'package:moviesapp/core/errors/failure.dart';
import 'package:moviesapp/feature/search/data/models/search_model.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<SearchModel>>> fetchMoviesSearch(
      {required String title});
}
