import 'package:clean_air/ui/common/validators.dart';
import 'package:clean_air/ui/views/login/login_viewmodel.dart';
import 'package:clean_air/ui/widgets/app_button.dart';
import 'package:clean_air/ui/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import 'login_view.form.dart';

class LoginForm extends StackedView<LoginViewModel> with $LoginView {
  LoginForm({super.key});

  @override
  Widget builder(context, viewModel, child) {
    return Form(
      child: Column(
        children: [
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
            onPressed: () async {
              await viewModel.login(
                email: emailController.text,
                password: passwordController.text,
              );
            },
          ),
        ],
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
