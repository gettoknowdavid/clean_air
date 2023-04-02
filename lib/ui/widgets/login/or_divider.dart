import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20).r,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Divider(color: theme.dividerColor)),
          25.horizontalSpace,
          Text(
            'or',
            textAlign: TextAlign.center,
            style: theme.textTheme.bodySmall,
          ),
          25.horizontalSpace,
          Expanded(child: Divider(color: theme.dividerColor)),
        ],
      ),
    );
  }
}
