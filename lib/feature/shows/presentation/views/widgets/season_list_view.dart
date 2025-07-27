import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesapp/core/utils/setup_locator.dart';
import 'package:moviesapp/feature/shows/data/models/show_details_model.dart';
import 'package:moviesapp/feature/shows/data/repo/show_repo_impl.dart';
import 'package:moviesapp/feature/shows/presentation/manage/episodes_season/episodes_season_cubit.dart';
import 'package:moviesapp/feature/shows/presentation/views/widgets/season.dart';

class SeasonsListView extends StatelessWidget {
  const SeasonsListView({
    super.key,
    required this.showDetailModel,
  });
  final ShowDetailModel showDetailModel;
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
        itemCount: showDetailModel.seasons.length,
        itemBuilder: (context, index) {
          return SeasonsShow(
            season: showDetailModel.seasons[index],
            showDetailModel: showDetailModel,
            seasonNumber: showDetailModel.seasons[index].seasonNumber!,
          );
        });
  }
}
