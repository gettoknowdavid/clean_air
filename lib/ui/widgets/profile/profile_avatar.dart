import 'package:clean_air/ui/views/profile/profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:stacked/stacked.dart';

class ProfileAvatar extends ViewModelWidget<ProfileViewModel> {
  const ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context, ProfileViewModel viewModel) {
    final theme = Theme.of(context);
    final outerRadius = 0.15.sw;
    final innerRadius = 0.145.sw;
    final iconSize = innerRadius * 0.6;

    final iconColor = theme.colorScheme.onBackground;

    return CircleAvatar(
      radius: outerRadius,
      backgroundColor: theme.colorScheme.onBackground,
      child: CircleAvatar(
        radius: innerRadius,
        foregroundImage: viewModel.user?.avatar != null && viewModel.isConnected
            ? NetworkImage(viewModel.user!.avatar!)
            : viewModel.localProfileAvatar?.image,
        child: Icon(
          PhosphorIcons.regular.user,
          size: iconSize,
          color: iconColor,
        ),
      ),
    );
  }
}
