import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moviesapp/constants.dart';
import 'package:moviesapp/core/utils/api_constant.dart';
import 'package:moviesapp/core/utils/app_router.dart';
import 'package:moviesapp/feature/movies/data/models/movies_detail_model.dart';

class SimilarDetails extends StatelessWidget {
  const SimilarDetails({super.key, required this.similar});
  final SimilarResult similar;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            GoRouter.of(context)
                .push(AppRouter.kMoviesDetailsView, extra: similar.id);
            log(similar.id.toString());
          },
          child: SizedBox(
            width: screenWidth * 0.25, // Dynamic width based on screen size
            child: AspectRatio(
              aspectRatio: 2.5 / 4, // Maintain consistent aspect ratio
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  similar.backdropPath == null
                      ? kImageNetwork
                      : '${ApiConstants.baseBackdropUrl}${similar.backdropPath}',
                  fit: BoxFit.cover, // Ensure the image fits properly
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8), // Add some spacing
        SizedBox(
          width: screenWidth * 0.25, // Match width of the image
          child: Text(
            similar.title ?? '',
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 12), // Optional: Adjust font size
          ),
        ),
      ],
    );
  }
}
