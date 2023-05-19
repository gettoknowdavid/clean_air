import 'package:clean_air/ui/views/login/login_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:stacked/stacked.dart';

class GoogleButton extends ViewModelWidget<LoginViewModel> {
  const GoogleButton({super.key});

  @override
  Widget build(BuildContext context, LoginViewModel viewModel) {
    final theme = Theme.of(context);

    return OutlinedButton.icon(
      onPressed: viewModel.googleSignIn,
      icon: viewModel.isBusy
          ? const SizedBox()
          : const Icon(PhosphorIcons.googleLogoFill),
      label: viewModel.isBusy
          ? _buildLoadingIndicator()
          : const Text('Login with Google'),
      style: OutlinedButton.styleFrom(
        fixedSize: Size(1.sw, 50.h),
        foregroundColor: theme.colorScheme.onBackground,
      ),
    );
  }

  SizedBox _buildLoadingIndicator() {
    return SizedBox(
      height: 20.r,
      width: 20.r,
      child: const CircularProgressIndicator(),
    );
  }
}
