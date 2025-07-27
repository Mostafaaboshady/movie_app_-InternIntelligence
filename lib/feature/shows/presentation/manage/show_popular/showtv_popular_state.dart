part of 'showtv_popular_cubit.dart';

sealed class ShowtvPopularState extends Equatable {
  const ShowtvPopularState();

  @override
  List<Object> get props => [];
}

final class ShowtvPopularInitial extends ShowtvPopularState {}

final class ShowtvPopularLouding extends ShowtvPopularState {}

final class ShowtvPopularSuccess extends ShowtvPopularState {
  final List<ShowModel> showModel;

  const ShowtvPopularSuccess({required this.showModel});
}

final class ShowtvPopularFailuer extends ShowtvPopularState {
  final String errMessage;

  const ShowtvPopularFailuer({required this.errMessage});
}
