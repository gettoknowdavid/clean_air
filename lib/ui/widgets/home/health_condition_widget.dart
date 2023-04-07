import 'package:clean_air/ui/views/home/home_viewmodel.dart';
import 'package:clean_air/ui/widgets/home/aqi_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

class HealthConditionWidget extends ViewModelWidget<HomeViewModel> {
  const HealthConditionWidget({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    final theme = Theme.of(context);

    return AqiSection(
      title: 'HEALTH CONDITION',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Please wear a nose mask to protect yourself from the bad air.',
            style: theme.textTheme.bodySmall,
          ),
          5.verticalSpace,
        ],
      ),
    );
  }
}
