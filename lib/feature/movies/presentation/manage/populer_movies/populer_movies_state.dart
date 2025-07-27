part of 'populer_movies_cubit.dart';

sealed class PopulerMoviesState extends Equatable {
  const PopulerMoviesState();

  @override
  List<Object> get props => [];
}

final class PopulerMoviesInitial extends PopulerMoviesState {}

final class PopulerMoviesLouding extends PopulerMoviesState {}

final class PopulerMoviesSuccess extends PopulerMoviesState {
  final List<Media> populerMovies;

  const PopulerMoviesSuccess({required this.populerMovies});
}

final class PopulerMoviesFailer extends PopulerMoviesState {
  final String errMessage;

  const PopulerMoviesFailer({required this.errMessage});
}
