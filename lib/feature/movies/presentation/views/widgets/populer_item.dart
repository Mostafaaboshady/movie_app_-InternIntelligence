import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moviesapp/constants.dart';
import 'package:moviesapp/core/utils/app_router.dart';
import 'package:moviesapp/feature/movies/data/models/media.dart';
import 'package:moviesapp/feature/movies/presentation/views/movies_details_view.dart';

import '../../../../../core/utils/api_constant.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moviesapp/constants.dart';
import 'package:moviesapp/core/utils/app_router.dart';
import 'package:moviesapp/feature/movies/data/models/media.dart';
import '../../../../../core/utils/api_constant.dart';

class PopulerItem extends StatelessWidget {
  const PopulerItem({super.key, required this.media});
  final Media media;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            GoRouter.of(context)
                .push(AppRouter.kMoviesDetailsView, extra: media.id);
          },
          child: FittedBox(
            child: SizedBox(
              width: screenWidth * 0.25, // Dynamic width based on screen size
              child: AspectRatio(
                aspectRatio: 2.5 / 4, // Maintain consistent aspect ratio
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    media.posterPath == null
                        ? kImageNetwork
                        : '${ApiConstants.basePosterUrl}${media.posterPath}',
                    fit: BoxFit.cover, // Ensure the image fits properly
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8), // Add some spacing
        Flexible(
          child: SizedBox(
            width: screenWidth * 0.25, // Match width of the image
            child: AutoSizeText(
              media.title ?? '',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              minFontSize: 8, // Minimum font size to scale down to
            ),
          ),
        ),
      ],
    );
  }
}
