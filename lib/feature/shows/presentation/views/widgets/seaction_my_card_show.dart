import 'dart:async';

import 'package:flutter/material.dart';
import 'package:moviesapp/feature/movies/presentation/views/widgets/dots_indicatior_page.dart';
import 'package:moviesapp/feature/shows/presentation/views/widgets/my_card_page_view_show.dart';
import 'package:moviesapp/feature/shows/presentation/views/widgets/show_view_body.dart';

class SectionMyCardShow extends StatefulWidget {
  const SectionMyCardShow({super.key});

  @override
  State<SectionMyCardShow> createState() => _SectionMyCardShowState();
}

class _SectionMyCardShowState extends State<SectionMyCardShow> {
  int currentIndex = 0;
  late PageController pageController;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    pageController.addListener(() {
      currentIndex = pageController.page!.round();
      setState(() {});
    });

    // Initialize the timer to change the page every 2 seconds
    _timer = Timer.periodic(const Duration(seconds: 4), (Timer timer) {
      if (currentIndex < 4) {
        // Assuming there are 3 pages (index 0, 1, 2)
        currentIndex++;
      } else {
        currentIndex = 0; // Go back to the first page
      }

      pageController.animateToPage(
        currentIndex,
        duration: const Duration(milliseconds: 1000),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        MyCardPageViewShow(
          pageController: pageController,
        ),
        DotsIndicatorPage(
          currentIndex: currentIndex,
        ),
      ],
    );
  }
}
