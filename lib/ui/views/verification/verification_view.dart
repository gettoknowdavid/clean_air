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
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kGlobalPadding).r,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (viewModel.showVerified == true) ...[
                Text(kConfirmationTitle, style: textTheme.headlineLarge),
                10.verticalSpace,
                Text(kConfirmationMessage, style: textTheme.bodyMedium),
                25.verticalSpace,
                AppButton(
                  title: 'Go Home',
                  onPressed: viewModel.goHome,
                  loading: viewModel.isBusy,
                ),
                120.verticalSpace,
              ] else ...[
                Text(kVerificationViewTitle, style: textTheme.headlineLarge),
                10.verticalSpace,
                Text(kVerificationViewDesc, style: textTheme.bodyMedium),
                25.verticalSpace,
                AppButton(title: 'Open Mail', onPressed: viewModel.openMailApp),
                25.verticalSpace,
                OutlinedButton(
                  onPressed:
                      viewModel.isBusy ? null : viewModel.checkEmailVerified,
                  style: OutlinedButton.styleFrom(fixedSize: Size(1.sw, 50.h)),
                  child: viewModel.isBusy
                      ? Center(
                          child: SizedBox(
                          height: 20.r,
                          width: 20.r,
                          child: const CircularProgressIndicator(),
                        ))
                      : const Text('Verify'),
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
