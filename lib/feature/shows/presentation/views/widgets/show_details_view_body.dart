import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:moviesapp/core/utils/api_constant.dart';
import 'package:moviesapp/core/widgets/louding_indicator.dart';
import 'package:moviesapp/core/widgets/movies_failure_wigets.dart';
import 'package:moviesapp/feature/shows/presentation/manage/show_details_cubit/show_details_cubit.dart';
import 'package:moviesapp/feature/shows/presentation/views/widgets/episode_card.dart';
import 'package:moviesapp/feature/shows/presentation/views/widgets/header_show_view.dart';
import 'package:moviesapp/feature/shows/presentation/views/widgets/season_list_view.dart';
import 'package:moviesapp/feature/shows/presentation/views/widgets/show_details.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../../movies/presentation/views/widgets/buttom_navigation_bar.dart';

class ShowDetailsViewBody extends StatelessWidget {
  const ShowDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return BlocBuilder<ShowDetailsCubit, ShowDetailsState>(
      builder: (context, state) {
        if (state is ShowDetailsSuccess) {
          return Column(
            children: [
              Expanded(
                child: CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    SliverToBoxAdapter(
                      child: SafeArea(
                        child: Container(
                          width: width,
                          height: width,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(state
                                          .showDetailModel.posterPath ==
                                      null
                                  ? kImageNetwork
                                  : '${ApiConstants.basePosterUrl}${state.showDetailModel.posterPath}'),
                              fit: BoxFit.fill,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black
                                    .withOpacity(0.8), // Shadow color
                                spreadRadius: 0, // How wide the shadow spreads
                                blurRadius: 8, // Softness of the shadow
                                offset: const Offset(0,
                                    8), // Position of the shadow (horizontal, vertical)
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              HeaderShowsView(
                                showDetailModel: state.showDetailModel,
                              ),
                              const Expanded(child: SizedBox()),
                              ShowsDetails(
                                showDetailModel: state.showDetailModel,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        child: Text(
                          'Story',
                          style: AppStyle.styleSemiBold24(context),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          state.showDetailModel.overview.toString(),
                          style: AppStyle.styleSemiBold18(context),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        child: Text(
                          'The Last Episode On Air',
                          style: AppStyle.styleSemiBold24(context),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: EpisodeCard(
                        lastEpisodeToAir:
                            state.showDetailModel.lastEpisodeToAir!,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          'Seasons',
                          style: AppStyle.styleSemiBold24(context),
                        ),
                      ),
                    ),
                    SeasonsListView(
                      showDetailModel: state.showDetailModel,
                    ),
                  ],
                ),
              ),
              const BottomNavigationBarWidget()
            ],
          );
        } else if (state is ShowDetailsFailure) {
          return MoviesFailureWigets(errMessage: state.errMessage);
        } else {
          return const LoudingIndicatorWidget();
        }
      },
    );
  }
}
