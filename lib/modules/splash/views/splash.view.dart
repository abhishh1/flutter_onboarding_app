import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import '../../../app/shared/colors.dart';
import '../../onboarding/views/show_onboarding.view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  void initiateCache() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const ShowOnboardingView();
      }));
    });
  }

  @override
  void initState() {
    // initiateCache();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KConstantColors.bgColor,
      body: Center(
          child: FadeIn(
        duration: const Duration(seconds: 3),
        child: SizedBox(
          height: 100,
          width: 100,
          child: Image.asset("assets/images/onboarding_3.png"),
        ),
      )),
    );
  }
}
