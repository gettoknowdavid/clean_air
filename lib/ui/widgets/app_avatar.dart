import 'package:clean_air/ui/layout/layout_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:stacked/stacked.dart';

class AppAvatar extends ViewModelWidget<LayoutViewModel> {
  const AppAvatar({super.key});

  @override
  Widget build(context, viewModel) {
    final theme = Theme.of(context);

    final outerRadius = 18.r;
    final innerRadius = 17.r;

    return GestureDetector(
      onTap: () => viewModel.handleNavigation(3),
      child: CircleAvatar(
        radius: outerRadius,
        backgroundColor: theme.colorScheme.primary,
        child: CircleAvatar(
          radius: innerRadius,
          child: PhosphorIcon(PhosphorIcons.regular.user),
          foregroundImage:
              viewModel.user?.avatar != null && viewModel.isConnected
                  ? NetworkImage(viewModel.user!.avatar!)
                  : viewModel.localProfileAvatar?.image,
        ),
      ),
    );
  }
}
