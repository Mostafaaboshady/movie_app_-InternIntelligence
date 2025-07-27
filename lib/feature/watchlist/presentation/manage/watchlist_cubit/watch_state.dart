part of 'watch_cubit.dart';

sealed class WatchState extends Equatable {
  const WatchState();

  @override
  List<Object> get props => [];
}

final class WatchInitial extends WatchState {}

final class WatchLouding extends WatchState {}

final class WatchSuccess extends WatchState {
  final List<WatchlistModel> watchlistModel;

  const WatchSuccess({required this.watchlistModel});
}

final class WatchFailure extends WatchState {
  final String errMessage;

  const WatchFailure({required this.errMessage});
}
