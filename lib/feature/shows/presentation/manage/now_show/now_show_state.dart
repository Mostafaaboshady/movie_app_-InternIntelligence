part of 'now_show_cubit.dart';

sealed class NowShowState extends Equatable {
  const NowShowState();

  @override
  List<Object> get props => [];
}

final class NowShowInitial extends NowShowState {}

final class NowShowlouding extends NowShowState {}

final class NowShowSuccess extends NowShowState {
  final List<ShowModel> showModel;

  const NowShowSuccess({required this.showModel});
}

final class NowShowFailuer extends NowShowState {
  final String errMessage;

  const NowShowFailuer({required this.errMessage});
}
