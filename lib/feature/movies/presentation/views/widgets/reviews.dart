import 'package:flutter/material.dart';
import 'package:moviesapp/constants.dart';
import 'package:moviesapp/feature/movies/data/models/movies_detail_model.dart';
import 'package:moviesapp/feature/movies/presentation/views/widgets/detail_reviews.dart';

class ReviewsDetails extends StatelessWidget {
  const ReviewsDetails({super.key, required this.reviews});
  final ReviewsResult reviews;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width * 0.8;
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Container(
        width: width,
        height: width * 0.8,
        decoration: BoxDecoration(
            color: kBackgroundContainer,
            borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: DetailReviews(
            reviewsResult: reviews,
          ),
        ),
      ),
    );
  }
}
