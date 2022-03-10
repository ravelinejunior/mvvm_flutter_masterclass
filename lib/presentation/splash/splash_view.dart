import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:mvvm_flutter_masterclass/presentation/managers/color_manager.dart';
import 'package:mvvm_flutter_masterclass/presentation/managers/routes_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  _startDelay() async {
    await Future.delayed(const Duration(seconds: 2)).then((value) {
      _timer = Timer(const Duration(milliseconds: 500), _goToMainView);
    });
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: const Center(
        child: Image(
          image: AssetImage(
            'assets/images/splash_logo.png',
          ),
        ),
      ),
    );
  }

  _goToMainView() {
    Get.offAndToNamed(ConstantsRoutes.onBoardingRoute);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
