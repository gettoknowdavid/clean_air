import 'package:clean_air/ui/common/app_constants.dart';
import 'package:clean_air/ui/common/validators.dart';
import 'package:clean_air/ui/widgets/auth_redirect_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'login_form.dart';
import 'login_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'email', validator: Validators.validateEmail),
  FormTextField(name: 'password', validator: Validators.validateLoginPassword),
])
class LoginView extends StackedView<LoginViewModel> {
  const LoginView({super.key});

  @override
  Widget builder(context, viewModel, child) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(leading: const SizedBox()),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: kGlobalPadding).r,
        child: Form(
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
              LoginForm(),
              // 10.verticalSpace,
              // const OrDivider(),
              // 10.verticalSpace,
              // const GoogleButton(),
              10.verticalSpace,
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
  LoginViewModel viewModelBuilder(BuildContext context) => LoginViewModel();
}
