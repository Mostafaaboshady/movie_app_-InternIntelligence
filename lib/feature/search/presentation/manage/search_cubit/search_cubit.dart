import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:moviesapp/feature/search/data/models/search_model.dart';
import 'package:moviesapp/feature/search/data/repo/search_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
  final SearchRepo searchRepo;
  Future getSearchMovie({required String title}) async {
    emit(SearchLouding());
    var data = await searchRepo.fetchMoviesSearch(title: title);
    data.fold((failure) {
      emit(SearchFailure(errMessage: failure.errMessage));
    }, (success) {
      emit(SearchSuccess(searchModel: success));
    });
    final String Title = title;
  }
}
