import 'package:clean_air/ui/common/app_strings.dart';
import 'package:clean_air/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AppLoadingAsset extends StatelessWidget {
  const AppLoadingAsset({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: screenWidth(context),
      child: Lottie.asset(kLoadingAsset, fit: BoxFit.contain),
    );
  }
}
