import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppEmptyState extends StatelessWidget {
  const AppEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/empty-list-light.png', height: 0.8.sw),
        const Text('Oops! Nothing to see here', textAlign: TextAlign.center),
        20.verticalSpace,
      ],
    );
  }
}
