import 'package:flutter/material.dart';
import 'package:moviesapp/feature/movies/data/models/movies_detail_model.dart';
import 'package:moviesapp/feature/movies/presentation/views/widgets/similar.dart';

class SimilarMoviesListView extends StatelessWidget {
  const SimilarMoviesListView({super.key, required this.moviesDetailModel});
  final MoviesDetailModel moviesDetailModel;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    return SizedBox(
      height: screenWidth * 0.530,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: moviesDetailModel.similar?.results.length ?? 0,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(left: 12),
              child: SimilarDetails(
                similar: moviesDetailModel.similar!.results[index],
              ),
            );
          }),
    );
  }
}
