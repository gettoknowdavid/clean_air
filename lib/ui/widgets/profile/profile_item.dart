import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem(
    this.title, {
    super.key,
    this.subtitle,
    this.leadingIcon,
    this.onTap,
    this.tileColor,
    this.iconColor,
    this.titleColor,
    this.loading = false,
    this.showTrailing = true,
  });

  final IconData? leadingIcon;
  final String title;
  final Widget? subtitle;
  final void Function()? onTap;
  final Color? tileColor;
  final Color? iconColor;
  final Color? titleColor;
  final bool loading;
  final bool showTrailing;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return ListTile(
      onTap: onTap,
      dense: true,
      leading: leadingIcon != null ? Icon(leadingIcon) : null,
      contentPadding: const EdgeInsets.fromLTRB(12, 4, 12, 4).r,
      title: Text(
        title,
        style: textTheme.bodyLarge?.copyWith(color: titleColor),
      ),
      subtitle: subtitle,
      trailing: !loading
          ? showTrailing
              ? const Icon(PhosphorIcons.caretRight)
              : const SizedBox()
          : SizedBox(
              height: 15.r,
              width: 15.r,
              child: const CircularProgressIndicator(),
            ),
      iconColor: iconColor ?? theme.primaryColor,
      minLeadingWidth: leadingIcon == null ? 0 : 20.r,
      tileColor: tileColor ?? theme.colorScheme.primary.withOpacity(0.1),
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(10)).r,
      ),
    );
  }
}
