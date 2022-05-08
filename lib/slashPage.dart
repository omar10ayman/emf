import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:emf/logo.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Slash extends StatelessWidget {
  const Slash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splashTransition: SplashTransition.scaleTransition,
        curve: Curves.elasticOut,
        pageTransitionType: PageTransitionType.leftToRight,
        backgroundColor: Color.fromARGB(255, 235, 234, 234),
        animationDuration: Duration(seconds: 2),
        splashIconSize: 120,
        duration: 700,
        splash: Image.asset("images/11.png"),
        nextScreen: const Logo());
  }
}
