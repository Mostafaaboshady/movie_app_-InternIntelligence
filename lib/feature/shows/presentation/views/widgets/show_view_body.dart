import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:moviesapp/feature/shows/presentation/views/widgets/seaction_my_card_show.dart';
import 'package:moviesapp/feature/shows/presentation/views/widgets/show_movies_list_view.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../../movies/presentation/views/widgets/buttom_navigation_bar.dart';

class ShowViewBody extends StatelessWidget {
  const ShowViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return ListView(
      physics: const BouncingScrollPhysics(),
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionMyCardShow(),
        const SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
          child: Row(
            children: [
              Text(
                'ShowTV Movies',
                style: AppStyle.styleSemiBold20(context),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kShowMoviesView);
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
        const ShowMoviesListView(),
        const SizedBox(height: 20),
      ],
    );
  }
}
