import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moviesapp/constants.dart';
import 'package:moviesapp/core/utils/app_router.dart';
import 'package:moviesapp/core/utils/app_style.dart';
import 'package:moviesapp/feature/movies/data/models/media.dart';
import 'package:moviesapp/feature/movies/presentation/views/movies_details_view.dart';
import 'package:moviesapp/feature/movies/presentation/views/widgets/populer_movies_view_details.dart';

class PopulerMoviesViewItem extends StatelessWidget {
  const PopulerMoviesViewItem({super.key, required this.media});
  final Media media;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final containerHeight = screenWidth * 0.5; // Adjust based on screen size

    return GestureDetector(
      onTap: () {
        GoRouter.of(context)
            .push(AppRouter.kMoviesDetailsView, extra: media.id);
      },
      child: Container(
        height: containerHeight,
        width: screenWidth,
        decoration: BoxDecoration(
          color: const Color(0xff293838),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: PopulerMoviesViewDetails(
            screenWidth: screenWidth,
            media: media,
          ),
        ),
      ),
    );
  }
}
