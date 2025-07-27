import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:moviesapp/constants.dart';
import 'package:moviesapp/feature/watchlist/data/models/watchlist_model.dart';

part 'watch_state.dart';

class WatchCubit extends Cubit<WatchState> {
  WatchCubit() : super(WatchInitial());

  Future<void> loadWatchlist() async {
    emit(WatchLouding());
    try {
      var boxMovies = Hive.box<WatchlistModel>(kBoxMovie).values.toList();
      emit(WatchSuccess(watchlistModel: boxMovies));
    } catch (e) {
      emit(WatchFailure(errMessage: e.toString()));
    }
  }

  Future<void> addToWatchlist(WatchlistModel watch) async {
    try {
      var boxMovies = Hive.box<WatchlistModel>(kBoxMovie);

      loadWatchlist(); // Reload updated list
    } catch (e) {
      emit(WatchFailure(errMessage: e.toString()));
    }
  }
}
