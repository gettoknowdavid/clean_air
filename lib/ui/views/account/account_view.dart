import 'package:clean_air/ui/common/app_constants.dart';
import 'package:clean_air/ui/common/validators.dart';
import 'package:clean_air/ui/widgets/app_button.dart';
import 'package:clean_air/ui/widgets/app_text_field.dart';
import 'package:clean_air/ui/widgets/profile/profile_item.dart';
import 'package:clean_air/ui/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'account_view.form.dart';
import 'account_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'email', validator: Validators.validateEmail),
  FormTextField(name: 'password', validator: Validators.validatePassword),
  FormTextField(
    name: 'confirmPassword',
    validator: Validators.validateLoginPassword,
  ),
])
class AccountView extends StackedView<AccountViewModel> with $AccountView {
  AccountView({super.key});

  @override
  Widget builder(context, viewModel, child) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    final backgroundColor = colorScheme.primary.withOpacity(0.1);
    final shape = RoundedRectangleBorder(
      borderRadius: const BorderRadius.all(Radius.circular(10)).r,
    );

    if (viewModel.isBusy) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Account')),
      body: SingleChildScrollView(
        padding: kGlobalHorizontalPadding,
        child: Column(
          children: [
            10.verticalSpace,
            ExpansionTile(
              title: const Text('Change Email'),
              leading: const Icon(PhosphorIcons.at),
              tilePadding: const EdgeInsets.fromLTRB(12, 0, 12, 0).r,
              childrenPadding: const EdgeInsets.fromLTRB(12, 4, 12, 4).r,
              onExpansionChanged: viewModel.onEmailExpansionChanged,
              collapsedBackgroundColor: backgroundColor,
              backgroundColor: backgroundColor,
              collapsedShape: shape,
              shape: shape,
              children: [
                AppTextField(
                  hint: 'newemail@exmaple.com',
                  label: 'Your new email',
                  enabled: viewModel.showEmail && !viewModel.isBusy,
                  focusNode: emailFocusNode,
                  controller: emailController,
                  validator: Validators.validateEmail,
                ),
                10.verticalSpace,
                AppButton(
                  title: 'Looks good',
                  disabled: viewModel.emailFieldDisabled,
                  loading: viewModel.isBusy,
                  onPressed: viewModel.updateEmail,
                ),
                10.verticalSpace,
              ],
            ),
            10.verticalSpace,
            ExpansionTile(
              title: const Text('Change Password'),
              leading: const Icon(PhosphorIcons.password),
              tilePadding: const EdgeInsets.fromLTRB(12, 0, 12, 0).r,
              childrenPadding: const EdgeInsets.fromLTRB(12, 4, 12, 4).r,
              onExpansionChanged: viewModel.onPasswordExpansionChanged,
              collapsedBackgroundColor: backgroundColor,
              backgroundColor: backgroundColor,
              collapsedShape: shape,
              shape: shape,
              children: [
                AppTextField(
                  hint: 'New Password',
                  label: 'New Password',
                  enabled: viewModel.showPassword && !viewModel.isBusy,
                  focusNode: passwordFocusNode,
                  controller: passwordController,
                  validator: Validators.validatePassword,
                  isPassword: true,
                ),
                10.verticalSpace,
                AppTextField(
                  hint: 'Confirm New Password',
                  label: 'Confirm New Password',
                  enabled: viewModel.showPassword && !viewModel.isBusy,
                  focusNode: confirmPasswordFocusNode,
                  controller: confirmPasswordController,
                  validator: Validators.validateLoginPassword,
                  isPassword: true,
                ),
                4.verticalSpace,
                Text(
                  'Password must have at least 1 uppercase letter, 1 lowercase letter, 1 number and 1 special character.',
                  style: textTheme.labelSmall,
                ),
                10.verticalSpace,
                AppButton(
                  title: 'Change Password',
                  disabled: viewModel.passwordButtonDisabled,
                  loading: viewModel.isBusy,
                  onPressed: viewModel.updatePassword,
                ),
                10.verticalSpace,
              ],
            ),
            10.verticalSpace,
            Container(
              padding: kGlobalHorizontalPadding,
              decoration: BoxDecoration(
                color: theme.colorScheme.error.withOpacity(0.2),
                borderRadius: BorderRadius.all(const Radius.circular(20).r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionTitle(
                    'Danger Zone',
                    textColor: theme.colorScheme.error,
                  ),
                  ProfileItem(
                    'Delete Account',
                    showTrailing: false,
                    iconColor: theme.colorScheme.onError,
                    titleColor: theme.colorScheme.onError,
                    tileColor: theme.colorScheme.error,
                    leadingIcon: PhosphorIcons.warning,
                    onTap: viewModel.onDeleteAccount,
                  ),
                  14.verticalSpace,
                ],
              ),
            ),
            10.verticalSpace,
          ],
        ),
      ),
    );
  }

  @override
  void onDispose(AccountViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }

  @override
  void onViewModelReady(AccountViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  AccountViewModel viewModelBuilder(BuildContext context) => AccountViewModel();
}
