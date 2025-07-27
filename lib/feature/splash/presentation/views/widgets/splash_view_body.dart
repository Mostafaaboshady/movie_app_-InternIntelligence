import 'package:flame_splash_screen/flame_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moviesapp/core/utils/app_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlameSplashScreen(
        theme: FlameSplashTheme.dark,
        onFinish: (context) {
          GoRouter.of(context).go(AppRouter.kHomeView);
        },
      ),
    );
  }
}
