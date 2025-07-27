import 'package:flutter/material.dart';
import 'package:moviesapp/feature/movies/data/models/movies_detail_model.dart';
import 'package:moviesapp/feature/movies/presentation/views/widgets/reviews.dart';

class ReviewsListView extends StatelessWidget {
  const ReviewsListView({super.key, required this.moviesDetailModel});
  final MoviesDetailModel moviesDetailModel;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width * 0.6;
    return SizedBox(
      height: width * 0.8,
      child: ListView.builder(
          itemCount: moviesDetailModel.reviews?.results.length == null
              ? 10
              : moviesDetailModel.reviews!.results.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return ReviewsDetails(
              reviews: moviesDetailModel.reviews!.results[index],
            );
          }),
    );
  }
}
