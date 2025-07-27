import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:moviesapp/feature/watchlist/data/models/watchlist_model.dart';

import '../../../../../constants.dart';

part 'all_movies_state.dart';

class AllMoviesCubit extends Cubit<AllMoviesState> {
  AllMoviesCubit() : super(AllMoviesInitial());
  List<WatchlistModel>? watch;
  fetchAllMoviesStore() {
    try {
      var boxMovies = Hive.box<WatchlistModel>(kBoxMovie);
      watch = boxMovies.values.toList();
      emit(AllMoviesSuccess());
    } catch (e) {
      emit(AllMoviesFailure(errMessage: e.toString()));
    }
  }

  void deleteMovie(WatchlistModel movie) async {
    try {
      var boxMovies = Hive.box<WatchlistModel>(kBoxMovie);
      await boxMovies.delete(movie.key); // Ensure you're deleting by key
      fetchAllMoviesStore(); // Refresh the list after deletion
    } catch (e) {
      emit(AllMoviesFailure(errMessage: e.toString()));
    }
  }
}
