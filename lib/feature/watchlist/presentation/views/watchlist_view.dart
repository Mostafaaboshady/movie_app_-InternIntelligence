import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesapp/feature/watchlist/presentation/manage/all_movies/all_movies_cubit.dart';
import 'package:moviesapp/feature/watchlist/presentation/views/widgets/watchlist_view_body.dart';

class WatchlistView extends StatelessWidget {
  const WatchlistView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Watchlist'),
      ),
      body: const WatchlistViewBody(),
    );
  }
}
