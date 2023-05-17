import 'package:auto_size_text/auto_size_text.dart';
import 'package:clean_air/ui/common/app_constants.dart';
import 'package:clean_air/ui/views/home/home_viewmodel.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

class AqiValueWidget extends ViewModelWidget<HomeViewModel> {
  final void Function()? onTap;

  const AqiValueWidget({super.key, this.onTap});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    final neumorphicStyle = NeumorphicStyle(
      depth: 30,
      intensity: 0.56,
      lightSource: LightSource.top,
      shadowLightColor: viewModel.indexColor,
      shadowDarkColor: viewModel.indexColor,
      color: theme.colorScheme.background,
      boxShape: const NeumorphicBoxShape.circle(),
    );

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 0.7.sw,
        width: 0.7.sw,
        margin: const EdgeInsets.symmetric(horizontal: kGlobalPadding).r,
        padding: const EdgeInsets.all(8).r,
        child: Neumorphic(
          style: neumorphicStyle,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              16.verticalSpace,
              AutoSizeText(
                '${viewModel.airQuality!.aqi}',
                textAlign: TextAlign.center,
                minFontSize: 110,
                maxFontSize: 250,
                style: textTheme.displayLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: viewModel.indexColor,
                ),
              ),
              Text(
                'TAP TO LEARN MORE',
                textAlign: TextAlign.center,
                style: textTheme.bodySmall?.copyWith(
                  color: Colors.grey[600],
                  fontSize: 10.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
