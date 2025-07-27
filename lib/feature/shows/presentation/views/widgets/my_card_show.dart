import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moviesapp/core/utils/api_constant.dart';
import 'package:moviesapp/feature/shows/data/models/show_model.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/app_style.dart';

class MyCardShow extends StatelessWidget {
  const MyCardShow({
    super.key,
    required this.showModel,
  });
  final ShowModel showModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context)
            .push(AppRouter.kShowDetailView, extra: showModel.id);
      },
      child: AspectRatio(
        aspectRatio: MediaQuery.sizeOf(context).width / 350,
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      '${ApiConstants.basePosterUrl}${showModel.posterPath}'),
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
                      showModel.name ?? '',
                      style: AppStyle.styleSemiBold24(context).copyWith(
                        color: const Color(0xffFFFFFF),
                      ),
                    ),
                    Text(
                      showModel.firstAirDate ?? '',
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
    );
  }
}
