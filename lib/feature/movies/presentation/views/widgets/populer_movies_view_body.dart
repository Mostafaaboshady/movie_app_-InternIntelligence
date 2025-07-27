import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesapp/constants.dart';
import 'package:moviesapp/feature/movies/presentation/views/widgets/populer_movies_view_item.dart';

import '../../../../../core/widgets/louding_indicator.dart';
import '../../../../../core/widgets/movies_failure_wigets.dart';
import '../../manage/populer_movies/populer_movies_cubit.dart';

class PopulerMoviesViewBody extends StatelessWidget {
  const PopulerMoviesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopulerMoviesCubit, PopulerMoviesState>(
      builder: (context, state) {
        if (state is PopulerMoviesSuccess) {
          return ListView.builder(
              itemCount: state.populerMovies.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.only(left: 12, right: 12, bottom: 12),
                  child: PopulerMoviesViewItem(
                    media: state.populerMovies[index],
                  ),
                );
              });
        } else if (state is PopulerMoviesFailer) {
          return MoviesFailureWigets(errMessage: state.errMessage);
        } else {
          return const LoudingIndicatorWidget();
        }
      },
    );
  }
}
