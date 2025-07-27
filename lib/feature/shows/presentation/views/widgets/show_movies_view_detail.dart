import 'package:flutter/material.dart';
import 'package:moviesapp/feature/shows/data/models/show_model.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/api_constant.dart';
import '../../../../../core/utils/app_style.dart';

class ShowMoviesViewDetails extends StatelessWidget {
  const ShowMoviesViewDetails({
    super.key,
    required this.screenWidth,
    required this.showModel,
  });
  final ShowModel showModel;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: AspectRatio(
            aspectRatio: 4 / 7,
            child: Image.network(
              showModel.posterPath == null
                  ? kImageNetwork
                  : '${ApiConstants.basePosterUrl}${showModel.posterPath}',
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
                showModel.name ?? '',
                style: AppStyle.styleSemiBold20(context),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  Text(
                    showModel.firstAirDate ?? '',
                    style: AppStyle.styleRegular14(context),
                  ),
                  const SizedBox(width: 20),
                  const Icon(
                    Icons.favorite,
                    size: 15,
                    color: Colors.yellow,
                  ),
                  Text(
                    showModel.voteAverage == null
                        ? '0'
                        : showModel.voteAverage.toString(),
                    style: AppStyle.styleRegular14(context),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              SizedBox(
                width: screenWidth * 0.6,
                child: Text(
                  showModel.overview ?? '',
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
