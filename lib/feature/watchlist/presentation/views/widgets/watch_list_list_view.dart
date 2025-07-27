import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:moviesapp/constants.dart';
import 'package:moviesapp/core/utils/app_style.dart';
import 'package:moviesapp/core/widgets/movies_failure_wigets.dart';
import 'package:moviesapp/feature/watchlist/presentation/manage/all_movies/all_movies_cubit.dart';
import 'package:moviesapp/feature/watchlist/presentation/manage/watchlist_cubit/watch_cubit.dart';
import 'package:moviesapp/feature/watchlist/presentation/views/widgets/watchlist_item.dart';

import '../../../data/models/watchlist_model.dart';

class WatchlistListView extends StatefulWidget {
  const WatchlistListView({super.key});

  @override
  State<WatchlistListView> createState() => _WatchlistListViewState();
}

class _WatchlistListViewState extends State<WatchlistListView> {
  @override
  void initState() {
    // BlocProvider.of<WatchCubit>(context).loadWatchlist();
    BlocProvider.of<AllMoviesCubit>(context).fetchAllMoviesStore();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width * 0.6;
    List<WatchlistModel> watch =
        BlocProvider.of<AllMoviesCubit>(context).watch ?? [];
    // var watchlist = Hive.box<WatchlistModel>(kBoxMovie).values.toList();
    return BlocBuilder<AllMoviesCubit, AllMoviesState>(
      builder: (context, state) {
        if (state is AllMoviesSuccess) {
          return ListView.builder(
            itemCount: watch.length,
            itemBuilder: (context, index) {
              return WatchlistItem(watchlistModel: watch[index]);
            },
          );
        } else if (state is AllMoviesFailure) {
          log(state.errMessage);
          return MoviesFailureWigets(errMessage: state.errMessage);
        } else {
          return Center(
              child: Text(
            'No watchlist found',
            style: AppStyle.styleSemiBold24(context),
          ));
        }
      },
    );
  }
}





// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:moviesapp/constants.dart';
// import 'package:moviesapp/core/utils/app_style.dart';
// import 'package:moviesapp/core/widgets/movies_failure_wigets.dart';
// import 'package:moviesapp/feature/watchlist/presentation/manage/watchlist_cubit/watch_cubit.dart';
// import 'package:moviesapp/feature/watchlist/presentation/views/widgets/watchlist_item.dart';

// import '../../../data/models/watchlist_model.dart';

// class WatchlistListView extends StatefulWidget {
//   const WatchlistListView({super.key});

//   @override
//   State<WatchlistListView> createState() => _WatchlistListViewState();
// }

// class _WatchlistListViewState extends State<WatchlistListView> {
//   @override
//   void initState() {
//     BlocProvider.of<WatchCubit>(context).loadWatchlist();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.sizeOf(context).width * 0.6;
//     var watchlist = Hive.box<WatchlistModel>(kBoxMovie).values.toList();
//     return BlocBuilder<WatchCubit, WatchState>(
//       builder: (context, state) {
//         if (state is WatchLouding) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (state is WatchSuccess) {
//           return ListView.builder(
//             itemCount: watchlist.length,
//             itemBuilder: (context, index) {
//               return WatchlistItem(watchlistModel: watchlist[index]);
//             },
//           );
//         } else if (state is WatchFailure) {
//           log(state.errMessage);
//           return MoviesFailureWigets(errMessage: state.errMessage);
//         } else {
//           return Center(
//               child: Text(
//             'No watchlist found',
//             style: AppStyle.styleSemiBold24(context),
//           ));
//         }
//       },
//     );
//   }
// }
