import 'package:challenge/src/shared/utils/app_colors.dart';
import 'package:challenge/src/shared/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  Future<void> _loadSettings(context) async {
    Future.delayed(const Duration(seconds: 3), () {
      //navegação com provider e push and named
      Navigator.popAndPushNamed(context, '/login');
    });
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    _loadSettings(context);
    return Scaffold(
      backgroundColor: AppColors.deepPurple,
      body: Padding(
        padding: const EdgeInsets.all(120),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: AppColors.deepPurple,
          child: SvgPicture.asset(AppImages.appLogo),
        ),
      ),
    );
  }
}
