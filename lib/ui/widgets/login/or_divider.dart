import 'package:clean_air/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Divider(color: theme.dividerColor)),
          horizontalSpaceMedium,
          Text(
            'or',
            textAlign: TextAlign.center,
            style: theme.textTheme.bodySmall,
          ),
          horizontalSpaceMedium,
          Expanded(child: Divider(color: theme.dividerColor)),
        ],
      ),
    );
  }
}
