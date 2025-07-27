import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moviesapp/core/utils/api_constant.dart';
import 'package:moviesapp/feature/search/data/models/search_model.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_router.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({super.key, required this.searchModel});
  final SearchModel searchModel;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final imageWidth = screenWidth * 0.3;

    return GestureDetector(
      onTap: () {
        searchModel.mediaType == 'movie'
            ? GoRouter.of(context)
                .push(AppRouter.kMoviesDetailsView, extra: searchModel.id)
            : GoRouter.of(context)
                .push(AppRouter.kShowDetailView, extra: searchModel.id);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: imageWidth,
            child: AspectRatio(
              aspectRatio: 2.5 / 4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  searchModel.posterPath == null
                      ? kImageNetwork
                      : '${ApiConstants.basePosterUrl}${searchModel.posterPath}',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: imageWidth,
            child: Text(
              searchModel.title ?? '',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
