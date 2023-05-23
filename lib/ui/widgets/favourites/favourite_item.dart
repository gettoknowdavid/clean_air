import 'package:auto_size_text/auto_size_text.dart';
import 'package:clean_air/core/utils/aqi_helpers.dart';
import 'package:clean_air/models/user.dart';
import 'package:clean_air/ui/views/favourites/favourites_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:stacked/stacked.dart';

class FavouriteItem extends ViewModelWidget<FavouritesViewModel> {
  final Favourite item;

  const FavouriteItem({super.key, required this.item});

  @override
  Widget build(BuildContext context, FavouritesViewModel viewModel) {
    final textTheme = Theme.of(context).textTheme;

    final geo = item.geo;
    final time = item.time;

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
        onPressed: () => viewModel.delete(item),
        icon: PhosphorIcon(PhosphorIcons.regular.trash, color: Colors.red),
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
      DateFormat.yMMMMEEEEd().format(item.time!),
      style: textTheme.bodySmall?.copyWith(
        color: textTheme.bodySmall?.color?.withOpacity(0.5),
      ),
    );
  }

  AutoSizeText _buildStationName() {
    return AutoSizeText(
      '${item.name}',
      maxLines: 1,
      minFontSize: 14,
      maxFontSize: 16,
      overflow: TextOverflow.ellipsis,
    );
  }
}
