import 'package:flutter/material.dart';
import 'package:moviesapp/core/utils/api_constant.dart';
import 'package:moviesapp/feature/movies/data/models/movies_detail_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/utils/app_style.dart';

class DetailsMovies extends StatelessWidget {
  const DetailsMovies({
    super.key,
    required this.moviesDetailModel,
  });
  final MoviesDetailModel moviesDetailModel;
  @override
  Widget build(BuildContext context) {
    var time = moviesDetailModel.runtime! / 60;

    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            moviesDetailModel.title ?? '',
            style: AppStyle.styleSemiBold24(context),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        moviesDetailModel.releaseDate!.year.toString(),
                        style: AppStyle.styleSemiBold18(context),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Text(
                        moviesDetailModel.genres[0].name
                            .toString(), // This will get the date part
                        style: AppStyle.styleSemiBold18(context),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Text(
                        moviesDetailModel.runtime.toString(),
                        style: AppStyle.styleSemiBold18(context),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Text(
                        moviesDetailModel.voteAverage.toString(),
                        style: AppStyle.styleSemiBold20(context),
                      ),
                      Text(' (${moviesDetailModel.voteCount})',
                          style: AppStyle.styleSemiBold18(context)),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              GestureDetector(
                onTap: () async {
                  Uri uri = Uri.parse(
                      '${ApiConstants.baseVideoUrl}${moviesDetailModel.videos}');
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri);
                  }
                },
                child: Container(
                  width: 50, // Set desired size
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Colors.red, // Red background
                    shape: BoxShape.circle, // Circular shape
                  ),
                  child: const Icon(
                    Icons.play_arrow, // Play icon
                    color: Colors.white, // White color for the icon
                    size: 35, // Icon size
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
