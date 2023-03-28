import 'package:flutter/material.dart';

class AppLoadingAsset extends StatelessWidget {
  const AppLoadingAsset({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 20,
      width: 20,
      child: CircularProgressIndicator(),
    );
  }
}
