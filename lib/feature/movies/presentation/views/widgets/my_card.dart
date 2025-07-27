import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moviesapp/constants.dart';
import 'package:moviesapp/core/utils/api_constant.dart';
import 'package:moviesapp/core/utils/app_style.dart';
import 'package:moviesapp/feature/movies/data/models/media.dart';

import '../../../../../core/utils/app_router.dart';

class MyCard extends StatelessWidget {
  const MyCard({
    super.key,
    required this.media,
  });

  final Media media;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context)
            .push(AppRouter.kMoviesDetailsView, extra: media.id);
      },
      child: SizedBox(
        //  width: MediaQuery.sizeOf(context).width,

        child: AspectRatio(
          aspectRatio: MediaQuery.sizeOf(context).width / 350,
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        '${ApiConstants.basePosterUrl}${media.posterPath}'),
                    fit: BoxFit.fill)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(child: SizedBox()),
                Padding(
                  padding: const EdgeInsets.only(left: 24, bottom: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        media.title ?? '',
                        style: AppStyle.styleSemiBold24(context).copyWith(
                          color: const Color(0xffFFFFFF),
                        ),
                      ),
                      Text(
                        media.releaseDate ?? '',
                        style: AppStyle.styleRegular16(context).copyWith(
                            color: const Color(0xffFFFFFF).withOpacity(0.7),
                            fontSize: 12),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
