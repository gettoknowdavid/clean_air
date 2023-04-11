import 'package:auto_size_text/auto_size_text.dart';
import 'package:clean_air/core/utils/aqi_helpers.dart';
import 'package:clean_air/models/search_data.dart';
import 'package:clean_air/ui/views/search/search_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

class SearchResultItem extends ViewModelWidget<SearchViewModel> {
  const SearchResultItem({super.key, required this.item});

  final SearchData? item;

  @override
  Widget build(BuildContext context, SearchViewModel viewModel) {
    final textTheme = Theme.of(context).textTheme;

    final aqi = int.parse(item!.aqi);

    final colorLegend = getColorLegend(aqi);
    final textColorLegend = getColorLegendTextColor(aqi);

    final station = item?.station?.name;
    final time = item?.time?.sTime;
    final geo = item?.station?.geo;

    return ListTile(
      onTap: () async => await viewModel.onItemSelect(geo!),
      leading: Container(
        height: 50.r,
        width: 50.r,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: colorLegend,
          borderRadius: const BorderRadius.all(
            Radius.circular(16),
          ).r,
        ),
        child: AutoSizeText(
          '$aqi',
          maxFontSize: 24,
          minFontSize: 18,
          style: textTheme.titleMedium?.copyWith(
            color: textColorLegend,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AutoSizeText(
            '$station',
            maxLines: 1,
            minFontSize: 14,
            maxFontSize: 16,
            overflow: TextOverflow.ellipsis,
          ),
          if (time != null) ...[
            2.verticalSpace,
            Text(
              DateFormat.yMMMMEEEEd().format(time),
              style: textTheme.bodySmall?.copyWith(
                color: textTheme.bodySmall?.color?.withOpacity(
                  0.5,
                ),
              ),
            ),
          ]
        ],
      ),
    );
  }
}
