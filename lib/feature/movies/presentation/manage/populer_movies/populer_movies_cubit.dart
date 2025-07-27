import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:moviesapp/feature/movies/data/models/media.dart';
import 'package:moviesapp/feature/movies/data/repos/home_repo.dart';

part 'populer_movies_state.dart';

class PopulerMoviesCubit extends Cubit<PopulerMoviesState> {
  PopulerMoviesCubit(this.homeRepo) : super(PopulerMoviesInitial());

  final HomeRepo homeRepo;

  Future getPopulerMovies() async {
    emit(PopulerMoviesLouding());
    var data = await homeRepo.fetchPopulerMovies();

    data.fold((failer) {
      emit(PopulerMoviesFailer(errMessage: failer.errMessage));
    }, (movies) {
      emit(PopulerMoviesSuccess(populerMovies: movies));
    });
  }
}
