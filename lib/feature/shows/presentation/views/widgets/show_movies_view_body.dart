import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesapp/core/widgets/louding_indicator.dart';
import 'package:moviesapp/core/widgets/movies_failure_wigets.dart';
import 'package:moviesapp/feature/shows/presentation/manage/show_popular/showtv_popular_cubit.dart';
import 'package:moviesapp/feature/shows/presentation/views/widgets/show_movies_view_item.dart';

class ShowMoviesViewBody extends StatelessWidget {
  const ShowMoviesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowtvPopularCubit, ShowtvPopularState>(
      builder: (context, state) {
        if (state is ShowtvPopularSuccess) {
          return ListView.builder(
              itemCount: state.showModel.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.only(left: 12, right: 12, bottom: 12),
                  child: ShowMoviesViewItem(
                    showModel: state.showModel[index],
                  ),
                );
              });
        } else if (state is ShowtvPopularFailuer) {
          return MoviesFailureWigets(errMessage: state.errMessage);
        } else {
          return const LoudingIndicatorWidget();
        }
      },
    );
  }
}
