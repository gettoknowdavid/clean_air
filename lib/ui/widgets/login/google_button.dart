import 'package:clean_air/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return OutlinedButton.icon(
      onPressed: () {},
      icon: const Icon(PhosphorIcons.googleLogoFill),
      label: const Text('Login with Google'),
      style: OutlinedButton.styleFrom(
        fixedSize: Size(screenWidth(context), 60),
        foregroundColor: theme.colorScheme.onBackground,
      ),
    );
  }
}
