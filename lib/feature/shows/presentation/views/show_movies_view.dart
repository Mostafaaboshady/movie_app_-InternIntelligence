import 'package:flutter/material.dart';
import 'package:moviesapp/feature/movies/presentation/views/widgets/buttom_navigation_bar.dart';
import 'package:moviesapp/feature/shows/presentation/views/widgets/show_movies_view_body.dart';

class ShowMoviesView extends StatelessWidget {
  const ShowMoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'ShowTV View',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(child: ShowMoviesViewBody()),
            BottomNavigationBarWidget(),
          ],
        ));
  }
}
