import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    required this.hint,
    this.isPassword = false,
    this.label,
    this.keyboardType,
    this.autocorrect = false,
    this.onChanged,
    this.validator,
    this.enabled = true,
    this.initialValue,
    this.onTap,
    this.controller,
    this.maxLines = 1,
    this.maxLength,
    this.autofocus = false,
    this.textInputAction = TextInputAction.next,
    this.focusNode,
    this.prefixIcon,
    this.suffixIcon,
    this.onFieldSubmitted,
  });

  final String hint;
  final bool isPassword;
  final String? label;
  final TextInputType? keyboardType;
  final bool autocorrect;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool enabled;
  final String? initialValue;
  final void Function()? onTap;
  final TextEditingController? controller;
  final int? maxLines;
  final int? maxLength;
  final bool autofocus;
  final TextInputAction textInputAction;
  final FocusNode? focusNode;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final void Function(String)? onFieldSubmitted;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool obscure = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding = const EdgeInsets.all(18).r;
    final isMaxLine = widget.maxLines != null && widget.maxLines! > 1;

    final prefixIcon = !isMaxLine
        ? widget.prefixIcon
        : Align(
            heightFactor: 3,
            widthFactor: 1,
            alignment: Alignment.topCenter,
            child: widget.prefixIcon,
          );

    return TextFormField(
      obscureText: widget.isPassword ? !obscure : obscure,
      onTap: widget.onTap,
      controller: widget.controller,
      initialValue: widget.initialValue,
      keyboardType: widget.keyboardType,
      autocorrect: widget.autocorrect,
      onChanged: widget.onChanged,
      validator: widget.validator,
      enabled: widget.enabled,
      style: theme.textTheme.titleMedium,
      maxLines: widget.maxLines,
      maxLength: widget.maxLength,
      autofocus: widget.autofocus,
      textInputAction: widget.textInputAction,
      focusNode: widget.focusNode,
      onFieldSubmitted: widget.onFieldSubmitted,
      decoration: InputDecoration(
        hintText: widget.hint,
        alignLabelWithHint: true,
        labelText: widget.label,
        prefixIcon: prefixIcon,
        suffixIcon: !widget.isPassword ? widget.suffixIcon : _suffixIcon(),
        contentPadding: padding,
      ),
    );
  }

  Widget _suffixIcon() {
    return Semantics(
      button: true,
      attributedLabel: AttributedString('Hide Password'),
      child: IconButton(
        onPressed: () => setState(() => obscure = !obscure),
        icon: obscure
            ? Icon(PhosphorIcons.regular.eye)
            : Icon(PhosphorIcons.regular.eyeSlash),
      ),
    );
  }
}
