import 'package:clean_air/ui/layout/layout_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:stacked/stacked.dart';

class AppAvatar extends ViewModelWidget<LayoutViewModel> {
  const AppAvatar({super.key});

  @override
  Widget build(context, viewModel) {
    return GestureDetector(
      onTap: () => viewModel.handleNavigation(3),
      child: const CircleAvatar(
        child: Icon(PhosphorIcons.user),
      ),
    );
  }
}
