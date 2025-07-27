import 'package:flutter/material.dart';
import 'package:moviesapp/feature/shows/presentation/views/widgets/show_view_body.dart';

import '../../../movies/presentation/views/widgets/buttom_navigation_bar.dart';

class ShowsView extends StatelessWidget {
  const ShowsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Expanded(child: ShowViewBody()),
          BottomNavigationBarWidget(),
        ],
      ),
    );
  }
}
