import 'package:blinqpay/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/bottom_nav.dart';

class SplashScreens extends StatefulWidget {
  const SplashScreens({super.key});

  @override
  State<SplashScreens> createState() => _SplashScreensState();
}

class _SplashScreensState extends State<SplashScreens> {
  bool visible = false;
  navigate() {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => BottomTab()));
    });
  }

  animateLogo() {
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        visible = true;
      });
    });
  }

  @override
  void initState() {
    animateLogo();
    navigate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryColor,
      body: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedPositioned(
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
              left: 0,
              right: 0,
              bottom: visible ? size.height / 2.2 : size.height / 2.7,
              child: Center(
                  child: Hero(
                      tag: "logo.svg",
                      child:
                          SvgPicture.asset("$assetPath/logo.svg", width: 64)))),
        ],
      ),
    );
  }
}
