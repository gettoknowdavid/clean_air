import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'image_source_sheet_model.dart';

class ImageSourceSheet extends StackedView<ImageSourceSheetModel> {
  final Function(SheetResponse response) completer;
  final SheetRequest request;
  const ImageSourceSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(context, viewModel, child) {
    final theme = Theme.of(context);

    return Container(
      color: theme.colorScheme.background,
      child: Wrap(
        children: [
          6.verticalSpace,
          ListTile(
            leading: const Icon(PhosphorIcons.image),
            title: const Text('Pick from Gallery'),
            onTap: () async {
              final file = await viewModel.avatarChanged(true);
              completer(SheetResponse(data: file));
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(PhosphorIcons.camera),
            title: const Text('Use Camera'),
            onTap: () async {
              final file = await viewModel.avatarChanged(false);
              completer(SheetResponse(data: file));
            },
          ),
        ],
      ),
    );
  }

  @override
  ImageSourceSheetModel viewModelBuilder(context) => ImageSourceSheetModel();
}
