import 'package:clean_air/ui/common/ui_helpers.dart';
import 'package:clean_air/ui/widgets/app_button.dart';
import 'package:flutter/material.dart';
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
          padding: const EdgeInsets.only(left: 25.0, right: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Text('Verify your \nemail', style: textTheme.displayMedium),
              verticalSpaceMedium,
              Text('You have mail.', style: textTheme.bodyLarge),
              verticalSpaceMedium,
              Text(
                'You can open your mail application to check for the verification mail we just sent to you.',
                style: textTheme.bodyLarge,
              ),
              verticalSpaceMedium,
              AppButton(
                title: 'Open mail app',
                onPressed: viewModel.openMailApp,
              ),
              verticalSpaceMedium,
              OutlinedButton(
                onPressed: viewModel.checkEmailVerified,
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: theme.colorScheme.primary),
                  fixedSize: Size(screenWidth(context), 53),
                ),
                child: const Text('Verify'),
              ),
              verticalSpaceMedium,
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
              verticalSpaceMedium,
            ],
          ),
        ),
      ),
    );
  }

  @override
  VerificationViewModel viewModelBuilder(context) => VerificationViewModel();
}
