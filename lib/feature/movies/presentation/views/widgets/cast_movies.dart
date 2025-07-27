import 'package:flutter/material.dart';
import 'package:moviesapp/constants.dart';
import 'package:moviesapp/core/utils/api_constant.dart';
import 'package:moviesapp/feature/movies/data/models/movies_detail_model.dart';

import '../../../../../core/utils/app_style.dart';

class CastMovies extends StatelessWidget {
  const CastMovies({super.key, required this.cast});
  final Cast cast;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: screenWidth * 0.25, // Dynamic width based on screen size
          child: AspectRatio(
            aspectRatio: 2.5 / 4, // Maintain consistent aspect ratio
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                cast.profilePath == null
                    ? kImageNetwork
                    : '${ApiConstants.baseProfileUrl}${cast.profilePath}',

                fit: BoxFit.cover, // Ensure the image fits properly
              ),
            ),
          ),
        ),
        const SizedBox(height: 8), // Add some spacing
        SizedBox(
          width: screenWidth * 0.25, // Match width of the image
          child: Text(
            cast.name ?? '',
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 12), // Optional: Adjust font size
          ),
        ),
      ],
    );
  }
}
