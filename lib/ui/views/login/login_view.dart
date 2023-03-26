import 'package:clean_air/ui/common/ui_helpers.dart';
import 'package:clean_air/ui/views/login/validators.dart';
import 'package:clean_air/ui/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'login_view.form.dart';
import 'login_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'email', validator: LoginValidators.validateEmail),
  FormTextField(name: 'password', validator: LoginValidators.validatePassword),
])
class LoginView extends StackedView<LoginViewModel> with $LoginView {
  LoginView({super.key});

  @override
  Widget builder(context, viewModel, child) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(leading: const BackButton()),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpaceSmall,
              Text('Welcome \nback!', style: textTheme.displayMedium),
              verticalSpaceSmall,
              Text("You've been missed", style: textTheme.bodyLarge),
              verticalSpaceLarge,
              AppTextField(
                hint: 'johndoe@example.com',
                label: 'Email',
                // enabled: !loading,
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                focusNode: emailFocusNode,
              ),
              // verticalSpaceSmall,
              // const OrDivider(),
              const SizedBox(height: 15),
              // const GoogleButton(),
              // if (showRedirect) ...[
              //   const SizedBox(height: 15),
              //   RedirectButton(
              //     buttonLabel: 'Register',
              //     text: 'Don\'t have an account?',
              //     onTap: () => AutoRouter.of(context).push(RegisterRoute()),
              //   ),
              // ]
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
