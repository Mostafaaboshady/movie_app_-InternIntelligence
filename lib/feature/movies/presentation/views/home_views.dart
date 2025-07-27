import 'package:flutter/material.dart';
import 'package:moviesapp/feature/movies/presentation/views/widgets/buttom_navigation_bar.dart';
import 'package:moviesapp/feature/movies/presentation/views/widgets/home_view_body.dart';

class HomeViews extends StatelessWidget {
  const HomeViews({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Expanded(child: HomeViewBody()),
          BottomNavigationBarWidget(),
        ],
      ),
    );
  }
}
