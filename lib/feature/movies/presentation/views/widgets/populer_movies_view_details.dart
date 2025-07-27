import 'package:flutter/material.dart';
import 'package:moviesapp/constants.dart';
import 'package:moviesapp/feature/movies/data/models/media.dart';
import '../../../../../core/utils/api_constant.dart';
import '../../../../../core/utils/app_style.dart';

class PopulerMoviesViewDetails extends StatelessWidget {
  const PopulerMoviesViewDetails({
    super.key,
    required this.screenWidth,
    required this.media,
  });

  final double screenWidth;
  final Media media;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: AspectRatio(
            aspectRatio: 4 / 7,
            child: Image.network(
              '${ApiConstants.basePosterUrl}${media.posterPath}',
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                media.title ?? '',
                style: AppStyle.styleSemiBold20(context),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  Text(
                    media.releaseDate ?? '',
                    style: AppStyle.styleRegular14(context),
                  ),
                  const SizedBox(width: 20),
                  const Icon(
                    Icons.favorite,
                    size: 15,
                    color: Colors.yellow,
                  ),
                  Text(
                    media.voteAverage.toString(),
                    style: AppStyle.styleRegular14(context),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              SizedBox(
                width: screenWidth * 0.6,
                child: Text(
                  media.overview.toString(),
                  style: AppStyle.styleRegular14(context),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
