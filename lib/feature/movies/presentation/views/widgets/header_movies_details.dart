import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:moviesapp/core/utils/api_constant.dart';
import 'package:moviesapp/core/utils/app_router.dart';
import 'package:moviesapp/feature/movies/data/models/movies_detail_model.dart';
import 'package:moviesapp/feature/watchlist/data/models/watchlist_model.dart';
import 'package:moviesapp/feature/watchlist/presentation/manage/all_movies/all_movies_cubit.dart';
import 'package:moviesapp/feature/watchlist/presentation/manage/watchlist_cubit/watch_cubit.dart';

import '../../../../../constants.dart';

class HeaderMoviesDetails extends StatefulWidget {
  const HeaderMoviesDetails({
    super.key,
    required this.moviesDetailModel,
  });
  final MoviesDetailModel moviesDetailModel;

  @override
  State<HeaderMoviesDetails> createState() => _HeaderMoviesDetailsState();
}

class _HeaderMoviesDetailsState extends State<HeaderMoviesDetails> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            color: Colors.black.withOpacity(.2),
            onPressed: () {
              Navigator.pop(context);
              // GoRouter.of(context).push(AppRouter.kHomeView);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        const Spacer(),
        IconButton(
          onPressed: () async {
            setState(() {
              isLoading = true;
            });

            WatchlistModel watchlistModel = WatchlistModel(
                title: widget.moviesDetailModel.title ?? '',
                overView: widget.moviesDetailModel.overview ?? '',
                year:
                    widget.moviesDetailModel.releaseDate?.year.toString() ?? '',
                rate: (widget.moviesDetailModel.voteAverage ?? 0).toDouble(),
                image: widget.moviesDetailModel.posterPath == null
                    ? kImageNetwork
                    : '${ApiConstants.basePosterUrl}${widget.moviesDetailModel.posterPath}',
                id: widget.moviesDetailModel.id ?? 1);

            var box = Hive.box<WatchlistModel>(kBoxMovie);
            try {
              await box.add(WatchlistModel(
                title: watchlistModel.title,
                overView: watchlistModel.overView,
                year: watchlistModel.year,
                rate: watchlistModel.rate,
                image: watchlistModel.image,
                id: watchlistModel.id,
              ));
              BlocProvider.of<WatchCubit>(context)
                  .addToWatchlist(watchlistModel);

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    duration: Duration(seconds: 1),
                    content: Text('Movie added to My list !')),
              );
            } finally {
              setState(() {
                isLoading = false;
              });
            }
          },
          icon: isLoading == false
              ? const Icon(
                  FontAwesomeIcons.bookmark,
                )
              : const Icon(
                  color: Colors.red,
                  FontAwesomeIcons.bookmark,
                ),
        ),
      ],
    );
  }
}
