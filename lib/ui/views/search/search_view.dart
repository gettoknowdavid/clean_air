import 'package:clean_air/ui/common/app_constants.dart';
import 'package:clean_air/ui/common/validators.dart';
import 'package:clean_air/ui/widgets/app_empty_state.dart';
import 'package:clean_air/ui/widgets/app_loading_indicator.dart';
import 'package:clean_air/ui/widgets/app_text_field.dart';
import 'package:clean_air/ui/widgets/layout_app_bar.dart';
import 'package:clean_air/ui/widgets/search/search_result_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'search_view.form.dart';
import 'search_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'keyword', validator: Validators.validateName),
])
class SearchView extends StackedView<SearchViewModel> with $SearchView {
  SearchView({super.key});

  @override
  Widget builder(context, viewModel, child) {
    return Scaffold(
      appBar: LayoutAppBar(
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(3.r),
          child: const AppLoadingIndicator<SearchViewModel>(
            addBottomSpace: false,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            10.verticalSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kGlobalPadding).r,
              child: AppTextField(
                hint: 'Search city',
                controller: keywordController,
                focusNode: keywordFocusNode,
                prefixIcon: const Icon(PhosphorIcons.magnifyingGlass),
                textInputAction: TextInputAction.search,
                onFieldSubmitted: viewModel.search,
              ),
            ),
            20.verticalSpace,
            if (viewModel.result.isEmpty && !viewModel.isBusy) ...[
              20.verticalSpace,
              const AppEmptyState()
            ] else
              const SearchResultList()
          ],
        ),
      ),
    );
  }

  @override
  bool get disposeViewModel => false;

  @override
  bool get initialiseSpecialViewModelsOnce => true;

  @override
  void onViewModelReady(SearchViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  SearchViewModel viewModelBuilder(context) => SearchViewModel();
}
