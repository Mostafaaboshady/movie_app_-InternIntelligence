import 'package:flutter/material.dart';
import 'package:moviesapp/core/utils/api_constant.dart';
import 'package:moviesapp/feature/shows/data/models/show_details_model.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_style.dart';

class EpisodeCard extends StatelessWidget {
  const EpisodeCard({
    super.key,
    required this.lastEpisodeToAir,
  });
  final LastEpisodeToAir lastEpisodeToAir;
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
                    lastEpisodeToAir.stillPath == null
                        ? kImageNetwork
                        : '${ApiConstants.baseStillUrl}${lastEpisodeToAir.stillPath}',
                  ),
                )),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'episode ${lastEpisodeToAir.episodeNumber}',
                  style: AppStyle.styleSemiBold20(context),
                ),
                Text(
                  lastEpisodeToAir.name ?? '',
                  style: AppStyle.styleSemiBold18(context),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                    '${lastEpisodeToAir.airDate!.year}-${lastEpisodeToAir.airDate!.month}-${lastEpisodeToAir.airDate!.day}',
                    style: AppStyle.styleSemiBold18(context)),
                Text(
                    lastEpisodeToAir.runtime == null
                        ? '0m'
                        : '${lastEpisodeToAir.runtime}m',
                    style: AppStyle.styleSemiBold18(context)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
