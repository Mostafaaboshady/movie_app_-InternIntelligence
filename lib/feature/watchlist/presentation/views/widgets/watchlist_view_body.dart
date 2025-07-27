import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesapp/constants.dart';
import 'package:moviesapp/feature/movies/presentation/views/widgets/buttom_navigation_bar.dart';
import 'package:moviesapp/feature/watchlist/presentation/manage/all_movies/all_movies_cubit.dart';
import 'package:moviesapp/feature/watchlist/presentation/manage/watchlist_cubit/watch_cubit.dart';
import 'package:moviesapp/feature/watchlist/presentation/views/widgets/watch_list_list_view.dart';

import '../../../../../core/utils/app_style.dart';

class WatchlistViewBody extends StatelessWidget {
  const WatchlistViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Expanded(child: WatchlistListView()),
        BottomNavigationBarWidget()
      ],
    );
  }
}
