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
    final theme = Theme.of(context);

    if (viewModel.isBusy) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: kGlobalPadding).r,
        child: Column(
          children: [
            (kToolbarHeight * 1.2).verticalSpace,
            const ProfileAvatar(),
            20.verticalSpace,
            const _Name(),
            const _Email(),
            const _Location(),
            30.verticalSpace,
            ProfileItem(
              'Edit Profile',
              showTrailing: false,
              leadingIcon: PhosphorIcons.pencil,
              onTap: viewModel.showEditProfileBottomSheet,
            ),
            10.verticalSpace,
            const ProfileItem(
              'Change Health Condition',
              showTrailing: false,
              leadingIcon: PhosphorIcons.heartbeat,
            ),
            10.verticalSpace,
            ProfileItem(
              'Account',
              leadingIcon: PhosphorIcons.userCircle,
              onTap: viewModel.navigateToAccountView,
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
              showTrailing: false,
              onTap: viewModel.logout,
              tileColor: theme.colorScheme.error.withOpacity(0.2),
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

class _Location extends ViewModelWidget<ProfileViewModel> {
  const _Location();

  @override
  Widget build(BuildContext context, ProfileViewModel viewModel) {
    final textTheme = Theme.of(context).textTheme;

    return FutureBuilder<String>(
      future: viewModel.getCurrentLocation,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox();
        } else {
          return Center(
            child: SkeletonLoader(
              loading: snapshot.connectionState == ConnectionState.waiting,
              child: Text(
                snapshot.data!,
                textAlign: TextAlign.center,
                style: textTheme.bodyMedium?.copyWith(
                  color: textTheme.bodyLarge?.color?.withOpacity(0.5),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}

class _Email extends SelectorViewModelWidget<ProfileViewModel, String> {
  const _Email();

  @override
  Widget build(BuildContext context, String value) {
    final textTheme = Theme.of(context).textTheme;

    return Text(
      value,
      textAlign: TextAlign.center,
      style: textTheme.bodyMedium?.copyWith(
        fontStyle: FontStyle.italic,
        color: textTheme.bodyMedium?.color?.withOpacity(0.5),
      ),
    );
  }

  @override
  String selector(ProfileViewModel viewModel) => viewModel.user!.email;
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
