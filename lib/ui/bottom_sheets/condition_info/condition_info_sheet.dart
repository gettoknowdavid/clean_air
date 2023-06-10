import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'condition_info_sheet_model.dart';

class ConditionInfoSheet extends StackedView<ConditionInfoSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const ConditionInfoSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(context, viewModel, child) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Container(
      padding: const EdgeInsets.fromLTRB(14, 8, 14, 8),
      constraints: BoxConstraints(maxHeight: 0.9.sh),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            14.verticalSpace,
            Text(
              "Understanding the Health Messages",
              style: textTheme.titleLarge?.copyWith(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            10.verticalSpace,
            const Text(
              "Our app uses a sophisticated algorithm to analyze the air quality data and provide you with relevant health messages based on your selected health condition. Here's how it works:",
            ),
            10.verticalSpace,
            const NumberedListItem(
              number: 1,
              content:
                  "Selected Health Condition: We consider the health condition you've chosen from the provided options, including asthma, high blood pressure, bronchitis, lung cancer, emphysema, or none. This helps us tailor the health message specifically for your condition.",
            ),
            7.verticalSpace,
            const NumberedListItem(
              number: 2,
              content:
                  "Pollutant Levels: We assess the levels of different pollutants in the air, including Ozone (O3), Particulate Matter 2.5 (PM2.5), Particulate Matter 10 (PM10), Nitrogen Dioxide (NO2), Sulfur Dioxide (SO2), and Carbon Monoxide (CO). These pollutants are measured in specific units, and their concentrations can vary throughout the day.",
            ),
            7.verticalSpace,
            const NumberedListItem(
              number: 3,
              content:
                  "Health Message Determination: Based on your selected health condition and the pollutant levels, our algorithm determines the appropriate health message. If the pollutant levels exceed certain thresholds known to trigger or worsen symptoms for your health condition, we provide a cautionary message to take necessary precautions or limit outdoor activities. If the pollutant levels are within safe limits, we assure you that the air quality is generally safe for your selected health condition.",
            ),
            7.verticalSpace,
            const NumberedListItem(
              number: 4,
              content:
                  "Learn More: If you want to learn more about how different pollutants affect specific health conditions, we recommend consulting with a healthcare professional or referring to reputable sources for detailed information.",
            ),
            16.verticalSpace,
            const Text(
              "Remember, air quality can change throughout the day, so it's important to stay updated and follow the health messages provided by our app. Your well-being is our priority, and we strive to provide you with accurate and timely information to help you make informed decisions about your health and outdoor activities.\n\nIf you have any further questions or concerns, feel free to reach out to our support team. Stay healthy and enjoy your day!",
            ),
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
      ),
      decoration: BoxDecoration(
        color: theme.bottomSheetTheme.backgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
    );
  }

  @override
  ConditionInfoSheetModel viewModelBuilder(BuildContext context) =>
      ConditionInfoSheetModel();
}

class NumberedListItem extends StatelessWidget {
  final int number;
  final String content;
  const NumberedListItem({
    super.key,
    required this.content,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 12,
          padding: const EdgeInsets.symmetric(vertical: 2.0),
          child: Text("$number.", style: textTheme.labelMedium?.copyWith()),
        ),
        4.horizontalSpace,
        Expanded(child: Text(content)),
      ],
    );
  }
}
