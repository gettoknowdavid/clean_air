// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clean_air/ui/common/app_constants.dart';
import 'package:clean_air/ui/widgets/home/aqi_section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AqiSection extends StatelessWidget {
  final Widget child;
  final String title;

  const AqiSection({super.key, required this.child, required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final containerColor = theme.brightness == Brightness.light
        ? theme.colorScheme.tertiaryContainer.withOpacity(0.1)
        : theme.colorScheme.background;

    return Container(
      width: 1.sw,
      padding: const EdgeInsets.all(18).r,
      decoration: BoxDecoration(
        borderRadius: kGlobalBorderRadius,
        color: containerColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AqiSectionTitle(title: title),
          10.verticalSpace,
          child,
        ],
      ),
    );
  }
}
