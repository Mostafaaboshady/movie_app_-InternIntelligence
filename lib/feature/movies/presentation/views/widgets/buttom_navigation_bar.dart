import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  // int _selectedIndex = 0;

  int _getSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).matchedLocation;

    if (location.startsWith(AppRouter.kHomeView)) {
      return 0;
    }
    if (location.startsWith(AppRouter.kShowsView)) {
      return 1;
    }
    if (location.startsWith(AppRouter.kSearchView)) {
      return 2;
    }
    if (location.startsWith(AppRouter.kWatchlistView)) {
      return 3;
    }
    if (location.startsWith(AppRouter.kShowMoviesView)) {
      return 1;
    }
    if (location.startsWith(AppRouter.kShowDetailView)) {
      return 1;
    }
    return 0;
  }

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        GoRouter.of(context).go(AppRouter.kHomeView);
        break;
      // Navigate to Movies

      case 1:
        GoRouter.of(context).go(AppRouter.kShowsView); // Navigate to Shows
        break;
      case 2:
        GoRouter.of(context).go(AppRouter.kSearchView);
        // log(_selectedIndex.toString()); // Navigate to Search
        break;
      case 3:
        // log(index);
        GoRouter.of(context)
            .go(AppRouter.kWatchlistView); // Navigate to Watchlist
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    // log(_selectedIndex.toString());
    return BottomNavigationBar(
      currentIndex: _getSelectedIndex(context),
      onTap: _onItemTapped, // Handles tap logic
      backgroundColor: Colors.white.withOpacity(.3),
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.movie),
          label: 'Movies',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.show_chart_sharp),
          label: 'Shows',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.storage),
          label: 'My list',
        ),
      ],
    );
  }
}
