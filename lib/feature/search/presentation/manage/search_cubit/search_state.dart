part of 'search_cubit.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}

final class SearchLouding extends SearchState {}

final class SearchFailure extends SearchState {
  final String errMessage;

  const SearchFailure({required this.errMessage});
}

final class SearchSuccess extends SearchState {
  final List<SearchModel> searchModel;

  const SearchSuccess({required this.searchModel});
}
