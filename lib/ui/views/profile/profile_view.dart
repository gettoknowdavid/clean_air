import 'package:clean_air/ui/common/app_constants.dart';
import 'package:clean_air/ui/widgets/profile/profile_avatar.dart';
import 'package:clean_air/ui/widgets/profile/profile_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:stacked/stacked.dart';

import 'profile_viewmodel.dart';

class ProfileView extends StackedView<ProfileViewModel> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget builder(context, viewModel, child) {
    if (viewModel.isBusy) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      body: Center(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: kGlobalPadding).r,
          children: [
            (kToolbarHeight * 1.2).verticalSpace,
            const ProfileAvatar(),
            20.verticalSpace,
            const _Name(),
            const _Location(),
            30.verticalSpace,
            ProfileItem(
              'Edit Profile',
              leadingIcon: PhosphorIcons.pencil,
              onTap: viewModel.showEditProfileBottomSheet,
            ),
            10.verticalSpace,
            const ProfileItem(
              'Change Health Condition',
              leadingIcon: PhosphorIcons.heartbeat,
            ),
            10.verticalSpace,
            ProfileItem(
              'Account',
              leadingIcon: PhosphorIcons.userCircle,
              onTap: viewModel.navigateToAccountView,
            ),
            10.verticalSpace,
            const ProfileItem(
              'Change Location',
              leadingIcon: PhosphorIcons.navigationArrow,
            ),
            10.verticalSpace,
            ProfileItem(
              'About CleanAir',
              leadingIcon: PhosphorIcons.info,
              onTap: viewModel.navigateToAboutView,
            ),
            10.verticalSpace,
            ProfileItem(
              'Logout',
              onTap: viewModel.logout,
              leadingIcon: PhosphorIcons.signOut,
            ),
            30.verticalSpace,
          ],
        ),
      ),
    );
  }

  @override
  ProfileViewModel viewModelBuilder(context) => ProfileViewModel();
}

class _Location extends StatelessWidget {
  const _Location();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Text(
      'Lagos, NG',
      textAlign: TextAlign.center,
      style: textTheme.bodyMedium?.copyWith(
        color: textTheme.bodyLarge?.color?.withOpacity(0.5),
      ),
    );
  }
}

class _Name extends SelectorViewModelWidget<ProfileViewModel, String> {
  const _Name();

  @override
  Widget build(BuildContext context, String value) {
    final textTheme = Theme.of(context).textTheme;

    return Text(
      value,
      style: textTheme.titleLarge,
      maxLines: 1,
      textAlign: TextAlign.center,
    );
  }

  @override
  String selector(ProfileViewModel viewModel) => viewModel.user!.name;
}
