import 'package:flutter/material.dart';
import 'package:moviesapp/feature/movies/presentation/views/widgets/buttom_navigation_bar.dart';
import 'package:moviesapp/feature/movies/presentation/views/widgets/populer_movies_view_body.dart';

class PopulerMoviesView extends StatelessWidget {
  const PopulerMoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Populer View',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(child: PopulerMoviesViewBody()),
            BottomNavigationBarWidget(),
          ],
        ));
  }
}
