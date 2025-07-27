import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:moviesapp/core/errors/failure.dart';
import 'package:moviesapp/feature/movies/data/models/media.dart';
import 'package:moviesapp/feature/movies/data/repos/home_repo.dart';

part 'now_movies_state.dart';

class NowMoviesCubit extends Cubit<NowMoviesState> {
  NowMoviesCubit(this.homeRepo) : super(NowMoviesInitial());

  final HomeRepo homeRepo;

  Future getNowMovies() async {
    emit(NowMovieslouding());
    var data = await homeRepo.fetchNowMovies();

    data.fold((failer) {
      emit(NowMoviesfailure(errMessage: failer.errMessage));
    }, (movies) {
      emit(NowMoviesSuccses(moviesNow: movies));
    });
  }
}
