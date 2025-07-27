import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:moviesapp/constants.dart';
import 'package:moviesapp/core/utils/app_router.dart';
import 'package:moviesapp/core/utils/app_style.dart';
import 'package:moviesapp/feature/movies/presentation/views/populer_movies_view.dart';
import 'package:moviesapp/feature/movies/presentation/views/widgets/buttom_navigation_bar.dart';
import 'package:moviesapp/feature/movies/presentation/views/widgets/populer_movies_list_view.dart';
import 'package:moviesapp/feature/movies/presentation/views/widgets/section_my_card.dart';

import '../../manage/populer_movies/populer_movies_cubit.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return ListView(
      physics: const BouncingScrollPhysics(),
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionMyCard(),
        const SizedBox(height: 20), // Fix here
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
          child: Row(
            children: [
              Text(
                'Populer Movies',
                style: AppStyle.styleSemiBold20(context),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kPopulerMoviesView);
                },
                child: Text(
                  'see all >',
                  style: AppStyle.styleRegular16(context),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        const PopulerMoviesListView(),
        const SizedBox(height: 20),
      ],
    );
  }
}
