import 'package:clean_air/ui/common/app_constants.dart';
import 'package:clean_air/ui/widgets/profile/profile_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:stacked/stacked.dart';

import 'account_viewmodel.dart';

class AccountView extends StackedView<AccountViewModel> {
  const AccountView({super.key});

  @override
  Widget builder(context, viewModel, child) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Account')),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: kGlobalPadding).r,
          children: [
            ProfileItem(
              'Reset Password',
              leadingIcon: PhosphorIcons.eyeSlash,
              onTap: viewModel.sendResetPasswordEmail,
            ),
            10.verticalSpace,
            ProfileItem(
              'Delete Account',
              leadingIcon: PhosphorIcons.warningOctagon,
              tileColor: theme.colorScheme.errorContainer.withOpacity(0.4),
              onTap: () {},
            ),
            30.verticalSpace,
          ],
        ),
      ),
    );
  }

  @override
  AccountViewModel viewModelBuilder(BuildContext context) => AccountViewModel();
}
