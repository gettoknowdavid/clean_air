import 'package:clean_air/ui/common/ui_helpers.dart';
import 'package:clean_air/ui/widgets/app_loading_asset.dart';
import 'package:flutter/material.dart';

class AppButton extends StatefulWidget {
  const AppButton({
    super.key,
    this.disabled = false,
    this.loading = false,
    required this.onPressed,
    required this.title,
  });

  final bool disabled;
  final bool loading;
  final void Function() onPressed;
  final String title;

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    final fixedSize = Size(screenWidth(context), 60);

    return ElevatedButton(
      onPressed: widget.loading || widget.disabled ? null : widget.onPressed,
      style: ElevatedButton.styleFrom(fixedSize: fixedSize),
      child: widget.loading ? const AppLoadingAsset() : Text(widget.title),
    );
  }
}
