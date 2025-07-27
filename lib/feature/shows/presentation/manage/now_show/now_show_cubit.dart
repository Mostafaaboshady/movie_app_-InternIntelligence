import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:moviesapp/feature/movies/data/repos/home_repo.dart';
import 'package:moviesapp/feature/shows/data/models/show_model.dart';
import 'package:moviesapp/feature/shows/data/repo/show_repo.dart';

part 'now_show_state.dart';

class NowShowCubit extends Cubit<NowShowState> {
  NowShowCubit(this.showRepo) : super(NowShowInitial());
  final ShowRepo showRepo;

  Future getNowShow() async {
    emit(NowShowlouding());
    var data = await showRepo.fetchNowShowMovie();
    data.fold((failer) {
      emit(NowShowFailuer(errMessage: failer.errMessage));
    }, (showMovies) {
      emit(NowShowSuccess(showModel: showMovies));
    });
  }
}
