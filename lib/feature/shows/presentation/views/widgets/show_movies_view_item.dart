import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moviesapp/feature/shows/data/models/show_model.dart';
import 'package:moviesapp/feature/shows/presentation/views/widgets/show_movies_view_detail.dart';

import '../../../../../core/utils/app_router.dart';

class ShowMoviesViewItem extends StatelessWidget {
  const ShowMoviesViewItem({
    super.key,
    required this.showModel,
  });
  final ShowModel showModel;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final containerHeight = screenWidth * 0.5; // Adjust based on screen size

    return GestureDetector(
      onTap: () {
        GoRouter.of(context)
            .push(AppRouter.kShowDetailView, extra: showModel.id);
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
          child: ShowMoviesViewDetails(
            screenWidth: screenWidth,
            showModel: showModel,
          ),
        ),
      ),
    );
  }
}
