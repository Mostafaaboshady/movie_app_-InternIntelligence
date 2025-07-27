import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';
import 'package:moviesapp/constants.dart';
import 'package:moviesapp/feature/shows/data/models/show_details_model.dart';

import '../../../../../core/utils/api_constant.dart';
import '../../../../watchlist/data/models/watchlist_model.dart';
import '../../../../watchlist/presentation/manage/watchlist_cubit/watch_cubit.dart';

class HeaderShowsView extends StatefulWidget {
  const HeaderShowsView({
    super.key,
    required this.showDetailModel,
  });
  final ShowDetailModel showDetailModel;

  @override
  State<HeaderShowsView> createState() => _HeaderShowsViewState();
}

class _HeaderShowsViewState extends State<HeaderShowsView> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            color: Colors.black.withOpacity(.2),
            onPressed: () {
              Navigator.pop(context);
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
                title: widget.showDetailModel.name ?? '',
                overView: widget.showDetailModel.overview ?? '',
                year:
                    widget.showDetailModel.firstAirDate?.year.toString() ?? '',
                rate: (widget.showDetailModel.voteAverage ?? 0).toDouble(),
                image: widget.showDetailModel.posterPath == null
                    ? kImageNetwork
                    : '${ApiConstants.basePosterUrl}${widget.showDetailModel.posterPath}',
                id: widget.showDetailModel.id ?? 1);

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
                    content: Text('Movie added to watchlist!')),
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
