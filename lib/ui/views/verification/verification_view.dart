import 'package:clean_air/ui/common/app_constants.dart';
import 'package:clean_air/ui/common/app_strings.dart';
import 'package:clean_air/ui/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import 'verification_viewmodel.dart';

class VerificationView extends StackedView<VerificationViewModel> {
  const VerificationView({super.key});

  @override
  Widget builder(context, viewModel, child) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kGlobalPadding).r,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                viewModel.isEmailVerified == true
                    ? kConfirmationTitle
                    : kVerificationViewTitle,
                style: textTheme.headlineLarge,
              ),
              10.verticalSpace,
              Text(
                viewModel.isEmailVerified == true
                    ? kConfirmationMessage
                    : kVerificationViewDesc,
                style: textTheme.bodyMedium,
              ),
              25.verticalSpace,
              if (viewModel.isEmailVerified == true) ...[
                AppButton(title: 'Go Home', onPressed: viewModel.goHome),
                120.verticalSpace,
              ] else ...[
                AppButton(
                  title: 'Open mail app',
                  onPressed: viewModel.openMailApp,
                ),
                25.verticalSpace,
                OutlinedButton(
                  onPressed: viewModel.checkEmailVerified,
                  style: OutlinedButton.styleFrom(
                    fixedSize: Size(1.sw, 50.h),
                  ),
                  child: const Text('Verify'),
                ),
                25.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: viewModel.sendVerification,
                      child: const Text('Resend'),
                    ),
                    TextButton(
                      onPressed: viewModel.cancel,
                      child: const Text('Cancel'),
                    )
                  ],
                ),
                60.verticalSpace,
              ]
            ],
          ),
        ),
      ),
    );
  }

  @override
  VerificationViewModel viewModelBuilder(context) => VerificationViewModel();
}
