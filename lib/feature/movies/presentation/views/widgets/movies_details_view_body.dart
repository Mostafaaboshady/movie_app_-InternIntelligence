import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:moviesapp/constants.dart';
import 'package:moviesapp/core/utils/app_style.dart';
import 'package:moviesapp/core/widgets/louding_indicator.dart';
import 'package:moviesapp/core/widgets/movies_failure_wigets.dart';
import 'package:moviesapp/feature/movies/data/models/movies_detail_model.dart';
import 'package:moviesapp/feature/movies/presentation/manage/movies_detail/movies_detail_cubit.dart';
import 'package:moviesapp/feature/movies/presentation/views/widgets/buttom_navigation_bar.dart';

import 'package:moviesapp/feature/movies/presentation/views/widgets/cast_movies_list_view.dart';
import 'package:moviesapp/feature/movies/presentation/views/widgets/details_movies.dart';
import 'package:moviesapp/feature/movies/presentation/views/widgets/header_movies_details.dart';

import 'package:moviesapp/feature/movies/presentation/views/widgets/reviews_list_view.dart';
import 'package:moviesapp/feature/movies/presentation/views/widgets/similar_moviews_list_view.dart';
import 'package:moviesapp/feature/watchlist/presentation/manage/watchlist_cubit/watch_cubit.dart';

import '../../../../../core/utils/api_constant.dart';

class MoviesDetailsViewBody extends StatelessWidget {
  const MoviesDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;

    return BlocBuilder<MoviesDetailCubit, MoviesDetailState>(
      builder: (context, state) {
        if (state is MoviesDetailSuccess) {
          return CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: SafeArea(
                  child: Container(
                    width: width,
                    height: width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            '${ApiConstants.basePosterUrl}${state.moviesDetailModel.posterPath}'),
                        fit: BoxFit.fill,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.8), // Shadow color
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
                        HeaderMoviesDetails(
                          moviesDetailModel: state.moviesDetailModel,
                        ),
                        const Expanded(child: SizedBox()),
                        DetailsMovies(
                          moviesDetailModel: state.moviesDetailModel,
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
                    state.moviesDetailModel.overview ?? '',
                    style: AppStyle.styleSemiBold18(context),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Text(
                    'Cast',
                    style: AppStyle.styleSemiBold24(context),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: CastMoviesListView(
                  moviesDetailModel: state.moviesDetailModel,
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Text(
                    'Reviews',
                    style: AppStyle.styleSemiBold24(context),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                  child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: ReviewsListView(
                  moviesDetailModel: state.moviesDetailModel,
                ),
              )),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Text(
                    'Similar',
                    style: AppStyle.styleSemiBold24(context),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                  child: Padding(
                padding: EdgeInsets.only(left: 7),
                child: SimilarMoviesListView(
                  moviesDetailModel: state.moviesDetailModel,
                ),
              )),
              const SliverToBoxAdapter(child: BottomNavigationBarWidget())
            ],
          );
        } else if (state is MoviesDetailFailure) {
          return MoviesFailureWigets(errMessage: state.errMessage);
        } else {
          return const LoudingIndicatorWidget();
        }
      },
    );
  }
}
