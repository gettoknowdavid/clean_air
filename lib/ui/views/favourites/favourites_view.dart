import 'package:clean_air/models/user.dart';
import 'package:clean_air/ui/widgets/app_empty_state.dart';
import 'package:clean_air/ui/widgets/app_loading_indicator.dart';
import 'package:clean_air/ui/widgets/favourites/favourite_item.dart';
import 'package:clean_air/ui/widgets/layout_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import 'favourites_viewmodel.dart';

class FavouritesView extends StackedView<FavouritesViewModel> {
  const FavouritesView({super.key});

  @override
  Widget builder(context, viewModel, child) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: LayoutAppBar(
          title: 'Favourites',
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(3.r),
            child: const AppLoadingIndicator<FavouritesViewModel>(
              addBottomSpace: false,
            ),
          ),
        ),
      ),
      body: const _FavouritesList(),
    );
  }

  @override
  FavouritesViewModel viewModelBuilder(context) => FavouritesViewModel();
}

class _FavouritesList
    extends SelectorViewModelWidget<FavouritesViewModel, List<Favourite?>> {
  const _FavouritesList();

  @override
  Widget build(BuildContext context, List<Favourite?> value) {
    if (value.isEmpty) {
      return const Center(child: AppEmptyState());
    }

    return ListView.builder(
      padding: const EdgeInsets.only(top: 20, bottom: 20).r,
      itemCount: value.length,
      itemBuilder: (context, index) {
        return FavouriteItem(item: value[index]!);
      },
    );
  }

  @override
  List<Favourite?> selector(viewModel) => viewModel.favourites;
}
