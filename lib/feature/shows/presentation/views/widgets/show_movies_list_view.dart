import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesapp/core/widgets/louding_indicator.dart';
import 'package:moviesapp/core/widgets/movies_failure_wigets.dart';
import 'package:moviesapp/feature/shows/presentation/manage/show_popular/showtv_popular_cubit.dart';
import 'package:moviesapp/feature/shows/presentation/views/widgets/show_item.dart';

class ShowMoviesListView extends StatelessWidget {
  const ShowMoviesListView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return BlocBuilder<ShowtvPopularCubit, ShowtvPopularState>(
      builder: (context, state) {
        if (state is ShowtvPopularSuccess) {
          return SizedBox(
            height: screenWidth * 0.530,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.showModel.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: ShowItem(
                      showModel: state.showModel[index],
                    ),
                  );
                }),
          );
        } else if (state is ShowtvPopularFailuer) {
          return MoviesFailureWigets(errMessage: state.errMessage);
        } else {
          return const LoudingIndicatorWidget();
        }
      },
    );
  }
}
