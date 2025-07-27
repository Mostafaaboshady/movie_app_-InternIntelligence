part of 'show_details_cubit.dart';

sealed class ShowDetailsState extends Equatable {
  const ShowDetailsState();

  @override
  List<Object> get props => [];
}

final class ShowDetailsInitial extends ShowDetailsState {}

final class ShowDetailsLouding extends ShowDetailsState {}

final class ShowDetailsSuccess extends ShowDetailsState {
  final ShowDetailModel showDetailModel;

  const ShowDetailsSuccess({required this.showDetailModel});
}

final class ShowDetailsFailure extends ShowDetailsState {
  final String errMessage;

  const ShowDetailsFailure({required this.errMessage});
}
