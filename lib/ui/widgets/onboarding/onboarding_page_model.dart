import 'package:clean_air/ui/common/app_strings.dart';
import 'package:clean_air/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';

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

    final imageContainerColor =
        isDark ? colorScheme.primary.withOpacity(0.2) : colorScheme.primary;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: screenWidth(context),
          height: screenHeight(context) * 0.65,
          decoration: BoxDecoration(
            color: imageContainerColor,
            borderRadius: getBorderRadius(asset),
            image: DecorationImage(image: AssetImage(asset)),
          ),
        ),
        verticalSpaceLarge,
        Text(
          title,
          style: textTheme.headlineLarge?.copyWith(
            decoration: TextDecoration.underline,
            decorationThickness: 5,
            decorationColor: colorScheme.primary,
          ),
        ),
        verticalSpaceSmall,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
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
        return const BorderRadius.only(bottomLeft: Radius.circular(50));
      case kOnboardingAsset3:
        return const BorderRadius.only(bottomRight: Radius.circular(50));
      default:
        return null;
    }
  }
}
