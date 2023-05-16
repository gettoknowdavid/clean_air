import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle(
    this.title, {
    super.key,
    this.textColor,
    this.onTap,
    this.child,
  });

  final String title;
  final Color? textColor;
  final void Function()? onTap;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Row(
          children: [
            Text(
              title,
              style: textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            const Spacer(),
            if (onTap != null)
              TextButton(
                onPressed: onTap,
                child: Text('See all', style: textTheme.bodySmall),
              )
            else
              40.verticalSpace,
          ],
        ),
        child ?? const SizedBox(),
      ],
    );
  }
}
