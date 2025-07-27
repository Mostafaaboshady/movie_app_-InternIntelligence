import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesapp/core/utils/api_constant.dart';
import 'package:moviesapp/feature/shows/data/models/show_details_model.dart';
import 'package:moviesapp/feature/shows/presentation/views/widgets/episode_card_list_view.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_style.dart';
import '../../manage/episodes_season/episodes_season_cubit.dart';

class SeasonsShow extends StatefulWidget {
  const SeasonsShow({
    super.key,
    required this.season,
    required this.showDetailModel,
    required this.seasonNumber,
  });
  final Season season;
  final ShowDetailModel showDetailModel;
  final int seasonNumber;
  @override
  State<SeasonsShow> createState() => _SeasonsShowState();
}

class _SeasonsShowState extends State<SeasonsShow> {
  @override
  // void initState() {
  //   getEpisodes(context);
  //   super.initState();
  // }

  // void getEpisodes(BuildContext context) {
  //   BlocProvider.of<EpisodesSeasonCubit>(context).getShowEpsodes(
  //       id: widget.showDetailModel.id!,
  //       seasonNumber: widget.showDetailModel.seasons[0].seasonNumber);
  // }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    // log(widget.season.id.toString());
    log(widget.showDetailModel.id.toString());
    // log(widget.season.seasonNumber.toString());
    return Padding(
      padding: const EdgeInsets.only(bottom: 7),
      child: Container(
        width: screenWidth * 0.8,
        height: screenWidth * 0.4,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: AspectRatio(
                    aspectRatio: 2.5 / 4,
                    child: Image.network(
                      fit: BoxFit.fill,
                      widget.season.posterPath == null
                          ? kImageNetwork
                          : '${ApiConstants.basePosterUrl}${widget.season.posterPath}',
                    ),
                  )),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Season ${widget.season.seasonNumber}',
                    style: AppStyle.styleSemiBold20(context),
                  ),
                  Text(
                    'episodes ${widget.season.episodeCount}',
                    style: AppStyle.styleSemiBold18(context),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                      widget.season.airDate == null
                          ? 'no history'
                          : '${widget.season.airDate!.year}-${widget.season.airDate!.month}-${widget.season.airDate!.day}',
                      style: AppStyle.styleSemiBold18(context)),
                  // Text('${}', style: AppStyle.styleSemiBold18(context)),
                ],
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                BlocProvider.of<EpisodesSeasonCubit>(context).getShowEpsodes(
                    id: widget.showDetailModel.id!,
                    seasonNumber: widget.seasonNumber);
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Episode',
                            style: AppStyle.styleSemiBold24(context),
                          ),
                          const Expanded(child: EpisodeCardListView()),
                        ],
                      ); // Avoid recursion or replace with content
                    });
              },
              heroTag: null,
              child: const Icon(
                Icons.keyboard_arrow_right_rounded,
                size: 35,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
