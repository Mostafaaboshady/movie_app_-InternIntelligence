import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:moviesapp/feature/shows/data/models/episodes_model.dart';

import '../../../data/repo/show_repo.dart';

part 'episodes_season_state.dart';

class EpisodesSeasonCubit extends Cubit<EpisodesSeasonState> {
  EpisodesSeasonCubit(this.showRepo) : super(EpisodesSeasonInitial());

  final ShowRepo showRepo;

  Future getShowEpsodes({required int id, required seasonNumber}) async {
    emit(EpisodesSeasonLouding());
    var data =
        await showRepo.fetchShowEpisodes(id: id, seasonNumbers: seasonNumber);
    data.fold((failer) {
      emit(EpisodesSeasonFailure(errMessage: failer.errMessage));
    }, (showMovies) {
      emit(EpisodesSeasonSuccess(episodesModel: showMovies));
    });
  }
}
