import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_loading_indicator.dart';

class AppButton extends StatefulWidget {
  const AppButton({
    super.key,
    this.disabled = false,
    this.loading = false,
    required this.onPressed,
    required this.title,
    this.background,
    this.foreground,
  });

  final bool disabled;
  final bool loading;
  final void Function() onPressed;
  final String title;
  final Color? background;
  final Color? foreground;

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.loading || widget.disabled ? null : widget.onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(1.sw, 50.h),
        foregroundColor: widget.foreground,
        backgroundColor: widget.background,
      ),
      child: widget.loading ? const AppLoadingIndicator() : Text(widget.title),
    );
  }
}
