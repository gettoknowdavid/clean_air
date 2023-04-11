import 'package:clean_air/models/search_data.dart';
import 'package:clean_air/ui/views/search/search_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import 'search_result_item.dart';

class SearchResultList
    extends SelectorViewModelWidget<SearchViewModel, List<SearchData?>> {
  const SearchResultList({super.key});

  @override
  Widget build(BuildContext context, List<SearchData?> value) {
    return ListView.separated(
      shrinkWrap: true,
      primary: false,
      separatorBuilder: (context, index) => 5.verticalSpace,
      padding: const EdgeInsets.only(bottom: 30).r,
      itemCount: value.length,
      itemBuilder: (context, index) => SearchResultItem(item: value[index]!),
    );
  }

  @override
  List<SearchData?> selector(viewModel) => viewModel.result;
}
