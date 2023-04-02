import 'package:clean_air/ui/common/validators.dart';
import 'package:clean_air/ui/views/register/register_view.form.dart';
import 'package:clean_air/ui/widgets/app_button.dart';
import 'package:clean_air/ui/widgets/app_text_field.dart';
import 'package:clean_air/ui/widgets/register/password_rules_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import 'register_viewmodel.dart';

class RegisterForm extends StackedView<RegisterViewModel> with $RegisterView {
  RegisterForm({super.key});

  @override
  Widget builder(context, viewModel, child) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextField(
            hint: 'Your Name',
            label: 'Name',
            enabled: !viewModel.isBusy,
            controller: nameController,
            focusNode: nameFocusNode,
            validator: Validators.validateName,
          ),
          25.verticalSpace,
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
          10.verticalSpace,
          PasswordRulesWidget(),
          30.verticalSpace,
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
        ],
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
