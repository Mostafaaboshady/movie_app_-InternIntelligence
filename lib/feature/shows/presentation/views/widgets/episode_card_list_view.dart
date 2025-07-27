import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesapp/constants.dart';
import 'package:moviesapp/core/widgets/louding_indicator.dart';
import 'package:moviesapp/core/widgets/movies_failure_wigets.dart';
import 'package:moviesapp/feature/shows/presentation/manage/episodes_season/episodes_season_cubit.dart';
import 'package:moviesapp/feature/shows/presentation/views/widgets/episode_card.dart';
import 'package:moviesapp/feature/shows/presentation/views/widgets/episode_card_buttom.dart';

import '../../../../../core/utils/app_style.dart';

class EpisodeCardListView extends StatelessWidget {
  const EpisodeCardListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EpisodesSeasonCubit, EpisodesSeasonState>(
      builder: (context, state) {
        if (state is EpisodesSeasonSuccess) {
          return ListView.builder(
              itemCount: state.episodesModel.episodes.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                    top: 7,
                  ),
                  child: EpisodeCardButtom(
                    episode: state.episodesModel.episodes[index],
                    episodesModel: state.episodesModel,
                  ),
                );
              });
        } else if (state is EpisodesSeasonFailure) {
          return MoviesFailureWigets(errMessage: state.errMessage);
        } else {
          return const LoudingIndicatorWidget();
        }
      },
    );
  }
}
