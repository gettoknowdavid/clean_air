import 'package:clean_air/ui/common/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingPageModel extends StatelessWidget {
  final String title;
  final String body;
  final String asset;

  const OnboardingPageModel({
    Key? key,
    required this.title,
    required this.body,
    required this.asset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final isDark = theme.brightness == Brightness.dark;

    final imageContainerColor = isDark
        ? colorScheme.primary.withOpacity(0.2)
        : colorScheme.primaryContainer.withOpacity(0.6);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 1.sw,
          height: 0.65.sh,
          decoration: BoxDecoration(
            color: imageContainerColor,
            borderRadius: getBorderRadius(asset),
            image: DecorationImage(image: AssetImage(asset)),
          ),
        ),
        50.verticalSpace,
        Text(
          title,
          style: textTheme.headlineLarge?.copyWith(
            decoration: TextDecoration.underline,
            decorationThickness: 5.r,
            decorationColor: colorScheme.primary,
          ),
        ),
        10.verticalSpace,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0).r,
          child: Text(
            body,
            textAlign: TextAlign.center,
            style: textTheme.bodyLarge,
          ),
        ),
        const Spacer(),
      ],
    );
  }

  BorderRadius? getBorderRadius(String asset) {
    switch (asset) {
      case kOnboardingAsset1:
        return const BorderRadius.only(bottomLeft: Radius.circular(50)).r;
      case kOnboardingAsset3:
        return const BorderRadius.only(bottomRight: Radius.circular(50)).r;
      default:
        return null;
    }
  }
}
