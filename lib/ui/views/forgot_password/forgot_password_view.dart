import 'package:clean_air/ui/common/app_constants.dart';
import 'package:clean_air/ui/common/validators.dart';
import 'package:clean_air/ui/widgets/app_button.dart';
import 'package:clean_air/ui/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'forgot_password_view.form.dart';
import 'forgot_password_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'email', validator: Validators.validateEmail),
])
class ForgotPasswordView extends StackedView<ForgotPasswordViewModel>
    with $ForgotPasswordView {
  ForgotPasswordView({super.key});

  @override
  Widget builder(context, viewModel, child) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(elevation: 0),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kGlobalPadding).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              'Forgot Password',
              style: theme.textTheme.headlineLarge,
            ),
            10.verticalSpace,
            Text(
              "Don't worry! It happens. Please enter the address associated with your account.",
              style: theme.textTheme.bodyMedium,
            ),
            30.verticalSpace,
            AppTextField(
              hint: 'Your Email',
              label: 'Email',
              controller: emailController,
              focusNode: emailFocusNode,
              validator: Validators.validateEmail,
            ),
            40.verticalSpace,
            AppButton(
              title: 'Submit',
              loading: viewModel.isBusy,
              disabled: viewModel.disabled,
              onPressed: () async {
                await viewModel.submit(email: emailController.text);
              },
            ),
            120.verticalSpace,
          ],
        ),
      ),
    );
  }

  @override
  void onDispose(ForgotPasswordViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }

  @override
  void onViewModelReady(ForgotPasswordViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  ForgotPasswordViewModel viewModelBuilder(context) {
    return ForgotPasswordViewModel();
  }
}
