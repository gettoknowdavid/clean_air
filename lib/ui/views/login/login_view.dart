import 'package:clean_air/ui/common/app_constants.dart';
import 'package:clean_air/ui/common/validators.dart';
import 'package:clean_air/ui/views/login/login_viewmodel.dart';
import 'package:clean_air/ui/widgets/app_button.dart';
import 'package:clean_air/ui/widgets/app_text_field.dart';
import 'package:clean_air/ui/widgets/auth_redirect_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'login_view.form.dart';

@FormView(fields: [
  FormTextField(name: 'email', validator: Validators.validateEmail),
  FormTextField(name: 'password', validator: Validators.validateLoginPassword),
])
class LoginView extends StackedView<LoginViewModel> with $LoginView {
  const LoginView({super.key});

  @override
  Widget builder(context, viewModel, child) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(leading: const SizedBox()),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: kGlobalPadding).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            10.verticalSpace,
            Text("You're back!", style: textTheme.headlineLarge),
            5.verticalSpace,
            Text(
              "You've been missed. You can login with your email and password.",
              style: textTheme.bodyMedium,
            ),
            30.verticalSpace,
            AppTextField(
              hint: 'Your Email Address',
              label: 'Email',
              enabled: !viewModel.isBusy,
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              focusNode: emailFocusNode,
              validator: Validators.validateEmail,
            ),
            25.verticalSpace,
            AppTextField(
              hint: 'Your password',
              label: 'Password',
              enabled: !viewModel.isBusy,
              controller: passwordController,
              isPassword: true,
              focusNode: passwordFocusNode,
              validator: Validators.validatePassword,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: viewModel.navigateToForgotPasswordView,
                child: const Text('Forgot Password?'),
              ),
            ),
            25.verticalSpace,
            AppButton(
              title: 'Login',
              loading: viewModel.isBusy,
              disabled: viewModel.disabled,
              onPressed:  viewModel.login,
            ),
            10.verticalSpace,
            AuthRedirectButton(
              buttonLabel: 'Register',
              text: 'Don\'t have an account?',
              onTap: viewModel.navigateToRegisterView,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void onDispose(LoginViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }

  @override
  void onViewModelReady(LoginViewModel viewModel) {
    syncFormWithViewModel(viewModel);
    super.onViewModelReady(viewModel);
  }

  @override
  LoginViewModel viewModelBuilder(BuildContext context) => LoginViewModel();
}
