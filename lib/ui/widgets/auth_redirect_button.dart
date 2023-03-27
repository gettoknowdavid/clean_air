import 'package:flutter/material.dart';

class AuthRedirectButton extends StatelessWidget {
  const AuthRedirectButton({
    super.key,
    required this.text,
    required this.buttonLabel,
    required this.onTap,
  });

  final String text;
  final String buttonLabel;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text),
        TextButton(onPressed: onTap, child: Text(buttonLabel)),
      ],
    );
  }
}
