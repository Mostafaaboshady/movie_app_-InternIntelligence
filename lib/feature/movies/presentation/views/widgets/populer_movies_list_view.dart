import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesapp/core/widgets/louding_indicator.dart';
import 'package:moviesapp/feature/movies/presentation/manage/populer_movies/populer_movies_cubit.dart';
import 'package:moviesapp/feature/movies/presentation/views/widgets/populer_item.dart';

import '../../../../../core/widgets/movies_failure_wigets.dart';

class PopulerMoviesListView extends StatelessWidget {
  const PopulerMoviesListView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<PopulerMoviesCubit, PopulerMoviesState>(
      builder: (context, state) {
        if (state is PopulerMoviesSuccess) {
          return SizedBox(
            height: screenWidth * 0.530,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.populerMovies.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: PopulerItem(
                      media: state.populerMovies[index],
                    ),
                  );
                }),
          );
        } else if (state is PopulerMoviesFailer) {
          return MoviesFailureWigets(errMessage: state.errMessage);
        } else {
          return const LoudingIndicatorWidget();
        }
      },
    );
  }
}
