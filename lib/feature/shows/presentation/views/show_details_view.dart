import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesapp/core/utils/setup_locator.dart';
import 'package:moviesapp/feature/shows/data/repo/show_repo_impl.dart';
import 'package:moviesapp/feature/shows/presentation/manage/show_details_cubit/show_details_cubit.dart';
import 'package:moviesapp/feature/shows/presentation/views/widgets/show_details_view_body.dart';

import '../manage/episodes_season/episodes_season_cubit.dart';

class ShowDetailsView extends StatefulWidget {
  const ShowDetailsView({super.key, required this.movieShowId});

  final int movieShowId;

  @override
  State<ShowDetailsView> createState() => _ShowDetailsViewState();
}

class _ShowDetailsViewState extends State<ShowDetailsView> {
  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ShowDetailsCubit(getIt.get<ShowRepoImpl>())
            ..getShowTvPopuler(tvShowId: widget.movieShowId),
        ),
      ],
      child: const Scaffold(
        body: ShowDetailsViewBody(),
      ),
    );
  }
}
