import 'package:auto_size_text/auto_size_text.dart';
import 'package:clean_air/ui/common/app_constants.dart';
import 'package:clean_air/ui/views/home/home_viewmodel.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

class HomeLeadingWidget extends SelectorViewModelWidget<HomeViewModel, String> {
  const HomeLeadingWidget({super.key});

  @override
  Widget build(BuildContext context, String value) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final leadingStyle = textTheme.titleMedium?.copyWith(fontSize: 14.r);

    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: kGlobalPadding).r,
      child: AutoSizeText(
        'Hi, David',
        maxFontSize: 20,
        minFontSize: 14,
        style: leadingStyle?.copyWith(fontWeight: FontWeight.w500),
      ),
    );
  }

  @override
  String selector(HomeViewModel viewModel) => viewModel.user?.name ?? '';
}
