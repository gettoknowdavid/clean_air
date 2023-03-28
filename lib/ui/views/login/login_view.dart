import 'package:clean_air/ui/common/ui_helpers.dart';
import 'package:clean_air/ui/common/validators.dart';
import 'package:clean_air/ui/widgets/app_button.dart';
import 'package:clean_air/ui/widgets/app_text_field.dart';
import 'package:clean_air/ui/widgets/auth_redirect_button.dart';
import 'package:clean_air/ui/widgets/login/google_button.dart';
import 'package:clean_air/ui/widgets/login/or_divider.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'login_view.form.dart';
import 'login_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'email', validator: Validators.validateEmail),
  FormTextField(name: 'password', validator: Validators.validateLoginPassword),
])
class LoginView extends StackedView<LoginViewModel> with $LoginView {
  LoginView({super.key});

  @override
  Widget builder(context, viewModel, child) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(leading: const SizedBox()),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpaceSmall,
              Text("You're back!", style: textTheme.displayMedium),
              verticalSpaceTiny,
              Text(
                "You've been missed. You can login with your email and password.",
                style: textTheme.bodyLarge,
              ),
              verticalSpaceLarge,
              AppTextField(
                hint: 'Your Email Address',
                label: 'Email',
                enabled: !viewModel.isBusy,
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                focusNode: emailFocusNode,
                validator: Validators.validateEmail,
              ),
              verticalSpaceMedium,
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
                  onPressed: () {},
                  child: const Text('Forgot Password?'),
                ),
              ),
              verticalSpaceMedium,
              AppButton(
                title: 'Login',
                loading: viewModel.isBusy,
                disabled: viewModel.disabled,
                onPressed: () async {
                  await viewModel.login(
                    email: emailController.text,
                    password: passwordController.text,
                  );
                },
              ),
              verticalSpaceSmall,
              const OrDivider(),
              verticalSpaceSmall,
              const GoogleButton(),
              verticalSpaceSmall,
              AuthRedirectButton(
                buttonLabel: 'Register',
                text: 'Don\'t have an account?',
                onTap: viewModel.navigateToRegisterView,
              ),
            ],
          ),
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
  }

  @override
  LoginViewModel viewModelBuilder(BuildContext context) => LoginViewModel();
}
