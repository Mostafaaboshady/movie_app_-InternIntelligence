import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:moviesapp/constants.dart';
import 'package:moviesapp/core/utils/api_constant.dart';
import 'package:moviesapp/feature/movies/data/models/movies_detail_model.dart';

import '../../../../../core/utils/app_style.dart';

class DetailReviews extends StatelessWidget {
  const DetailReviews({
    super.key,
    required this.reviewsResult,
  });
  final ReviewsResult reviewsResult;
  @override
  Widget build(BuildContext context) {
    double star = reviewsResult.authorDetails?.rating ?? 0;
    int begin = reviewsResult.createdAt?.day ?? 0;
    int end = reviewsResult.updatedAt?.day ?? 0;
    int result = (begin - end).abs();
    double star2 = star / 2;
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              minRadius: 20,
              maxRadius: 30,
              backgroundImage: NetworkImage(reviewsResult
                          .authorDetails?.avatarPath ==
                      null
                  ? kImageNetwork
                  : '${ApiConstants.baseAvatarUrl}${reviewsResult.authorDetails!.avatarPath}'),
            ),
            const SizedBox(
              width: 7,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  reviewsResult.author.toString(),
                  style: AppStyle.styleSemiBold20(context),
                ),
                Text(reviewsResult.authorDetails?.username.toString() ?? '',
                    style: AppStyle.styleSemiBold18(context)),
              ],
            ),
          ],
        ),
        Text(
          reviewsResult.content.toString(),
          style: AppStyle.styleSemiBold18(context),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(
          height: 7,
        ),
        Row(
          children: [
            RatingBar.builder(
              // ignoreGestures: true,
              tapOnlyMode: true,
              updateOnDrag: true,
              initialRating: star2,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 15,
              itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                // Handle rating update
              },
            ),
            const Spacer(),
            Text('${result} day', style: AppStyle.styleSemiBold18(context)),
          ],
        ),
      ],
    );
  }
}
