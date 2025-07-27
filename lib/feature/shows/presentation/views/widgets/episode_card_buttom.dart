import 'package:flutter/material.dart';
import 'package:moviesapp/core/utils/api_constant.dart';
import 'package:moviesapp/feature/shows/data/models/episodes_model.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_style.dart';

class EpisodeCardButtom extends StatelessWidget {
  const EpisodeCardButtom({
    super.key,
    required this.episode,
    required this.episodesModel,
  });
  final Episode episode;
  final EpisodesModel episodesModel;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    return Container(
      width: screenWidth * 0.8,
      height: screenWidth * 0.3,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: AspectRatio(
                  aspectRatio: 4 / 2.7,
                  child: Image.network(
                    fit: BoxFit.fill,
                    episode.stillPath == null
                        ? kImageNetwork
                        : '${ApiConstants.baseStillUrl}${episode.stillPath}',
                  ),
                )),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  episode.name ?? 'no no',
                  style: AppStyle.styleSemiBold20(context),
                ),
                Row(
                  children: [
                    Text(
                      episode.voteAverage.toString(),
                      style: AppStyle.styleSemiBold18(context),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                    )
                  ],
                ),
                Text(
                    episode.airDate == null
                        ? 'not history'
                        : '${episode.airDate!.year}-${episode.airDate!.month}-${episode.airDate!.day}',
                    style: AppStyle.styleSemiBold18(context)),
                Text(episode.runtime == null ? '0m' : '${episode.runtime}m',
                    style: AppStyle.styleSemiBold18(context)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
