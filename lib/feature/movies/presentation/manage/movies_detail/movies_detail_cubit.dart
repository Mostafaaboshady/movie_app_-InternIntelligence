import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:moviesapp/feature/movies/data/models/movies_detail_model.dart';

import '../../../data/repos/home_repo.dart';

part 'movies_detail_state.dart';

class MoviesDetailCubit extends Cubit<MoviesDetailState> {
  MoviesDetailCubit(this.homeRepo) : super(MoviesDetailInitial());

  final HomeRepo homeRepo;

  Future getMoviesDetail({required int id}) async {
    emit(MoviesDetaillouding());
    var data = await homeRepo.fetchMoviesDetail(id: id);

    data.fold((failer) {
      emit(MoviesDetailFailure(errMessage: failer.errMessage));
    }, (movies) {
      emit(MoviesDetailSuccess(moviesDetailModel: movies));
    });
  }
}
