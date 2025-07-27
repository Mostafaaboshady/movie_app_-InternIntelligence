import 'package:flutter/material.dart';
import 'package:moviesapp/feature/movies/data/models/movies_detail_model.dart';
import 'package:moviesapp/feature/movies/presentation/manage/movies_detail/movies_detail_cubit.dart';
import 'package:moviesapp/feature/movies/presentation/views/widgets/cast_movies.dart';

class CastMoviesListView extends StatelessWidget {
  const CastMoviesListView({
    super.key,
    required this.moviesDetailModel,
  });
  final MoviesDetailModel moviesDetailModel;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    return SizedBox(
      height: screenWidth * 0.530,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: moviesDetailModel.credits!.cast.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 12),
              child: CastMovies(
                cast: moviesDetailModel.credits!.cast[index],
              ),
            );
          }),
    );
  }
}
