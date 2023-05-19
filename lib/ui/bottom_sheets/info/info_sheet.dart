import 'package:clean_air/ui/common/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'info_sheet_model.dart';

class InfoSheet extends StackedView<InfoSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const InfoSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(context, viewModel, child) {
    final theme = Theme.of(context);

    return Container(
      padding: kGlobalHorizontalPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          14.verticalSpace,
          Text(
            request.title ?? 'Hello Stacked Sheet!!',
            style: theme.textTheme.titleLarge,
          ),
          if (request.description != null) ...[
            5.verticalSpace,
            Text(
              request.description!,
              style: theme.textTheme.bodyMedium,
              maxLines: 3,
              softWrap: true,
            ),
          ],
          20.verticalSpace,
          FilledButton(
            onPressed: () => completer!(SheetResponse()),
            style: FilledButton.styleFrom(
              textStyle: theme.textTheme.labelLarge,
              shape: RoundedRectangleBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10)).r,
              ),
            ),
            child: const Text('Okay'),
          ),
          20.verticalSpace,
        ],
      ),
      decoration: BoxDecoration(
        color: theme.colorScheme.background,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
    );
  }

  @override
  InfoSheetModel viewModelBuilder(BuildContext context) => InfoSheetModel();
}
