import 'package:flutter/material.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesapp/core/widgets/louding_indicator.dart';
import 'package:moviesapp/core/widgets/movies_failure_wigets.dart';
import 'package:moviesapp/feature/movies/presentation/manage/now_movies/now_movies_cubit.dart';
import 'package:moviesapp/feature/movies/presentation/views/widgets/my_card.dart';

class MyCardPageView extends StatelessWidget {
  const MyCardPageView({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NowMoviesCubit, NowMoviesState>(
      builder: (context, state) {
        if (state is NowMoviesSuccses) {
          return ExpandablePageView.builder(
              controller: pageController,
              scrollDirection: Axis.horizontal,
              itemCount: state.moviesNow.length,
              itemBuilder: (context, index) {
                return MyCard(
                  media: state.moviesNow[index],
                );
              });
        } else if (state is NowMoviesfailure) {
          return MoviesFailureWigets(errMessage: state.errMessage);
        } else {
          return const LoudingIndicatorWidget();
        }
      },
    );
  }
}
