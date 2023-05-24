import 'package:clean_air/ui/common/app_constants.dart';
import 'package:clean_air/ui/common/validators.dart';
import 'package:clean_air/ui/widgets/auth_redirect_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'register_form.dart';
import 'register_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'name', validator: Validators.validateName),
  FormTextField(name: 'email', validator: Validators.validateEmail),
  FormTextField(name: 'password', validator: Validators.validatePassword),
])
class RegisterView extends StackedView<RegisterViewModel> {
  const RegisterView({super.key});

  @override
  Widget builder(context, viewModel, child) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(elevation: 0, scrolledUnderElevation: 0),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.symmetric(horizontal: kGlobalPadding).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            10.verticalSpace,
            Text('Register', style: textTheme.headlineLarge),
            5.verticalSpace,
            Text(
              "You can create your account with your \nemail and password",
              style: textTheme.bodyMedium,
            ),
            30.verticalSpace,
            RegisterForm(),
            10.verticalSpace,
            AuthRedirectButton(
              buttonLabel: 'Back to Login',
              text: 'Already have an account?',
              onTap: viewModel.navigateBackToLoginView,
            ),
            20.verticalSpace,
          ],
        ),
      ),
    );
  }

  @override
  RegisterViewModel viewModelBuilder(context) => RegisterViewModel();
}
