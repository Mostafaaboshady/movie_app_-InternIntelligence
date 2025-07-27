import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesapp/core/widgets/louding_indicator.dart';
import 'package:moviesapp/core/widgets/movies_failure_wigets.dart';
import 'package:moviesapp/feature/movies/presentation/manage/now_movies/now_movies_cubit.dart';
import 'package:moviesapp/feature/shows/presentation/manage/now_show/now_show_cubit.dart';
import 'package:moviesapp/feature/shows/presentation/views/widgets/my_card_show.dart';
import 'package:moviesapp/feature/shows/presentation/views/widgets/show_view_body.dart';

class MyCardPageViewShow extends StatelessWidget {
  const MyCardPageViewShow({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NowShowCubit, NowShowState>(
      builder: (context, state) {
        if (state is NowShowSuccess) {
          return ExpandablePageView.builder(
              controller: pageController,
              scrollDirection: Axis.horizontal,
              itemCount: state.showModel.length,
              itemBuilder: (context, index) {
                return MyCardShow(
                  showModel: state.showModel[index],
                );
              });
        } else if (state is NowShowFailuer) {
          return MoviesFailureWigets(errMessage: state.errMessage);
        } else {
          return const LoudingIndicatorWidget();
        }
      },
    );
  }
}
