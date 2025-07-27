import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moviesapp/core/utils/api_constant.dart';
import 'package:moviesapp/core/utils/app_router.dart';
import 'package:moviesapp/feature/shows/data/models/show_model.dart';

import '../../../../../constants.dart';

class ShowItem extends StatelessWidget {
  const ShowItem({
    super.key,
    required this.showModel,
  });
  final ShowModel showModel;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            GoRouter.of(context)
                .push(AppRouter.kShowDetailView, extra: showModel.id);
          },
          child: SizedBox(
            width: screenWidth * 0.25, // Dynamic width based on screen size
            child: AspectRatio(
              aspectRatio: 2.5 / 4, // Maintain consistent aspect ratio
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  showModel.posterPath == null
                      ? kImageNetwork
                      : '${ApiConstants.basePosterUrl}${showModel.posterPath}',
                  fit: BoxFit.cover, // Ensure the image fits properly
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
              showModel.name ?? '',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              minFontSize: 5, // Minimum font size to scale down to
            ),
          ),
        ),
      ],
    );
  }
}
