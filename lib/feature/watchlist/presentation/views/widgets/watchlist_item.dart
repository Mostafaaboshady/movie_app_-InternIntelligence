import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:moviesapp/core/utils/app_router.dart';
import 'package:moviesapp/feature/watchlist/data/models/watchlist_model.dart';
import 'package:moviesapp/feature/watchlist/presentation/manage/all_movies/all_movies_cubit.dart';
import 'package:moviesapp/feature/watchlist/presentation/views/widgets/watchlist_item_details.dart';

import '../../../../../constants.dart';

class WatchlistItem extends StatelessWidget {
  const WatchlistItem({super.key, required this.watchlistModel});
  final WatchlistModel watchlistModel;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width * 0.9;
    return Padding(
      padding: const EdgeInsets.only(right: 8, bottom: 8),
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context)
              .push(AppRouter.kMoviesDetailsView, extra: watchlistModel.id);
          log(' id store ${watchlistModel.id}');
        },
        child: Container(
          width: width,
          height: width * 0.6,
          decoration: BoxDecoration(
              color: kBackgroundContainer,
              borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: WatchlistItemDetails(
              watchlistModel: watchlistModel,
            ),
          ),
        ),
      ),
    );
  }
}
