import 'package:auto_size_text/auto_size_text.dart';
import 'package:clean_air/core/helpers/get_color_legend.dart';
import 'package:clean_air/ui/common/app_constants.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AqiValueWidget extends StatelessWidget {
  final int aqi;
  final void Function()? onTap;

  const AqiValueWidget({super.key, required this.aqi, this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    final neumorphicStyle = NeumorphicStyle(
      depth: 30,
      intensity: 0.56,
      lightSource: LightSource.top,
      shadowLightColor: getColorLegend(aqi),
      shadowDarkColor: getColorLegend(aqi),
      color: theme.colorScheme.background,
      boxShape: const NeumorphicBoxShape.circle(),
    );

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 0.35.sh,
        width: 0.35.sh,
        margin: const EdgeInsets.symmetric(horizontal: kGlobalPadding).r,
        padding: const EdgeInsets.all(kGlobalPadding).r,
        child: Neumorphic(
          style: neumorphicStyle,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              16.verticalSpace,
              AutoSizeText(
                '$aqi',
                textAlign: TextAlign.center,
                minFontSize: 90,
                style: textTheme.displayLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: getColorLegend(aqi),
                ),
              ),
              4.verticalSpace,
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
