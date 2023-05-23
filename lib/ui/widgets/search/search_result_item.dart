import 'package:auto_size_text/auto_size_text.dart';
import 'package:clean_air/core/utils/aqi_helpers.dart';
import 'package:clean_air/models/search_data.dart';
import 'package:clean_air/ui/views/search/search_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:stacked/stacked.dart';

final kLikeIcon = PhosphorIcon(PhosphorIcons.fill.heart, color: Colors.red);
final kUnLikeIcon = PhosphorIcon(PhosphorIcons.regular.heart);

class SearchResultItem extends ViewModelWidget<SearchViewModel> {
  final SearchData item;

  const SearchResultItem({super.key, required this.item});

  @override
  Widget build(BuildContext context, SearchViewModel viewModel) {
    final textTheme = Theme.of(context).textTheme;

    final geo = item.station?.geo;
    final time = item.time?.sTime;

    return ListTile(
      onTap: viewModel.isBusy
          ? null
          : () async => await viewModel.onItemSelect(geo!),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 10,
      ).r,
      leading: _buildAqiValue(textTheme),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildStationName(),
          if (time != null) ...[
            2.verticalSpace,
            _buildDate(textTheme),
          ]
        ],
      ),
      trailing: IconButton(
        onPressed: () => viewModel.onFavouriteTap(item),
        icon: viewModel.isFavourite(item) ? kLikeIcon : kUnLikeIcon,
      ),
    );
  }

  Widget _buildAqiValue(TextTheme textTheme) {
    final aqi = int.parse(item.aqi);
    final colorLegend = getColorLegend(aqi);
    final textColorLegend = getColorLegendTextColor(aqi);

    return Container(
      height: 50.r,
      width: 50.r,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: colorLegend,
        borderRadius: const BorderRadius.all(Radius.circular(16)).r,
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
    );
  }

  Widget _buildDate(TextTheme textTheme) {
    return Text(
      DateFormat.yMMMMEEEEd().format(item.time!.sTime!),
      style: textTheme.bodySmall?.copyWith(
        color: textTheme.bodySmall?.color?.withOpacity(0.5),
      ),
    );
  }

  AutoSizeText _buildStationName() {
    return AutoSizeText(
      '${item.station?.name}',
      maxLines: 1,
      minFontSize: 14,
      maxFontSize: 16,
      overflow: TextOverflow.ellipsis,
    );
  }
}
