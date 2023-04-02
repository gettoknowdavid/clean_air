import 'package:clean_air/ui/common/app_constants.dart';
import 'package:clean_air/ui/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import 'password_reset_confirmation_viewmodel.dart';

class PasswordResetConfirmationView
    extends StackedView<PasswordResetConfirmationViewModel> {
  const PasswordResetConfirmationView({super.key});

  @override
  Widget builder(context, viewModel, child) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kGlobalPadding).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              'You have mail',
              style: theme.textTheme.displaySmall,
            ),
            10.verticalSpace,
            Text(
              "A password recovery mail has been sent to your email. Click on the link to reset your password.",
              style: theme.textTheme.bodyMedium,
            ),
            40.verticalSpace,
            AppButton(
              title: 'Back to Login',
              onPressed: viewModel.navigateBackToLoginView,
            ),
            120.verticalSpace,
          ],
        ),
      ),
    );
  }

  @override
  PasswordResetConfirmationViewModel viewModelBuilder(context) {
    return PasswordResetConfirmationViewModel();
  }
}
