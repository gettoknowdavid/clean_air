import 'package:clean_air/ui/common/app_constants.dart';
import 'package:clean_air/ui/widgets/home/aqi_value_widget.dart';
import 'package:clean_air/ui/widgets/home/city_name_widget.dart';
import 'package:clean_air/ui/widgets/home/home_app_bar.dart';
import 'package:clean_air/ui/widgets/home/pollutants_grid_view.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({super.key});

  @override
  bool get fireOnViewModelReadyOnce => false;

  @override
  Widget builder(context, viewModel, child) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: kGlobalPadding).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            10.verticalSpace,
            const CityNameWidget(),
            20.verticalSpace,
            const Center(child: AqiValueWidget()),
            20.verticalSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0).r,
              child: const Text(
                'Outdoor activities should be reduced, masks should be worn '
                'when going out, and sensitive people should stay indoors.',
                textAlign: TextAlign.center,
              ),
            ),
            30.verticalSpace,
            const PollutantsGridView(),
          ],
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(context) => HomeViewModel();
}
