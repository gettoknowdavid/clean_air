import 'package:clean_air/ui/layout/layout_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:stacked/stacked.dart';

final items = [
  BottomNavigationBarItem(
    label: 'Home',
    icon: Icon(PhosphorIcons.regular.house),
    activeIcon: Icon(PhosphorIcons.fill.house),
  ),
  BottomNavigationBarItem(
    label: 'Search',
    icon: Icon(PhosphorIcons.regular.magnifyingGlass),
    activeIcon: Icon(PhosphorIcons.fill.magnifyingGlass),
  ),
  BottomNavigationBarItem(
    label: 'Favorites',
    icon: Icon(PhosphorIcons.regular.heart),
    activeIcon: Icon(PhosphorIcons.fill.heart),
  ),
  BottomNavigationBarItem(
    label: 'Profile',
    icon: Icon(PhosphorIcons.regular.user),
    activeIcon: Icon(PhosphorIcons.fill.user),
  ),
];

class AppBottomNavigationBar extends ViewModelWidget<LayoutViewModel> {
  const AppBottomNavigationBar({super.key});

  @override
  Widget build(context, viewModel) {
    return BottomNavigationBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      currentIndex: viewModel.currentIndex,
      onTap: viewModel.handleNavigation,
      items: items,
    );
  }
}
