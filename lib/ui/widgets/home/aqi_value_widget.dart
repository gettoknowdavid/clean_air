import 'package:auto_size_text/auto_size_text.dart';
import 'package:clean_air/ui/common/app_constants.dart';
import 'package:clean_air/ui/views/home/home_viewmodel.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

class AqiValueWidget extends ViewModelWidget<HomeViewModel> {
  const AqiValueWidget({super.key});

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

    return Container(
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
            AutoSizeText(
              '${viewModel.airQuality?.aqi}',
              textAlign: TextAlign.center,
              minFontSize: 90,
              style: textTheme.displayLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: viewModel.indexColor,
              ),
            ),
            Text(
              'USAQI',
              textAlign: TextAlign.center,
              style: textTheme.titleMedium?.copyWith(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}



// Color getviewModel.IndexColor(int index) {
//   Color color = kGreen;

//   if (index < 51) {
//     color = kGreen;
//   } else if (index < 101) {
//     color = kYellow;
//   } else if (index < 151) {
//     color = kOrange;
//   } else if (index < 201) {
//     color = kRed;
//   } else if (index < 301) {
//     color = kPurple;
//   } else {
//     color = kMaroon;
//   }
//   return color;
// }
