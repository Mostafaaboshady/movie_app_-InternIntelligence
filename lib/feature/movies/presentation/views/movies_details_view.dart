import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesapp/core/utils/setup_locator.dart';
import 'package:moviesapp/feature/movies/data/repos/home_repo_impl.dart';
import 'package:moviesapp/feature/movies/presentation/manage/movies_detail/movies_detail_cubit.dart';
import 'package:moviesapp/feature/movies/presentation/manage/populer_movies/populer_movies_cubit.dart';
import 'package:moviesapp/feature/movies/presentation/views/widgets/movies_details_view_body.dart';

class MoviesDetailsView extends StatefulWidget {
  const MoviesDetailsView({super.key, required this.moviesId});
  final int moviesId;
  @override
  State<MoviesDetailsView> createState() => _MoviesDetailsViewState();
}

class _MoviesDetailsViewState extends State<MoviesDetailsView> {
  late int id;
  @override
  void initState() {
    id = widget.moviesId;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MoviesDetailCubit(getIt.get<HomeRepoImpl>())..getMoviesDetail(id: id),
      child: const Scaffold(
        body: MoviesDetailsViewBody(),
      ),
    );
  }
}
