part of 'now_movies_cubit.dart';

sealed class NowMoviesState extends Equatable {
  const NowMoviesState();

  @override
  List<Object> get props => [];
}

final class NowMoviesInitial extends NowMoviesState {}

final class NowMovieslouding extends NowMoviesState {}

final class NowMoviesSuccses extends NowMoviesState {
  final List<Media> moviesNow;

  const NowMoviesSuccses({required this.moviesNow});
}

final class NowMoviesfailure extends NowMoviesState {
  final String errMessage;

  const NowMoviesfailure({required this.errMessage});
}
