import 'package:auto_size_text/auto_size_text.dart';
import 'package:clean_air/models/user.dart';
import 'package:clean_air/ui/common/app_constants.dart';
import 'package:clean_air/ui/views/home/home_viewmodel.dart';
import 'package:clean_air/ui/widgets/app_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

class HomeAppBar extends SelectorViewModelWidget<HomeViewModel, User?>
    with PreferredSizeWidget {
  HomeAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, User? value) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final leadingStyle = textTheme.titleMedium?.copyWith(fontSize: 14.r);
    return AppBar(
      leadingWidth: (kBottomNavigationBarHeight * 4).r,
      scrolledUnderElevation: 0.0,
      leading: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: kGlobalPadding).r,
        child: AutoSizeText(
          'Hi, David',
          maxFontSize: 20,
          minFontSize: 14,
          style: leadingStyle?.copyWith(fontWeight: FontWeight.w500),
        ),
      ),
      actions: [
        const AppAvatar(),
        kGlobalPadding.horizontalSpace,
      ],
    );
  }

  @override
  User? selector(HomeViewModel viewModel) => viewModel.user;
}
