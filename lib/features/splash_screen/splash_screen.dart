import 'package:flutter/material.dart';
import 'package:blackmarket/core/routes/routes.dart';
import 'package:blackmarket/core/themes/app_color.dart';
import 'package:blackmarket/core/helper/extensions.dart';
import 'package:blackmarket/core/constant/app_image_assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        context.pushNamed(Routes.loginScreen);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsManger.mainColor,
        body: Center(child: Image.asset(AppImageAsset.splashScreen)));
  }
}
