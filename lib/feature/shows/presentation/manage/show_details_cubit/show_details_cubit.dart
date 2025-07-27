import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:moviesapp/feature/shows/data/models/show_details_model.dart';
import 'package:moviesapp/feature/shows/data/models/show_model.dart';

import '../../../data/repo/show_repo.dart';

part 'show_details_state.dart';

class ShowDetailsCubit extends Cubit<ShowDetailsState> {
  ShowDetailsCubit(this.showRepo) : super(ShowDetailsInitial());

  final ShowRepo showRepo;

  Future getShowTvPopuler({required int tvShowId}) async {
    emit(ShowDetailsLouding());
    var data = await showRepo.fetchShowDetailMovie(tvShowId: tvShowId);
    data.fold((failer) {
      emit(ShowDetailsFailure(errMessage: failer.errMessage));
    }, (showMovies) {
      emit(ShowDetailsSuccess(showDetailModel: showMovies));
    });
  }
}
