import 'package:clean_login/app/modules/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage>
    with TickerProviderStateMixin {
  late AnimationController animation;
  late Animation<double> fadeInFadeOut;

  splashScreenPage() async {
    Future.delayed(Duration(seconds: 3))
        .whenComplete(() => Modular.to.pushNamed("/login"));
  }

  void initState() {
    super.initState();
    splashScreenPage();
    animationController();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: ThemeApp.appColor,
        child: FadeTransition(
          opacity: fadeInFadeOut,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/screen.png',
                height: 250,
              ),
              Text(
                "App code",
                style: GoogleFonts.raleway(
                  fontSize: 35,
                  textStyle: TextStyle(
                    color: Colors.white,
                    shadows: [
                      BoxShadow(color: Colors.black.withOpacity(0.5)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void animationController() {
    animation = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );
    fadeInFadeOut = Tween<double>(begin: 0.0, end: 1).animate(animation);

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animation.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animation.forward();
      }
    });
    animation.forward();
  }

  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }
}
