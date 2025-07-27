import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:moviesapp/core/utils/app_router.dart';

import 'package:moviesapp/feature/watchlist/data/models/watchlist_model.dart';
import 'package:moviesapp/feature/watchlist/presentation/manage/all_movies/all_movies_cubit.dart';
import 'package:moviesapp/feature/watchlist/presentation/manage/watchlist_cubit/watch_cubit.dart';

import '../../../../../core/utils/app_style.dart';

class WatchlistItemDetails extends StatelessWidget {
  const WatchlistItemDetails({
    super.key,
    required this.watchlistModel,
  });
  final WatchlistModel watchlistModel;

  @override
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image section
          Flexible(
            flex: 3,
            child: AspectRatio(
              aspectRatio: 2.5 / 4, // Maintain consistent aspect ratio
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  watchlistModel.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),

          // Content section
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  watchlistModel.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: AppStyle.styleSemiBold24(context),
                ),
                const SizedBox(height: 8),

                // Year and rating row
                Row(
                  children: [
                    Text(watchlistModel.year),
                    const SizedBox(width: 16),
                    const Icon(Icons.star, color: Colors.amber, size: 20),
                    Text(watchlistModel.rate.toString()),
                  ],
                ),
                const SizedBox(height: 8),

                // Overview
                Text(
                  watchlistModel.overView,
                  style: AppStyle.styleSemiBold18(context),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          // Delete button
          IconButton(
            onPressed: () async {
              await watchlistModel.delete();
              BlocProvider.of<AllMoviesCubit>(context).fetchAllMoviesStore();
              GoRouter.of(context).push(AppRouter.kWatchlistView);
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  duration: Duration(seconds: 1),
                  content: Text('done deteted movies with success')));
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}
