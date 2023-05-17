// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clean_air/ui/common/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AqiSection extends StatelessWidget {
  final Widget child;
  final String? title;
  final double? height;

  const AqiSection({super.key, required this.child, this.height, this.title});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final containerColor = theme.brightness == Brightness.light
        ? theme.colorScheme.tertiaryContainer.withOpacity(0.1)
        : theme.colorScheme.background;

    return Container(
      width: 1.sw,
      height: height,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14).r,
      decoration: BoxDecoration(
        borderRadius: kGlobalBorderRadius,
        color: containerColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (title != null) ...[
            _AqiSectionTitle(title: title!),
            10.verticalSpace,
          ],
          child,
        ],
      ),
    );
  }
}

class _AqiSectionTitle extends StatelessWidget {
  final String title;

  const _AqiSectionTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Text(
      title,
      style: textTheme.bodySmall?.copyWith(
        fontSize: 11.sp,
        height: 1.r,
        color: textTheme.bodySmall?.color?.withOpacity(0.25),
      ),
    );
  }
}
