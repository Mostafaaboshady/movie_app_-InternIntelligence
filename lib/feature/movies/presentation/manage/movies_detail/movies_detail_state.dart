part of 'movies_detail_cubit.dart';

sealed class MoviesDetailState extends Equatable {
  const MoviesDetailState();

  @override
  List<Object> get props => [];
}

final class MoviesDetailInitial extends MoviesDetailState {}

final class MoviesDetaillouding extends MoviesDetailState {}

final class MoviesDetailSuccess extends MoviesDetailState {
  final MoviesDetailModel moviesDetailModel;

  const MoviesDetailSuccess({required this.moviesDetailModel});
}

final class MoviesDetailFailure extends MoviesDetailState {
  final String errMessage;

  const MoviesDetailFailure({required this.errMessage});
}
