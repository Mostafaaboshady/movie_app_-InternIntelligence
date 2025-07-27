import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:moviesapp/feature/shows/data/models/show_model.dart';

import '../../../data/repo/show_repo.dart';

part 'showtv_popular_state.dart';

class ShowtvPopularCubit extends Cubit<ShowtvPopularState> {
  ShowtvPopularCubit(this.showRepo) : super(ShowtvPopularInitial());

  final ShowRepo showRepo;

  Future getShowTvPopuler() async {
    emit(ShowtvPopularLouding());
    var data = await showRepo.fetchShowTvMovie();
    data.fold((failer) {
      emit(ShowtvPopularFailuer(errMessage: failer.errMessage));
    }, (showMovies) {
      emit(ShowtvPopularSuccess(showModel: showMovies));
    });
  }
}
