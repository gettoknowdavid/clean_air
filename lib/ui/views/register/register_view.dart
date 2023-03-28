import 'package:clean_air/ui/common/ui_helpers.dart';
import 'package:clean_air/ui/common/validators.dart';
import 'package:clean_air/ui/views/register/register_view.form.dart';
import 'package:clean_air/ui/widgets/app_button.dart';
import 'package:clean_air/ui/widgets/app_text_field.dart';
import 'package:clean_air/ui/widgets/auth_redirect_button.dart';
import 'package:clean_air/ui/widgets/register/password_rules_widget.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'register_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'name', validator: Validators.validateName),
  FormTextField(name: 'email', validator: Validators.validateEmail),
  FormTextField(name: 'password', validator: Validators.validatePassword),
])
class RegisterView extends StackedView<RegisterViewModel> with $RegisterView {
  RegisterView({super.key});

  @override
  Widget builder(context, viewModel, child) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(elevation: 0, scrolledUnderElevation: 0),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpaceSmall,
              Text('Register', style: textTheme.displayMedium),
              verticalSpaceTiny,
              Text(
                "You can create your account with your \nemail and password",
                style: textTheme.bodyLarge,
              ),
              verticalSpaceLarge,
              AppTextField(
                hint: 'Your Name',
                label: 'Name',
                enabled: !viewModel.isBusy,
                controller: nameController,
                focusNode: nameFocusNode,
                validator: Validators.validateName,
              ),
              verticalSpaceMedium,
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
              verticalSpaceSmall,
              PasswordRulesWidget(),
              verticalSpaceLarge,
              AppButton(
                loading: viewModel.isBusy,
                title: 'Register',
                disabled: viewModel.disabled,
                onPressed: () async {
                  await viewModel.register(
                    name: nameController.text,
                    email: emailController.text,
                    password: passwordController.text,
                  );
                },
              ),
              verticalSpaceSmall,
              AuthRedirectButton(
                buttonLabel: 'Back to Login',
                text: 'Already have an account?',
                onTap: viewModel.navigateBackToLogin,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void onDispose(RegisterViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }

  @override
  void onViewModelReady(RegisterViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  RegisterViewModel viewModelBuilder(context) => RegisterViewModel();
}
