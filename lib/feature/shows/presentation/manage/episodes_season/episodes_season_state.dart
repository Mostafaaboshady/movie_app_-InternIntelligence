part of 'episodes_season_cubit.dart';

sealed class EpisodesSeasonState extends Equatable {
  const EpisodesSeasonState();

  @override
  List<Object> get props => [];
}

final class EpisodesSeasonInitial extends EpisodesSeasonState {}

final class EpisodesSeasonLouding extends EpisodesSeasonState {}

final class EpisodesSeasonSuccess extends EpisodesSeasonState {
  final EpisodesModel episodesModel;

  const EpisodesSeasonSuccess({required this.episodesModel});
}

final class EpisodesSeasonFailure extends EpisodesSeasonState {
  final String errMessage;

  const EpisodesSeasonFailure({required this.errMessage});
}
